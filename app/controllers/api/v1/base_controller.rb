# frozen_string_literal: true

class Api::V1::BaseController < Api::BaseController
  respond_to :json

  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  include FlashableConcern
  include NormalizeParamsConcern

  private

  def current_user
    current_api_v1_user
  end

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end
