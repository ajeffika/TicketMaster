# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :is_parent, default: false
      t.references :sla, foreign_key: true
      t.references :category
      t.references :group

      t.timestamps
    end
  end
end
