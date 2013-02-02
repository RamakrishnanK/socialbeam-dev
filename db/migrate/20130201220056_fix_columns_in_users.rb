class FixColumnsInUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
      t.change :beamer_id,:string, :null => false,:unique=>true
      t.change :profile_id,:string,:unique=>true
    end
    add_index :users, :beamer_id,:unique => true
    add_index :users, :profile_id,:unique => true
    add_index :users, :first_name
  end
end
