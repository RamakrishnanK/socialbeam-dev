class AddScribbleIdToScribbles < ActiveRecord::Migration
  def change
  	add_column :scribbles, :scribble_id, :string,:null => false,:unique => true
  end
end
