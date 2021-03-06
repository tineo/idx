defmodule DgtidxWeb.Router do
  use DgtidxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DgtidxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/memory", PageController, :memory_usage
  end

  # Other scopes may use custom stacks.
  # scope "/api", DgtidxWeb do
  #   pipe_through :api
  # end
end
