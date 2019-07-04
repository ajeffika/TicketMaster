# frozen_string_literal: true

class Api::V1::BaseController < Api::BaseController
  respond_to :json
  protect_from_forgery with: :null_session
end
