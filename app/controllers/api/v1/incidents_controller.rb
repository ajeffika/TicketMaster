# frozen_string_literal: true
class Api::V1::IncidentsController < Api::V1::BaseController
  def index
    @incidents = IncidentsQuery.new.fetch
    render json: @incidents
  end

  def show
    incident = Incident.find(params[:id])

    render json: { data: IncidentSerializer.new(incident) }
  end

  def create
    incident = Incident.new(incident_params)
    if incident.save
      render json: { data: IncidentSerializer.new(incident) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    incident = Incident.find(incident_params[:id])

    if incident.update(incident_params)
      render json: { data: IncidentSerializer.new(incident) }
    else
      render json: 'Record did not save'
    end
  end

  private

  def incident_params
    params.require(:incident).permit(%i[id
                                        title
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
