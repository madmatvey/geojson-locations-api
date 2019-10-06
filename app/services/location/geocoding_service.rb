# frozen_string_literal: true

class Location::GeocodingService
  def call(location:)
    return unless location

    geocodes = Geocoder.search(location.name)
    coordinates = fabrica.point(*geocodes.first.coordinates)
    location.update(coordinates: coordinates, geocoder_data: geocodes)
  end

  private

  def fabrica
    RGeo::Geographic.spherical_factory(srid: 4326)
  end
end
