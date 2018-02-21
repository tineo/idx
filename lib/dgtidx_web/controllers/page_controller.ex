defmodule DgtidxWeb.PageController do
  use DgtidxWeb, :controller

  def index(conn, _params) do
    #memory_usage = :erlang.memory[:total]/1048576
    render conn, "index.html"
  end

  def memory_usage(conn, _params) do
    memory_usage = :erlang.memory[:total]/1048576
    json conn, %{memory_usage: memory_usage}
  end
end
