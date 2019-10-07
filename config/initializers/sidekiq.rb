# frozen_string_literal: true

require "sidekiq-limit_fetch"

uri = URI.parse(ENV.fetch("REDISTOGO_URL", "redis://localhost:6379"))
redis = {
  host: uri.host,
  port: uri.port,
  password: uri.password
}

Sidekiq.configure_client do |config|
  config.redis = redis
end

Sidekiq.configure_server do |config|
  config.redis = redis
end
