class Dress < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true
  SIZES = ["US-1", "US-2", "US-4", "US-6", "US-8", "US-10","US-12"]
end
