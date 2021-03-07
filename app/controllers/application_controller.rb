class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  def current_user
    # if there is already a current user the do not search database similar to ||
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # !!: turning currret user into a boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform the action"
      redirect_to login_path
    end

  end
  
end

