class DressRental < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"

  validates :dress_id, presence: true
  validates :borrower, presence: true
end
