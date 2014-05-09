class DressRentalsController < ApplicationController

  def create
    dress_rental = DressRental.new(dress_rental_params)
    if dress_rental.save
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
