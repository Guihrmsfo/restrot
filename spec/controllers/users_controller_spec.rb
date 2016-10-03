require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #login" do
    #it "is valid with valid atributes" do
    #  get :login
    #  user = UsersController.new
    #end
    
    it "name not empty" do
      get :login, :name
      expect(:name).not_to eq('');
    end
    
    it "user params not empty" do
      get :login, :params
      expect(params).to be_present
    end
    
  end
  
  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
  
end
