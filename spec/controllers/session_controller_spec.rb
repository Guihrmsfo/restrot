require 'rails_helper'

RSpec.describe SessionController, type: :controller do
    
    context "user is logged" do
        
        before(:each) do
            @password = '123456'
            @user = User.new(id: 1, name: "Guilherme", email: "guilherme_oliveira55@hotmail.com", password: @password)
            @user.save
            session[:user_id] = 1
        end
    
        describe "GET #logout" do
            subject {get :logout}
            
            it "logout" do
                get :logout
                expect(session[:user_id]).to be_nil
            end
            
            it "redirects to home index" do
                expect(subject).to redirect_to :action => 'index', :controller => 'home'
            end
        end    
        
    end
    
    describe "GET #require_login" do
        
        it "redirects to users login" do
            session[:user_id] = nil
            get :require_login
            expect(subject).to redirect_to :action => 'login', :controller => 'users'
        end
        
        it "user doesn't exist" do
            session[:user_id] = 500
            get :require_login
            expect(subject).to redirect_to :action => 'login', :controller => 'users'
        end
        
    end
    
end
