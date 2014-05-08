class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    @dresses = @user.dresses
  end

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end

  def user_params
    params[:user] || {}
  end
end
