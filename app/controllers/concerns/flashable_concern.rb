module FlashableConcern
  extend ActiveSupport::Concern

  def flash_action(status: flash_status)
    { message: message, status: status }
  end

  private

  def flash_status
    response.successful? ? :success : :negative
  end

  def model_name
    controller_name.classify.constantize.model_name.human
  end

  def model_gender(model: controller_name.classify.constantize)
    model.human_attribute_name(:gender)&.first
  end

  def message
    t("flash.api.actions.#{action_name}.#{flash_status}",
      resource_name: model_name,
      gender: model_gender
    )
  end
end