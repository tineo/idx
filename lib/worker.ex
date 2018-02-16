defmodule Dgtidx.Worker do
  use GenServer

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
    {:ok, connection} = AMQP.Connection.open("amqp://tineo:tineo@104.131.75.179")
    {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Queue.declare(channel, "to_process_w2", durable: true)
    AMQP.Exchange.direct(channel, "ex_w2", durable: true)
    AMQP.Queue.bind(channel, "to_process_w2", "ex_w2")

    {:ok, %{channel: channel, connection: connection} }
  end

  def handle_cast({:publish, message}, state) do
    IO.puts "publish..."
    IO.puts message
    IO.inspect state.channel
    AMQP.Basic.publish(state.channel, "ex_w2", "", message)
    {:noreply, state}
  end

  def terminate(_reason, state) do
    AMQP.Connection.close(state.connection)
  end
end