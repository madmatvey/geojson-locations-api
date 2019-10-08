# frozen_string_literal: true

require "simplecov_profile"
require "coveralls"
Coveralls.wear!("rails")
SimpleCov.start "rails customized"

require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "vcr"
require "sidekiq/testing"

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.before do
    Sidekiq::Worker.clear_all
  end
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
  config.include FixtureHelper
  config.include GeographicHelper
  config.include RequestParseHelper
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true
end

Sidekiq::Testing.fake!
