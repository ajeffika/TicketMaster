# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :incidents
    end
  end
end
