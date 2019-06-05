# frozen_string_literal: true

class Api::V1::BaseController < Api::BaseController
  include FlashableConcern
  respond_to :json
  # before_action :authenticate_user!, :deep_underscore_params!
  protect_from_forgery with: :null_session

  include IncidentScopeHelper
end
