class CreateFriendships < ActiveRecord::Migration
  def up
  	create_table :friendships do |t|
      t.string :beamer_id, :friend_beamer_id
      t.string :requested_to
      t.string :status
      t.datetime "created_at"
    end
  end

  def down
  	drop_table :friendships
  end
end
