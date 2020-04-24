# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :sessions
  root 'pages#home'
  namespace :api do
    namespace :v1 do
      resources :incidents
    end
  end
end
