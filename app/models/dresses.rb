class Dresses < ActiveRecord::Base
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true 
end
