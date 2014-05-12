class User < ActiveRecord::Base
  include Clearance::User

  has_many :dresses
  has_many :rented_dresses, through: :dress_rentals, source: :dress
  has_many :dress_rentals, foreign_key: :borrower_id
  validates :name, presence: true 

end
