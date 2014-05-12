class AddPriceToDresses < ActiveRecord::Migration
  def change
    add_money :dresses, :price, null: false
  end
end
