class DressRentalsController < ApplicationController

  def create
    dress_rental = DressRental.new(dress_rental_params)
    logger.debug dress_rental_params.inspect
    dress_rental.process(current_user, stripe_token, dress)
    if dress_rental.save
      dress.make_unavailable
      redirect_to dashboard_path
    else
      redirect_to dress
    end
  end

  private

  def dress_rental_params
    {
      stripe_token: stripe_token,
      dress: dress,
      borrower: current_user
    }
  end

  def stripe_token
    params[:stripeToken]
  end

  def dress
    @dress ||= Dress.find(params[:dress_id])
  end

end 
