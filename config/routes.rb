# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    #mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      resources :incidents
    end

  end
end
