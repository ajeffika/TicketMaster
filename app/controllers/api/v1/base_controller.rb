# frozen_string_literal: true

class Api::V1::BaseController < Api::BaseController
  respond_to :json

  # before_action :authenticate_user!, :deep_underscore_params!
  protect_from_forgery with: :null_session

  include IncidentScopeHelper
end
