class DressRentalsController < ApplicationController

  def create
    dress = Dress.find(params[:dress_id])
    token = params[:stripeToken]
    dress_rental = DressRental.new(dress, current_user, token)
    dress_rental.process
      dress.make_unavailable
      redirect_to dashboard_path
  end

end 
