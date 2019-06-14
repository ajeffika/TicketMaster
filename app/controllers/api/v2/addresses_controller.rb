class Api::V2::AddressesController < Api::V2::BaseController
  # frozen_string_literal: true

  def index
    @address = Address.all
    render json: @address
  end

  def show
    address = Address.find(params[:id])
    render json: { data: AddressSerializer.new(address) }
  end

  def create
    address = Address.new(address_params)
    if address.save
      render json: { data: AddressSerializer.new(address) }
    else
      render json: 'Record did not save'
    end
  end

  def update
    address = Address.find(address_params[:id])
    if address.update(address_params)
      render json: { data: AddressSerializer.new(address) }
    else
      render json: 'Record did not save'
    end
  end

  private

  def address_params
    params.require(:address).permit(%i[id name])
  end
end