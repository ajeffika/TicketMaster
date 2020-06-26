# frozen_string_literal: true

class CategorySerializer < BaseSerializer
  attributes %i[id name description children sla_id]

  def children
    object.children
  end
end
