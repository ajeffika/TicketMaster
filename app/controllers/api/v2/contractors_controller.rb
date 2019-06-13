class Api::V2::ContractorsController < Api::V2::BaseController
# frozen_string_literal: true
  respond_to :json

  def index
    @contractors = Contractor.all
    render json: @contractors
  end

  def show
    contractor = Contractor.find(params[:id])
    render json: { data: ContractorSerializer.new(contractor) }
  end

  def create
    contractor = Contractor.new(contractor_params)
    if contractor.save
      render json: { data: ContractorSerializer.new(contractor) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    contractor = Contractor.find(contractor_params[:id])
    if contractor.update(contractor_params)
      render json: { data: ContractorSerializer.new(contractor) }
    else
      render json: 'Record did not save'
    end
  end

  private

  def contractor_params
    params.require(:contractor).permit(%i[id contractor_name address_id])
  end
end