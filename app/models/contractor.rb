# frozen_string_literal: true

class Contractor < ApplicationRecord
  belongs_to :address
  has_many :incidents, dependent: :destroy
end
