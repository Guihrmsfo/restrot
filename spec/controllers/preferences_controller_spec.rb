require 'rails_helper'

RSpec.describe PreferencesController, type: :controller do

  describe "POST #password" do
    fixtures :users
    context "when not logged in" do
      it "the request is unauthorized" do 
        session[:user_id] = nil
        expect(response).to have_http_status(200) 
      end
    end

    context "with logged in" do
      before{
        session[:user_id] = 1; 
      }
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it "is missing params" do
        post :password, :user => {:oldPassword => "", :passwordConfirmation => "passwordConfirmation", 
          :password => "password"}
        session[:user_id] = 1;
        expect(response).to render_template("password")
      end
     
      it "is missing params" do
        post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "",
          :password => "password"}
        session[:user_id] = 1;
        expect(response).to render_template("password")
      end
      
      it "is missing params" do
        post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", 
          :password => ""}
        session[:user_id] = 1;
        expect(response).to render_template("password")
      end
    end
  end
end
