class RemoveColumnFromDresses < ActiveRecord::Migration
  def change
    remove_column :dresses, :price
  end
end
