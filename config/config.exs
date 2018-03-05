  # This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dgtidx,
  ecto_repos: [Dgtidx.Repo, Dgtidx.RepoGeo]

# Configures the endpoint
config :dgtidx, DgtidxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uQ2f90imZK3oS3amenwkKVX0EKl66n5RkR4w31jxs4VHAPtAXR7lXWR6YEY3nuYY",
  render_errors: [view: DgtidxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dgtidx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
