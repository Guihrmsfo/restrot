require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    
    context "user is logged" do
        
        before(:each) do
            @password = '123456'
            @user = User.new(id: 1, name: "Guilherme", email: "guilherme_oliveira55@hotmail.com", password: @password)
            @user.save
            session[:user_id] = 1
        end
    
        describe "GET #dashboard" do
            
            it "returns http success" do
                get :dashboard
                expect(response).to have_http_status(:success)
            end
            
        end
        
    end
    
end
