class DropOldUsersTable < ActiveRecord::Migration
  def up
    drop_table :old_users_table
  end

  def down
  end
end
