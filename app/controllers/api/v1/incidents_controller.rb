# frozen_string_literal: true

class Api::V1::IncidentsController < Api::V1::BaseController
  def index
    @incidents = IncidentsQuery.new(current_user).fetch
    render json: @incidents
  end

  def show
    incident = Incident.find(params[:id])

    render json: incident
  end

  def destroy
    incident = Incident.find(params[:id])
    incident.destroy
    render json: @incidents
  end

  def create
    incident = Incident.new(incident_params)
    if incident.save
      render json: incident
    else
      render json: 'Record did not save'
    end
  end

  def update
    incident = Incident.find(incident_params[:id])

    if incident.update(incident_params)
      render json: incident
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
                                        step
                                        created_by
                                        modified_by])
  end
end
