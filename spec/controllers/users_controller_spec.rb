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
       expect(response).to redirect_to(dashboard)
     end
    
     it "will set flash[:notice]" do
       post :login
       expect(flash[:notice]).to be_present
     end
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{post :create, user: {name: 'Any Name'} }.to change(User, :count).by(1)
      end
      
      it "returns http success" do
        post :create
        expect(response).to have_http_status(:success)
      end
      
      it "will set flash[:notice]" do
        post :create
        expect(flash[:notice]).to be_present
      end
    end
    
  end
  
end
