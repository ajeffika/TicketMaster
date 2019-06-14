# frozen_string_literal: true

class GroupSquad < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
