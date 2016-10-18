=begin
require 'rails_helper'

RSpec.describe PreferencesController, type: :controller do


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #password" do
    context "with valid attributes" do
      before {post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", :password => "Password"} }
      
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    
    end
    
    context "with invalid attributes" do
      it "is missing params" do
        post :password, :user => {:oldPassword => "", :passwordConfirmation => "passwordConfirmation", :password => "password"}
        expect(response).to render_template("preferences/password")
      end
      
     it "is missing params" do
        post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "", :password => "password"}
        expect(response).to render_template("preferences/password")
      end
      
      it "is missing params" do
        post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", :password => ""}
        expect(response).to render_template("preferences/password")
      end
    end
  end
end
=end