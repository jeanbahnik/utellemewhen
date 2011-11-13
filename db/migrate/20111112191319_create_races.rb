class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :city
      t.string :type
      t.date :registration_on
      t.date :race_on
      t.string :size

      t.timestamps
    end
  end
end
