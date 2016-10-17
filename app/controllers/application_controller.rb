class ApplicationController < ActionController::Base
  # Uncomment next line to apply the adminLTE template every-f***ing-where
  # layout 'admin_lte_2'

  protect_from_forgery with: :exception
end
