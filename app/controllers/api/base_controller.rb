# frozen_string_literal: true

class Api::BaseController < ActionController::Base
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :authenticate_user!
  # before_action :set_current_user

  def set_current_user
    User.current_user = current_user if current_user
  end
end
