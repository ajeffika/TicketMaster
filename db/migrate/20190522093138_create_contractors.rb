class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :contractor_name
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
