class AddNameColumnToUserSearches < ActiveRecord::Migration
  
  def change
    remove_column :user_searches, :type
    add_column :user_searches, :category, :string
    add_column :user_searches, :name, :string	
  end
end
