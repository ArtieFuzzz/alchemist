import Config

config :nostrum,
  token: System.get_env("DISCORD_TOKEN"),
  prefix: System.get_env("PREFIX") || ">"
  gateway_intents: [
    :guild_messages,
    :guild_members,
    :guilds
  ]

import_config "#{config_env()}.exs"
