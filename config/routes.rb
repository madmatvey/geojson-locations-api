# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#index"
  mount Sidekiq::Web => "/sidekiq"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :areas, only: %i[index]
      resources :locations, only: %i[create show]
    end
  end
end
