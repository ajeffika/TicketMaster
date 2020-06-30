# frozen_string_literal: true

class Incident < ApplicationRecord
  extend FriendlyId
  friendly_id :number, use: :slugged

  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :group, optional: true
  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :modifier, class_name: 'User', optional: true

  before_validation :update_creator
  before_validation :update_modifier

  def update_creator
    binding.pry
    self.creator_id = current_user_id
  end

  def update_modifier
    binding.pry
    self.modifier_id = current_user_id
  end

  def current_user_id
    User.current_user.try(:id)
  end
end
