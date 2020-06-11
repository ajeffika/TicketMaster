# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: devise_permitted_keys)
    devise_parameter_sanitizer.permit(:account_update, keys: devise_permitted_keys)
  end

  def devise_permitted_keys
    %i[email password password_confirmation first_name last_name username gender permissions band]
  end
end