class DressRental < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"

  validates :dress_id, presence: true
  validates :borrower, presence: true

  DESCRIPTION = 'Rent This Dress'

  def initialize(dress, borrower, token)
    @dress = dress
    @borrower = borrower
    @token = token
  end

  def process
    customer = create_customer
    create_charge customer
    @borrower.update(stripe_id: customer.id)
  end

  private

  attr_reader :dress, :user, :token

  def create_customer
    Stripe::Customer.create(
      email: @borrower.email,
      card: token
    )
  end

  def total_price
    @dress.price_cents * 100
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: total_price,
      description: DressRental::DESCRIPTION,
      currency: 'usd'
    )
  end
end
