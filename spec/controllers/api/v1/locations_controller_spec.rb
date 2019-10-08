# frozen_string_literal: true

require "rails_helper"

describe Api::V1::LocationsController, type: :controller do
  describe ".create" do
    subject(:create_request) { post :create, params: { name: name } }

    let(:name) { "Wroclaw" }

    context "when name has not already been taken" do
      it "returns id if created location" do
        create_request
        expect(subject_json).to match("id" => Location.last.reload.id)
      end

      it "does not raise an exception" do
        expect { create_request }.not_to raise_error
      end
    end

    context "when name has already been taken" do
      before do
        create(:location, name: name)
      end

      it "returns id if created location" do
        create_request
        expect(subject_json).to match("error" => { "name" => ["has already been taken"] })
      end

      it "does not raise an exception" do
        expect { create_request }.not_to raise_error
      end
    end
  end

  describe ".show" do
    subject(:show_request) { get :show, params: { id: location.id } }

    let(:location) do
      create(:location, name: "Wroclaw",
                        coordinates: geo_point("17.0326689", "51.1089776"),
                        geocoder_data: ["data" => "some valid data"])
    end

    it "returns area json" do
      show_request
      expect(subject_json).to match(
        "name" => "Wroclaw", "coordinates" => { "latitude" => 51.1089776, "longitude" => 17.0326689 },
        "inside?" => false
      )
    end

    it "does not raise an exception" do
      expect { show_request }.not_to raise_error
    end
  end
end
