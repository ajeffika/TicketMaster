# frozen_string_literal: true

class CategorySerializer < BaseSerializer
  attributes %i[id name description sla_id]
end
