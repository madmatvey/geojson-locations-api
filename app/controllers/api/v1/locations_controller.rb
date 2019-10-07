# frozen_string_literal: true

class Api::V1::LocationsController < ApplicationController
  def create
    location = Location.create(name: params[:name])
    return json_response(error: location.errors) unless location.id

    Location::GeocodingWorker.perform_in(2.seconds, location.id)
    json_response(id: location.id)
  end
end
