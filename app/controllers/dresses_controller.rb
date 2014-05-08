class DressesController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @dresses = Dress.all
  end

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

  def edit
    @dress = current_user.dresses.find(params[:id])
  end

  def update
    @dress = current_user.dresses.find(params[:id])
    if @dress.update(dress_params)
      redirect_to dress_path
    else
      render :edit
    end
  end

  def destroy
    dress = current_user.dresses.find(params[:id])
    dress.destroy
    redirect_to current_user
  end
  private

  def dress_params
    params.require(:dress).
      permit(
        :name,
        :size,
        :price,
        :description,
        :image
      )
  end
end
