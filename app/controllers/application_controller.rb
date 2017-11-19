class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  private
  helper_method :logged_in?
  
  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]      

  end
  
  def require_login
    unless logged_in?
      redirect_to welcome_path
    end
  end

end
