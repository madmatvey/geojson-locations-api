# frozen_string_literal: true

class Location::GeocodingWorker < ApplicationWorker
  sidekiq_options queue: "geocoding", retry: 3

  def perform(location_id)
    location = Location.find(location_id)
    Location::GeocodingService.new.call(location: location)
  end
end
