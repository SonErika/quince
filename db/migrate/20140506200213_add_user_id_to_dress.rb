class AddUserIdToDress < ActiveRecord::Migration
  def change
    add_column :dresses, :user_id, :integer
    add_index :dresses, :user_id
  end
end
