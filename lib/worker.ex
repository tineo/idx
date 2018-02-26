defmodule Dgtidx.Worker do
  use GenServer

  @queue  Application.get_env(:dgtidx, :queue)
  @exchange  Application.get_env(:dgtidx, :exchange)

  ## Client API

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: :publisher)
  end

  def publish(message) do
    IO.puts "handling cast.. "
    GenServer.cast(:publisher, {:publish, message})
  end

  ## Server Callbacks

  def init(:ok) do
    config  = Application.get_env(:dgtidx, Dgtidx.RabbitMap)
    {:ok, connection} = AMQP.Connection.open(config[:url])
    {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Queue.declare(channel, @queue, durable: true)
    AMQP.Exchange.direct(channel, @exchange, durable: true)
    AMQP.Queue.bind(channel, @queue, @exchange)

    {:ok, %{channel: channel, connection: connection} }
  end

  def handle_cast({:publish, message}, state) do
    IO.puts "publish..."
    IO.puts message
    IO.inspect state.channel
    AMQP.Basic.publish(state.channel, @exchange, "", message)
    {:noreply, state}
  end

  def terminate(_reason, state) do
    AMQP.Connection.close(state.connection)
  end
end