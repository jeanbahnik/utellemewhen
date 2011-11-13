class RemoveTypeFromRace < ActiveRecord::Migration
  def change
    remove_column :races, :type
    add_column :races, :race_type, :string
  end
end
