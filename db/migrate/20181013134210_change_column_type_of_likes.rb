class ChangeColumnTypeOfLikes < ActiveRecord::Migration[5.0]
  def change
    # change_column :tables, :column_name, :type, :options
    # change_column :users, :name, :text, null: false
    remove_foreign_key :likes, :users
    remove_foreign_key :likes, column: :micropost_id
    
    add_foreign_key :likes, :users
    add_foreign_key :likes, :microposts
  end
end
