# frozen_string_literal: true

class Api::V2::BaseController < ActionController::Base
  before_action :authenticate_user!
end
