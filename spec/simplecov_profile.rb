# frozen_string_literal: true

require "simplecov"
require "coveralls"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter([SimpleCov::Formatter::HTMLFormatter,
                                                            Coveralls::SimpleCov::Formatter])
SimpleCov.minimum_coverage 100
SimpleCov.profiles.define "rails customized" do
  load_profile "rails"
  add_group "Services", "app/services"
  add_filter "spec/"
  add_filter "Rakefile"
  add_filter "lib/tasks/"
end
