class ApplicationController < ActionController::Base
  #poopoo
  helper_method :current_guy, :logged_in?
  
  def current_guy
    @current_guy ||= User.find_by(session_token: session[:session_token])
  end
  
  def logged_in?
    !!current_guy
  end
  
  def login!(guy)
    @current_guy = guy
    session[:session_token] = guy.reset_session_token!
  end
  
  def logout!
    current_guy.reset_session_token!
    session[:session_token] = nil
  end
  
  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
  
end
