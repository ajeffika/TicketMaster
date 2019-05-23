# frozen_string_literal: true

class CreateSlas < ActiveRecord::Migration[5.2]
  def change
    create_table :slas do |t|
      t.string :sla_type
      t.datetime :sla_time
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
