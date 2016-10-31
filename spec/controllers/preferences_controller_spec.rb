require 'rails_helper'

RSpec.describe PreferencesController, type: :controller do
  
  context "when user is logged in" do
    
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
      
      it "updates profile image" do
        post :profile, :user => {:profile_image_url => "http://teste.png"}
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        expect(@current_user.profile_image).to eq("http://teste.png")
      end
      
      it "fails updating profile image" do
        post :profile, :user => {:profile_image_url => "teste.png"}
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        expect(@current_user.profile_image).to be_nil
        expect(@current_user.profile_image_url).to eq("/assets/user2-160x160.jpg")
      end
      
      # File Upload has been deprecated, heroku doesn't support file uploading
      #
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
      
      before {post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", 
        :password => "Password", session: { user_id: User.minimum(:id) } } }
        
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      
      it "is missing params" do
        post :password, :user => {:oldPassword => "", :passwordConfirmation => "passwordConfirmation", 
          :password => "password", session: { user_id: User.minimum(:id) }}
        expect(response).to render_template("preferences/password")
      end
      
      it "is missing params" do
        post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "",
          :password => "password", session: { user_id: User.minimum(:id) }}
        expect(response).to render_template("preferences/password")
      end
      
      it "is missing params" do
        post :password, :user => {:oldPassword => "oldPassword", :passwordConfirmation => "passwordConfirmation", 
          :password => "", session: { user_id: User.minimum(:id) }}
        expect(response).to render_template("preferences/password")
      end
      
    end
    
  end
  
  context "when user is not logged in" do
    describe "POST .password" do  
        subject { post :password }
        it "the request is unauthorized" do
          expect(subject).to redirect_to :action => :login, :controller => :users
        end
    end
    
  end

end