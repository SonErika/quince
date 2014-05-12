class AddColumnToDressRentals < ActiveRecord::Migration
  def change
    add_column :dress_rentals, :stripe_token, :string, null: false
  end
end
