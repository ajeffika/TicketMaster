# frozen_string_literal: true

class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.integer :status
      t.datetime :pending
      t.references :group, foreign_key: true, default: 1
      t.references :category, foreign_key: true, default: 1
      t.string :attachment
      t.text :comment
      t.integer :step

      t.timestamps
    end
  end
end
