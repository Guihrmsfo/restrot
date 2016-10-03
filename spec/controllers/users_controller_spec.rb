require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #login" do
    it "user params not empty" do
      get :login
      #@user = UsersController.new
      expect(params[:user]).to be_present
    end
    
    it "user already exists" do
      get :login
      #@user = UsersController.new
      @user_test = User.find_by params[:user][:name]
      #@user_test = User.find_by name: @user.name
      expect(@user_test).not_to be_nill
    end
  end
    
  describe "GET #create" do
    it "user params not empty" do
      get :create
      #@user = UsersController.new
      expect(params[:user]).to be_present
    end
    
    it "username does not exist" do
      get :create
      #@user = UsersController.new
      @user_test = User.find_by params[:user][:name]
      #@user_test = User.find_by name: @user.name
      expect(@user_test).to be_nill
    end
    
    it "email does not exist" do
      get :create
      #@user = UsersController.new
      @user_test = User.find_by params[:user][:email]
      #@user_test = User.find_by email: @user.email
      expect(@user_test).to be_nill
    end
    
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
  
end
