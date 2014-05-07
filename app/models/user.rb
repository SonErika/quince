class User < ActiveRecord::Base
  include Clearance::User

  validates :name, presence: true

  has_many :dresses
end
