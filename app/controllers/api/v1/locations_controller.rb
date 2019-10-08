# frozen_string_literal: true

class Api::V1::LocationsController < ApplicationController
  def create
    location = Location.create(name: params[:name])
    return json_response(error: location.errors) unless location.id

    Location::GeocodingWorker.perform_in(2.seconds, location.id)
    json_response(id: location.id)
  end

  def show
    location = Location.where(id: params[:id]).first
    return json_response(errors: { location: "not found" }) unless location

    json_response(Location::FetchInfoService.new.call(location: location))
  end
end
