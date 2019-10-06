# frozen_string_literal: true

class Api::V1::LocationsController < ApplicationController
  def create
    location = Location.find_or_create_by!(name: params[:name])
    Location::GeocodingWorker.perform_at(5.seconds.ago, location.id)
    json_response(id: location.id)
  end
end
