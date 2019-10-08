# frozen_string_literal: true

class Location::FetchInfoService
  attr_accesor :location

  def call(location:)
    @location = location

    { name: location.name, coordinates: location.coordinates, inside: inside? }
  end

  private

  def inside?
    Area.where("ST_Intersects(areas.coordinates, :location) IS true", location: location.coordinates).any?
  end
end
