# frozen_string_literal: true

class Api::BaseController < ActionController::Base
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!
end
