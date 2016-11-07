require './setting'

Lita.configure do |config|
  # https://docs.lita.io/getting-started/configuration/
  config.robot.name = 'lita'
  config.robot.alias = '@'
  config.robot.log_level = :info
  config.robot.adapter = :shell
  config.redis = Setting.redis
  config.http.host = Setting.http.host
  config.http.port = Setting.http.port
end
