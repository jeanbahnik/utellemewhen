class CreateUserSearches < ActiveRecord::Migration
  def change
    create_table :user_searches do |t|
      t.date :start_on
      t.date :end_on
      t.integer :user_id
      t.string :city
      t.string :type
      t.string :size

      t.timestamps
    end
  end
end
