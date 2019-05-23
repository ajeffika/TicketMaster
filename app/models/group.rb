# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :group_squads
  has_many :users, through: :group_squads
end
