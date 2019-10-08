# frozen_string_literal: true

require "rails/application_controller"

class StaticController < Rails::ApplicationController
  def index
    render html: "./README.md", layout: false
  end
end
