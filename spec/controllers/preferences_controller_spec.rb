require 'rails_helper'

RSpec.describe PreferencesController, type: :controller do


  describe "POST #password" do
    context "with valid attributes" do
      before {post :update_password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", :password => "Password"} }
      
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    
    end
    
    context "with invalid attributes" do
      it "is missing params" do
        post :update_password, :user => {:oldPassword => "", :passwordConfirmation => "passwordConfirmation", :password => "Password"}
        expect(response).to render_template("users/edit")
      end
      
     it "is missing params" do
        post :update_password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "", :password => "Password"}
        expect(response).to render_template("users/edit")
      end
      
      it "is missing params" do
        post :update_password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", :password => ""}
        expect(response).to render_template("users/edit")
      end
    end
  end
end