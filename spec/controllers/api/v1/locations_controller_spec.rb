# frozen_string_literal: true

require "rails_helper"

describe Api::V1::LocationsController, type: :controller do # rubocop:disable Metrics/BlockLength
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

  private

  def subject_json
    JSON.parse(response.body)
  end
end
