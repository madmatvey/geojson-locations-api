# frozen_string_literal: true

require "rails_helper"

describe Location::FetchInfoService do
  describe "#call" do
    let(:location) { create(:location, name: name, coordinates: coordinates, geocoder_data: geocoder_data) }
    let(:geojson) { json_example("given_areas") }
    let(:geojson_decoded) { RGeo::GeoJSON.decode(geojson) }

    before do
      geojson_decoded.each do |decode|
        create(:area, coordinates: decode.geometry)
      end
    end

    context "when location valid" do
      let(:geocoder_data) { ["data" => "some valid data"] }

      context "when location inside areas" do
        let(:coordinates) { geo_point("16.6113382", "49.1922443") }
        let(:name) { "Brno" }

        it "return hash with location info" do
          expect(described_class.new.call(location: location)).to match(
            name: "Brno", coordinates: { latitude: 49.1922443, longitude: 16.6113382 }, inside?: true
          )
        end
      end

      context "when location not inside areas" do
        let(:coordinates) { geo_point("-122.3300624", "47.6038321") }
        let(:name) { "Seattle" }

        it "return hash with location info" do
          expect(described_class.new.call(location: location)).to match(
            name: "Seattle", coordinates: { latitude: 47.6038321, longitude: -122.3300624 }, inside?: false
          )
        end
      end
    end

    context "when location not valid" do
      let(:coordinates) { nil }

      context "when location name invalid" do
        let(:geocoder_data) { [] }
        let(:name) { "Abracadabra-city" }

        it "return hash with name error" do
          expect(described_class.new.call(location: location)).to match(
            errors: [{ name: "invalid input" }]
          )
        end
      end

      context "when location geocoding in progress" do
        let(:geocoder_data) { nil }
        let(:name) { "New York" }

        it "return hash with geocoding not complete error" do
          expect(described_class.new.call(location: location)).to match(
            errors: [{ geocoding: "not complete" }]
          )
        end
      end

      context "when location geocoding failed" do
        let(:geocoder_data) { ["data" => "some valid data"] }
        let(:name) { "New Hampshire" }

        it "return hash with geocoding not complete error" do
          expect(described_class.new.call(location: location)).to match(
            errors: [{ geocoding: "failed" }]
          )
        end
      end
    end
  end
end
