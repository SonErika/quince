class CreateDressRentals < ActiveRecord::Migration
  def change
    create_table :dress_rentals do |t|
      t.date :start_date
      t.date :end_date
      t.belongs_to :borrower, index: true, null: false
      t.belongs_to :dress, index: true, null: false

      t.timestamps
    end
  end
end
