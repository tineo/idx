defmodule Dgtidx.Consumer do
  @moduledoc """
  Consumer can init multiple and different Receivers.
  Each receiver open one or differents connection to RabbitMQ
  """
  use GenServer

  @doc """
  Start the consumer from main Supervisor
  """
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: :consumer)
  end

  def init(:ok) do
    Dgtidx.Receiver.wait_for_messages()
  end

  @doc """

  """
  def start_receiver do
    Dgtidx.Receiver.wait_for_messages()
  end

end
