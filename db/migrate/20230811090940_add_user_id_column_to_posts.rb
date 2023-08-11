class AddUserIdColumnToPosts < ActiveRecord::Migration[7.0]
  def change    
    add_column :posts, :user_id, :int , null: false, foreign_key: true, default: 0    
  end
end
