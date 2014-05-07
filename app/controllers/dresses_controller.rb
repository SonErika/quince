class DressesController < ApplicationController
  before_action :authorize, only: [:new, :create]
  
  def new
   @dress = Dress.new
  end 

  def create
    @dress = current_user.dresses.new(dress_params)
    if @dress.save
      redirect_to @dress
    else
      render :new
    end
  end
  def show
    @dress = Dress.find(params[:id])
  end
private
  def dress_params
    params.require(:dress).permit(:name, :size, :price)
  end 
end 
