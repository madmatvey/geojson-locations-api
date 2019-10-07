# frozen_string_literal: true

require "rails_helper"

describe Location::GeocodingWorker do
  let(:service_instance) { instance_double(Location::GeocodingService) }

  context "when location found" do
    let(:location) { create(:location) }

    it "calls GeocodingService" do
      allow(Location::GeocodingService).to receive(:new).and_return(service_instance)

      expect(service_instance).to receive(:call).with(location: location) # rubocop:disable RSpec/MessageSpies
      described_class.new.perform(location.id)
    end
  end

  context "when location not found" do
    it "calls GeocodingService" do
      expect { described_class.new.perform(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
