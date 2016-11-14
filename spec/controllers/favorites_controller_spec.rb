require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  context "when user is logged in" do
    
    before(:each) do
      @password = '123456'
      @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
      @user.save
      session[:user_id] = 1
    end
    
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end  
  end
end
