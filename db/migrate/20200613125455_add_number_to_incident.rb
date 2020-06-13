class AddNumberToIncident < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :number, :string
    add_column :incidents, :slug, :string
    add_index :incidents, :slug, unique: true
  end
end
