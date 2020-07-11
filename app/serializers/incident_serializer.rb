# frozen_string_literal: true

class IncidentSerializer < BaseSerializer
  attributes %i[id
                title
                description
                user_id
                status
                pending
                group_id
                modifier_email
                category_id
                attachment
                comment
                step]

  def modifier_email
    object.modifier&.email || 'Waiting for assigment'
  end
end
