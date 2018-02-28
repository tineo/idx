defmodule Dgtidx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :dgtidx,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),
      # Docs
      name: "DGTIDX",
      source_url: "https://github.com/dgtalliance/trem-mq",
      homepage_url: "https://github.com/dgtalliance/trem-mq",
      docs: [
        #main: "Trem-mq",
        logo: "priv/static/images/mq.png",
        extras: ["README.md"]]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Dgtidx.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:mariaex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:amqp, "~> 0.2.0-pre.4"}, # https://github.com/pma/amqp/issues/28
      {:briefly, "~> 0.3"},
      {:ex_aws, "~> 1.0"},
      {:hackney, "~> 1.6"},
      {:poison, "~> 3.1"},
      {:redix, ">= 0.0.0"},
      {:timex, "~> 3.1"},
      {:php_serializer, "~> 0.9.0"},
     # {:httpoison, "~> 1.0"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:distillery, "~> 1.5", runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
