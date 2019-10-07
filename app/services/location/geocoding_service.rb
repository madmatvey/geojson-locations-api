# frozen_string_literal: true

class Location::GeocodingService
  def call(location:)
    return unless location

    geocodes = Geocoder.search(location.name)
    location.update(geocoder_data: geocodes)
    return unless geocodes.first

    coordinates = fabrica.point(*geocodes.first.coordinates)
    return unless coordinates

    location.update(coordinates: coordinates)
  end

  private

  def fabrica
    RGeo::Geographic.spherical_factory(srid: 4326)
  end
end
