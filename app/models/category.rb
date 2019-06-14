# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :incidents
  belongs_to :sla
end
