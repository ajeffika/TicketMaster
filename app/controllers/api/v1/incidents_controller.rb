# frozen_string_literal: true

class Api::V1::IncidentsController < Api::V1::BaseController
  respond_to :json

  def index
    @incidents = Incident.find_by group: groups_scope
    render json: @incidents
  end
end
