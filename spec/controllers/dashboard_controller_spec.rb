require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    
    context "user is logged" do
        
        before(:each) do
            FactoryGirl.create(:user)
            session[:user_id] = 1
        end
    
        describe "GET #dashboard" do
            
            it "returns http success" do
                get :dashboard
                expect(response).to have_http_status(:success)
            end
            
            it "has correct ingredients_count" do
                get :dashboard
                expect(assigns(:ingredients_count)).to be 0
            end
            
            it "has correct recipes_count" do
                get :dashboard
                expect(assigns(:favorites_count)).to be 0
            end
            
        end
        
    end
    
end
