class DashboardController < ApplicationController
  def dashboard
    
    if session[:user_id].nil?
        redirect_to :controller => 'users', :action => 'login' 
        return
    else
        @user = User.find_by id: session[:user_id]
        if @user.nil?
            redirect_to :controller => 'users', :action => 'login' 
            return
        end
    end
    
  end
end
