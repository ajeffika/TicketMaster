# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :street
      t.string :street_number
      t.string :room

      t.timestamps
    end
  end
end
