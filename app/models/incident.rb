# frozen_string_literal: true

class Incident < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :group, optional: true

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
