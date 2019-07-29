# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :incidents
      resources :addresses
      resources :categories
      resources :contractors
      resources :groups
      resources :slas
      resources :users
    end
  end
end
