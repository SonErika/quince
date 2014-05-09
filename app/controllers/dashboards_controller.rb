class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @owner_dresses = current_user.dresses
  end
end
