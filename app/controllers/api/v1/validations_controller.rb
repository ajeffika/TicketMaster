class Api::V1::ValidationsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def validate_uniqueness
    attr = params[:attribute]
    value = params[:value]
    model = params[:model].classify
    valid = model.constantize.valid_attribute?(attr, value)

    render json: { valid: valid }
  end
end