require 'rails_helper'

RSpec.describe PreferencesController, type: :controller do
  
  context "user is logged" do
    
    before(:each) do
      @password = '123456'
      @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
      @user.save
      session[:user_id] = 1
    end
    
    describe "GET #profile" do
      it "returns http success" do
        get :profile
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "POST #profile" do
      
      it "returns http success" do
        post :profile
        expect(response).to have_http_status(:success)
      end
      
      it "has no update" do
        post :profile
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        expect(@current_user.profile_name).to be_nil
        expect(@current_user.profile_last_name).to be_nil
      end
      
      it "updates profile name" do
        post :profile, :user => {:profile_name => "Name"}
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        expect(@current_user.profile_name).to eq("Name")
      end
      
      it "updates profile last name" do
        post :profile, :user => {:profile_last_name => "Lastname"}
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        expect(@current_user.profile_last_name).to eq("Lastname")
      end
      
      # it "can upload a profile image" do
      #   @file = fixture_file_upload('files/user_profile.jpg', 'image/jpg')
      #   file = Hash.new
      #   file['datafile'] = @file
      #   post :profile, :user => {:profile_image => Rack::Test::UploadedFile.new('spec/fixtures/files/user_profile.jpg', 'image/jpg')}
      #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
      #   expect(@current_user.profile_image).to eq("/assets/profile_images/"+@current_user.name+".jpg")
      #   fileName = @current_user.name+".jpg"  
      #   FileUtils.rm(Rails.root+"public/assets/profile_images/"+fileName)
      # end
      
    end
    
  end
end