class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #search for user sesisons status
  end
  def logged_in?
    !!current_user #converts to booleans
  end
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
    
  end

end
