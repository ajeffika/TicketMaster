# frozen_string_literal: true

class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :number
      t.string :slug
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.integer :status
      t.datetime :pending
      t.references :group, foreign_key: true, default: 1
      t.references :category, foreign_key: true, default: 1
      t.string :attachment
      t.text :comment
      t.string :step, default: 'new'
      t.integer :creator_id
      t.integer :modifier_id

      t.timestamps
    end
    add_index :incidents, :slug, unique: true
  end
end
