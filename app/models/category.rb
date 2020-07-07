# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :incidents
  belongs_to :parent, foreign_key: 'category_id', class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', dependent: :destroy
  belongs_to :sla
  belongs_to :group, optional: true

end
