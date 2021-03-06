class DressesController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @dresses = Dress.published
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
    @cost = @dress.price_cents * 100
  end

  def edit
    @dress = current_user.dresses.find(params[:id])
  end

  def update
    @dress = current_user.dresses.find(params[:id])
    if @dress.update(dress_params)
      unless current_user.admin?
        @dress.unpublish
      end
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
        :price_cents,
        :description,
        :image,
        :published
      )
  end
end
