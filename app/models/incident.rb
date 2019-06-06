# frozen_string_literal: true

class Incident < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :group
end