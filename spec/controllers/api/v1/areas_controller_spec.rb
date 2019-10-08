# frozen_string_literal: true

require "rails_helper"

describe Api::V1::AreasController, type: :controller do
  let(:geojson) { json_example("given_areas") }
  let(:geojson_decoded) { RGeo::GeoJSON.decode(geojson) }

  describe ".index" do
    subject(:index_request) { get :index }

    before do
      geojson_decoded.each do |decode|
        create(:area, coordinates: decode.geometry)
      end
    end

    it "returns area json" do
      index_request
      expect(subject_json).to match(geojson)
    end

    it "does not raise an exception" do
      expect { index_request }.not_to raise_error
    end
  end
end
