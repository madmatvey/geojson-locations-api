# frozen_string_literal: true

class Location::FetchInfoService
  attr_reader :location, :errors

  def call(location:)
    @location = location
    @errors = []
    check_location_errors
    return { errors: errors } if errors.any?

    { name: location.name,
      coordinates: { latitude: location.coordinates.latitude,
                     longitude: location.coordinates.longitude },
      inside?: inside? }
  end

  private

  def inside?
    Area.where("ST_Intersects(areas.coordinates, :location) IS true", location: location.coordinates).any?
  end

  def check_location_errors
    return @errors << { name: "invalid input" } if location.geocoder_data == []
    return @errors << { geocoding: "not complete" } if location.geocoder_data.nil? || location.geocoder_data.nil?

    @errors << { geocoding: "failed" } if location.coordinates.nil?
  end
end
