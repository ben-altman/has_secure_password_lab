class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id])
  end

  private

  def require_logged_in
    # binding.pry
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end
