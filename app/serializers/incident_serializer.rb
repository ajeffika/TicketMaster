# frozen_string_literal: true

class IncidentSerializer < BaseSerializer
  attributes %i[id
                title
                description
                user_id
                status
                pending
                contractor
                group_id
                category_id
                attachment
                comment
                step]
end
