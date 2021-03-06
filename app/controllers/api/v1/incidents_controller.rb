# frozen_string_literal: true

class Api::V1::IncidentsController < Api::V1::BaseController

  def index
    if params[:userId].present?
      incidents = Incident.where(user_id: current_user.id)
    elsif params[:groupIds].present?
      incidents = Incident.where(group_id: params[:groupIds]).to_resolve
    end
    render json: incidents
  end

  def show
    incident = Incident.find(params[:id])

    render json: incident
  end

  def destroy
    incident = Incident.find(params[:id])
    incident.destroy
    render json: incidents
  end

  def create
    incident = current_user.incidents.new(incident_params)
    incident.user_id = current_user.id
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
                                        status
                                        pending
                                        group_id
                                        user_id
                                        category_id
                                        attachment
                                        comment
                                        step
                                        created_by
                                        modified_by])
  end
end
