defmodule Dgtidx.Consumer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: :consumer)
  end

  def init(:ok) do
    Receiver.wait_for_messages()
  end
  def start_receiver do
    Receiver.wait_for_messages()
  end

end
