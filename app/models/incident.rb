class Incident < ApplicationRecord
  has_and_belongs_to_many :user
  has_and_belongs_to_many :submitter, class_name: 'User'
  has_and_belongs_to_many :responsible, class_name: 'User'
end
