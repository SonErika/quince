class AddPublishedToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :published, :boolean, default: false
  end
end
