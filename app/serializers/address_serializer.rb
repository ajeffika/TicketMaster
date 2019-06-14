# frozen_string_literal: true

class AddressSerializer < BaseSerializer
  attributes %i[country city street street_number room]
end
