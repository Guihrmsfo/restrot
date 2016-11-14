require 'rails_helper'

RSpec.describe IngredientsUsersController, type: :controller do

  describe "GET #edit" do
    
    before(:each) do
            FactoryGirl.create(:user)
            session[:user_id] = 1
        end
    
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
  
end
