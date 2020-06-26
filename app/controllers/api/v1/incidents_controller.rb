# frozen_string_literal: true

class Api::V1::IncidentsController < Api::V1::BaseController

  def index
    @incidents = IncidentsQuery.new(current_user).fetch
    render json: @incidents
  end

  def show
    incident = Incident.friendly.find(params[:id])

    render json: incident
  end

  def destroy
    incident = Incident.friendly.find(params[:id])
    incident.destroy
    render json: @incidents
  end

  def create
    binding.pry
    incident = current_user.incidents.new(incident_params)
    incident.attachment.attach(params[:attachment])
    if incident.save
      render json: incident
    else
      render json: 'Record did not save'
    end
  end

  def update
    incident = current_user.incidents.friendly.find(incident_params[:id])

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
                                        category_id
                                        attachment
                                        comment
                                        step
                                        created_by
                                        modified_by])
  end
end
