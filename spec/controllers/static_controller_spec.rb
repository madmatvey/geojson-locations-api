# frozen_string_literal: true

require "rails_helper"

describe StaticController, type: :controller do
  describe ".index" do
    it "return page successfuly" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
