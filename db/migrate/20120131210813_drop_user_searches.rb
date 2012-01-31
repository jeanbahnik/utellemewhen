class DropUserSearches < ActiveRecord::Migration
  def up
    drop_table :user_searches
  end

  def down
  end
end
