# frozen_string_literal: true

class IncidentSerializer < BaseSerializer
  attributes %i[id
                title
                description
                user_id
                status
                pending
                contractor_id
                group_id
                category_id
                attachment
                comment
                step]
  belongs_to :contractor
  belongs_to :group
end
