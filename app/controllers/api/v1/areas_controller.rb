# frozen_string_literal: true

class Api::V1::AreasController < ApplicationController
  def index
    @areas = Area.all
    json_response(geojson(@areas))
  end

  private

  def geojson(areas)
    entity_factory = RGeo::GeoJSON::EntityFactory.instance
    collection = areas.map { |area| entity_factory.feature(area.coordinates) }
    object = entity_factory.feature_collection(collection)
    RGeo::GeoJSON.encode(object)
  end
end
