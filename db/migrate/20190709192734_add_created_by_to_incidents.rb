class AddCreatedByToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :created_by, :integer
    add_column :incidents, :modified_by, :integer
  end
end
