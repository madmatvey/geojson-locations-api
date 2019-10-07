# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { "MyString" }
    coordinates { nil }
    geocoder_data { nil }
  end
end
