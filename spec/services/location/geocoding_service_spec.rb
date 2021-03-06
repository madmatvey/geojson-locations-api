# frozen_string_literal: true

require "rails_helper"

describe Location::GeocodingService do
  describe "#call" do
    let(:location) { create(:location, name: name) }

    context "when name can be geolocated" do
      let(:name) { "Wroclaw" }

      it "updates geocoder_data" do # rubocop:disable RSpec/MultipleExpectations
        VCR.use_cassette("location-#{name.downcase}-geocodes") do
          described_class.new.call(location: location)
        end
        expect(location.reload.geocoder_data.first["data"]["lat"]).to match("51.1089776")
        expect(location.reload.geocoder_data.first["data"]["lon"]).to match("17.0326689")
      end

      it "updates coordinates" do
        VCR.use_cassette("location-#{name.downcase}-geocodes") do
          described_class.new.call(location: location)
        end
        expect(location.reload.coordinates).to be_kind_of(RGeo::Geographic::SphericalPointImpl)
      end
    end
  end
end
