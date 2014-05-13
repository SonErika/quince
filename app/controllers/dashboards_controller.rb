class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @owned_dresses = current_user.dresses
    @rented_dresses = current_user.rented_dresses
    @lended_dresses = current_user.dresses.where(available: false)
  end

end

