# frozen_string_literal: true

class CategorySerializer < BaseSerializer
  attributes %i[id name description parent sla_id]
end
