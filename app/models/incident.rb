# frozen_string_literal: true

class Incident < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :group, optional: true
end
