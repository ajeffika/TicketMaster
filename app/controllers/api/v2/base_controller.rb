# frozen_string_literal: true

class Api::V2::BaseController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!
end
