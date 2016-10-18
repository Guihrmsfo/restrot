class ApplicationController < ActionController::Base
  # Uncomment next line to apply the adminLTE template every-f***ing-where
  # layout 'admin_lte_2'
  
  helper_method :current_user

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  protect_from_forgery with: :exception
end
