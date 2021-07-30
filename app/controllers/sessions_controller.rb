class SessionsController < ApplicationController
  def new
  end
  
  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # binding.pry
      redirect_to :controller => 'welcome', :action => 'home'
    else
      flash[:notice] = "Incorrect username or password"
      redirect_to '/login'
    end

  end

  def destroy
    session.delete :user_id
    redirect_to controller: 'sessions', action: 'new'
  end
end
