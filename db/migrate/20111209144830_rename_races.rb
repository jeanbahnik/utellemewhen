class RenameRaces < ActiveRecord::Migration
  def up
    rename_table :races, :events
    [:city, :registration_on, :race_on, :size, :race_type].each do |column_name|
      remove_column :events, column_name
    end
  end

  def down
  end
end
