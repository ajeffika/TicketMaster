class UsersIncidentsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :incidents do |t|
      t.references :user, foreign_key: true
      t.references :incidents, foreign_key: true
    end
  end
end
