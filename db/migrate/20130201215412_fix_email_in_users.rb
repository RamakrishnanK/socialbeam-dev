class FixEmailInUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
      t.change :email,:string, :null => false,:default =>""
    end
  end
end
