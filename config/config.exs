# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :hot_test, HotTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A8M72HoQF5mYbp8+7UmEag/sL2uOsBIIOjonEgNVCj3O0J/n9WA3XJ5M0nht2uWB",
  render_errors: [view: HotTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HotTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
