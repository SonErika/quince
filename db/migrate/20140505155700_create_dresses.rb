class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.timestamps null: false
      t.string :name, null: false, limit: 20
      t.string :size, null: false
      t.text :description, limit: 255
      t.decimal :price, null: false
      t.boolean :available, default: true
    end
  end
end
