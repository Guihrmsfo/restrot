class DashboardController < ApplicationController
  def dashboard
    
    if session[:user_id].nil?
        redirect_to :controller => 'users', :action => 'login' 
        return
    end
    
  end
end
