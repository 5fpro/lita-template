require './setting'

Lita.configure do |config|
  # https://docs.lita.io/getting-started/configuration/
  config.robot.name = 'lita'
  config.robot.alias = '@'
  config.robot.log_level = :debug
  config.redis = Setting.redis.symbolize_keys
  config.http.host = Setting.http.host
  config.http.port = Setting.http.port

  # adapters

  config.robot.adapter = :shell

  # config.robot.adapter = :slack
  # config.adapters.slack.token = Setting.adapter.slack.token

  # config.robot.adapter = :flowdock
  # config.adapters.flowdock.api_token = Setting.adapter.flowdock.token
  # config.adapters.flowdock.organization = Setting.adapter.flowdock.organization
  # config.adapters.flowdock.flows = Setting.adapter.flowdock.flows
end
