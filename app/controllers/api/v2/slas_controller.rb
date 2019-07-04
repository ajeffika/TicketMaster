class Api::V2::SlasController < Api::V2::BaseController
  # frozen_string_literal: true
  respond_to :json

  def index
    @slas = Sla.all
    render json: @slas
  end

  def show
    sla = Sla.find(params[:id])
    render json: { data: SlaSerializer.new(sla) }
  end

  def create
    sla = Sla.new(sla_params)
    if sla.save
      render json: { data: SlaSerializer.new(sla) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    sla = Sla.find(sla_params[:id])
    if sla.update(sla_params)
      render json: { data: SlaSerializer.new(sla) }
    else
      render json: 'Record did not save'
    end
  end

  private

  def sla_params
    params.require(:sla).permit(%i[id
                                   name
                                   description
                                   sla_id])
  end
end
