import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_project0_web, PhxProject0Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "hqALwzvmQwmvEeHCJlLFkwMfEm4wgemjJ5EUIXG9/SSL0NLkgW3AgoDaOiL6RIz3",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :phx_project0, PhxProject0.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
