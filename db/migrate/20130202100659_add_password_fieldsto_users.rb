class AddPasswordFieldstoUsers < ActiveRecord::Migration
  def change
  	remove_column :users,:password_salt
  	remove_column :users,:password_hash
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
  end
end
