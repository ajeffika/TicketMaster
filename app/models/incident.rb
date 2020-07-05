# frozen_string_literal: true

class Incident < ApplicationRecord
  extend FriendlyId
  friendly_id :number, use: :slugged

  enum step: {fresh: 'fresh', in_progress: 'in_progress', pending: 'pending', cancelled: 'cancelled', resolved: 'resolved'}

  belongs_to :user, class_name: 'User'
  belongs_to :category
  belongs_to :group, optional: true
  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :modifier, class_name: 'User', optional: true

  before_validation :update_creator
  before_validation :update_modifier

  def update_creator
    self.creator_id = current_user_id
  end

  def update_modifier
    self.modifier_id = current_user_id
  end

  def current_user_id
    User.current_user.try(:id)
  end
end
