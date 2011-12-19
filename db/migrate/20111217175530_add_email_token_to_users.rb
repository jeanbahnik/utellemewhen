class AddEmailTokenToUsers < ActiveRecord::Migration
  def change
    add_column :Users, :email_token, :string
  end
end
