class SessionController < ApplicationController
    
    before_action :require_login
    
    def logout
        session[:user_id] = nil
        redirect_to :controller => 'home', :action => 'index'
    end
    
    def require_login
        if session[:user_id].nil?
            redirect_to :controller => 'users', :action => 'login' 
            return
        else
            @user = User.find_by id: session[:user_id]
            if @user.nil?
                redirect_to :controller => 'users', :action => 'login'
            end
        end 
    end
    
end
