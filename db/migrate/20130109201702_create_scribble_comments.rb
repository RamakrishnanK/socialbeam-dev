class CreateScribbleComments < ActiveRecord::Migration
  def change
    create_table :scribble_comments do |t|
      t.string :commentor_id
      t.string :commentor
      t.text :body,:null => false
      t.integer :ups,:default=>0
      t.integer :downs,:default=>0
      t.string :scribble_id
      t.timestamps
    end
  end
end
