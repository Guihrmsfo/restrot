require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #login" do
    context "with valid attributes" do
      it "returns http success" do
        post :login
        expect(response).to have_http_status(:success)
     end
    
     it "redirect to dashboard" do
       post :login
       expect(response).to redirect_to(:controller => 'dashboard')
     end
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "returns http success" do
        post :create
        expect(response).to have_http_status(:success)
      end
    end
  end
end
