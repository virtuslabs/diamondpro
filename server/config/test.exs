use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :server, Server.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :server, Server.Repo,
username: System.get_env("DB_USER"),
password: System.get_env("DB_PASS"),
database: System.get_env("DB_NAME"),
hostname: System.get_env("DB_HOST"),
pool: Ecto.Adapters.SQL.Sandbox
