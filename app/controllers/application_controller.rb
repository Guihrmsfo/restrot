class ApplicationController < ActionController::Base
  # Uncomment next line to apply the adminLTE template every-f***ing-where
  # layout 'admin_lte_2'
  
  helper_method :current_user
  
  protect_from_forgery with: :exception
end
