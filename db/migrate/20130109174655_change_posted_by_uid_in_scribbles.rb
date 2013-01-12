class ChangePostedByUidInScribbles < ActiveRecord::Migration
  def up
  	change_table :scribbles do |t|
      t.change :posted_by_uid,:string
    end
  end
end
