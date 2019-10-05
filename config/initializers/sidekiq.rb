# frozen_string_literal: true

require "sidekiq-limit_fetch"

redis = {
  host: ENV.fetch("REDIS_HOST", "localhost"),
  port: ENV.fetch("REDIS_PORT", 6379),
  db: ENV.fetch("REDIS_SIDEKIQ_DB", 1)
}

Sidekiq.configure_client do |config|
  config.redis = redis
end

Sidekiq.configure_server do |config|
  config.redis = redis
end
