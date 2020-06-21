# frozen_string_literal: true

class Incident < ApplicationRecord
  extend FriendlyId
  friendly_id :number, use: :slugged

  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :group, optional: true
  belongs_to :creator, class_name: 'User'
  belongs_to :modifier, class_name: 'User'

  def update_created_by
    self.created_by = current_user_id
  end

  def update_modified_by
    self.modified_by = current_user_id
  end

  def current_user_id
    User.current_user.try(:id)
  end
end
