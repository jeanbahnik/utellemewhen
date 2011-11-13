class CreateUserRaces < ActiveRecord::Migration
  def change
    create_table :user_races do |t|
      t.integer :race_id
      t.integer :user_id

      t.timestamps
    end
  end
end
