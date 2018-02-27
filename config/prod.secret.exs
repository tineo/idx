use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :dgtidx,
  board: "1",
  queue: "to_process_w1",
  exchange: "ex_w1",
  queue_full: "",
  exchange_full: ""


config :dgtidx, DgtidxWeb.Endpoint,
  secret_key_base: "nVRxKD7iZcCa1UsjkeWFLyLwWGJ8uAWfvClmHi03tWTMX3wZ5RsEAEvjY8GjKVdj"

# Configure your database
config :dgtidx, Dgtidx.Repo,
  adapter: Ecto.Adapters.MySQL,
  hostname: "138.197.96.25",
  username: "root",
  password: ~s(g&vkgm2E#Z98Us%Lima),
  database: "idx18test",
  pool_size: 15


# Configure your rabbitmq
config :dgtidx, Dgtidx.RabbitMap,
  url: "amqp://tineo:tineo@104.131.75.179"

# Configure your redis
config :dgtidx, Dgtidx.RedisMap,
  rds: "redis://127.0.0.1:6379/3",
  rds_city: "redis://127.0.0.1:6379/4",
  rds_office: "redis://127.0.0.1:6379/5",
  rds_agent: "redis://127.0.0.1:6379/6",
  rds_county: "redis://127.0.0.1:6379/8"