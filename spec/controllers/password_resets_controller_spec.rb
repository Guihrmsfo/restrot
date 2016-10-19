require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    it "is successfull" do
      get :create
      expect(response).to have_http_status(302)
    end
    
    it "redirects to home" do
      get :create
      expect(response).to redirect_to(root_path)
    end
  end
end
