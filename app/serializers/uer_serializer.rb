# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attributes %i[id email username first_name last_name birth_date role address]
end
