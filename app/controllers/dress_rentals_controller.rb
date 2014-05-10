class DressRentalsController < ApplicationController

  def create
    dress = Dress.find(params[:dress_id])
    dress_rental = DressRental.new(dress_rental_params)
    if dress_rental.save
      dress.make_unavailable
      redirect_to dashboard_path
    else
      flash[:error] = "That didn't work, try again"
      redirect_to dress_path(dress)
    end
  end

  private
  
  def dress_rental_params
    {
      dress_id: params[:dress_id],
      borrower_id: current_user.id
    }
  end

end 
