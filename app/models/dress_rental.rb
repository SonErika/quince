class DressRental < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"
  belongs_to :dress

  validates :dress_id, presence: true
  validates :borrower_id, presence: true
  validates :stripe_token, presence: true

  DESCRIPTION = 'Rent This Dress'

  def process(borrower, token, dress)
    customer = create_customer(borrower, token)
    create_charge(customer, dress)
    borrower.update(stripe_id: customer.id)
  end

  private

  attr_reader :dress, :borrower, :token

  def create_customer(borrower, token)
    Stripe::Customer.create(
      email: borrower.email,
      card: token
    )
  end

  def total_price(dress)
    dress.price_cents * 100
  end

  def create_charge(customer, dress)
    Stripe::Charge.create(
      customer: customer.id,
      amount: total_price(dress),
      description: DressRental::DESCRIPTION,
      currency: 'usd'
    )
  end
end
