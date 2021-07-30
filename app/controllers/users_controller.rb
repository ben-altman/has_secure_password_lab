class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
