require './setting'

Lita.configure do |config|
  # https://docs.lita.io/getting-started/configuration/
  config.robot.name = 'lita'
  config.robot.alias = '@'
  config.robot.log_level = :info
  config.redis = Setting.redis.symbolize_keys
  config.robot.adapter = :slack
  config.adapters.slack.token = Setting.slack.adapter.token
  config.http.host = Setting.http.host
  config.http.port = Setting.http.port
end
