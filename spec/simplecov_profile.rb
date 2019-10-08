# frozen_string_literal: true

require "simplecov"
# Check to see if we're inside a CI environment. If not, we don't want to override the default formatter.
if ENV["CI"]
  require "coveralls"
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

SimpleCov.minimum_coverage 100
SimpleCov.profiles.define "rails customized" do
  load_profile "rails"
  add_group "Services", "app/services"
  add_filter "spec/"
  add_filter "Rakefile"
  add_filter "lib/tasks/"
end
