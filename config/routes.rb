# frozen_string_literal: true

Rails.application.routes.draw do

  get 'vue_application/index'
  root 'vue_application#index'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :incidents
      resources :users
      resources :categories
      resources :groups

      scope :validations do
        post '/validate-uniqueness', to: 'validations#validate_uniqueness'
      end
    end
  end
  get '/*path', to: 'vue_application#index', format: :html

end
