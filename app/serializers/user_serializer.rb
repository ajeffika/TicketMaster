# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attributes %i[email
                    username
                    first_name
                    last_name
                    age
                    role
                    address_id]

  belongs_to :address
end
