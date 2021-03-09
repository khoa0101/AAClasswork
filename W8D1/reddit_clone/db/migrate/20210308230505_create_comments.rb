class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, null:false 
      t.integer :author_id, null:false 
      t.integer :post_id, null:false 
      t.integer :parent_comment_id

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :post_id
    add_index :comments, :parent_comment_id
  end
end
