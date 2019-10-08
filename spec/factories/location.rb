# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    sequence(:name) { |id| "Test location #{id}" }
    coordinates { nil }
    geocoder_data { nil }
  end
end
