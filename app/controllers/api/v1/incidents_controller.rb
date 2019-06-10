# frozen_string_literal: true

class Api::V1::IncidentsController < Api::V1::BaseController
  respond_to :json

  def index
    @incidents = IncidentsQuery.new.fetch
    render json: @incidents
  end

  def new
    build_and_authorize
  end

  def create
    incident = Incident.new(incident_params)
    if incident.save
      render json: { data: IncidentSerializer.new(incident) }.merge!(flash_action)
    else
      render json: flash_action
    end
  end

  private

  def build_and_authorize
    @incident = Incident.new
  end

  def incident_params
    params.require(:incident).permit(%i[title
                                        description
                                        user_id
                                        status
                                        pending
                                        group_id
                                        category_id
                                        attachment
                                        comment
                                        step])
  end
end
