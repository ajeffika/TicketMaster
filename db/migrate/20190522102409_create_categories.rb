class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.references :incident, foreign_key: true
      t.integer :sla_id

      t.timestamps
    end
    add_foreign_key :categories, :categories, column: 'sla_id', primary_key: 'id'
  end
end
