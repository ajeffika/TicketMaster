# frozen_string_literal: true

class ContractorSerializer < BaseSerializer
  attributes %i[id contractor_name address_id]
  belongs_to :address
end
