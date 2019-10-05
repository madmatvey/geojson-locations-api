# frozen_string_literal: true

module FixtureHelper
  def example(name, ext = "json")
    File.read(Rails.root.join("spec", "fixtures", "#{name}.#{ext}"))
  end

  def json_example(name)
    JSON.parse(example(name))
  end
end
