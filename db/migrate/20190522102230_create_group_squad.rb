# frozen_string_literal: true

class CreateGroupSquad < ActiveRecord::Migration[5.2]
  def change
    create_table :group_squads do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
    end
  end
end
