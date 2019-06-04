class IncidentSerializer < BaseSerializer
  attributes %i[title
                     description
                     user_id
                     status
                     pending
                     group_id
                     category_id
                     attachment
                     comment
                     step]
end