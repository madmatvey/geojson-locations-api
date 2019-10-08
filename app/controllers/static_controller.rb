# frozen_string_literal: true

require "rails/application_controller"

class StaticController < Rails::ApplicationController
  def index
    render html: Kramdown::Document.new(File.read("./README.md")).to_html, layout: false
  end
end
