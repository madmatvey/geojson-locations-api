# frozen_string_literal: true

module GeographicHelper
  def geo_point(lon, lat)
    factory.point(lon, lat)
  end

  private

  def factory
    RGeo::Geographic.spherical_factory(srid: 4326)
  end
end
