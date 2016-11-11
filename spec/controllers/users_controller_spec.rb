require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #login" do
    
    context "registered but not logged in" do
      
      before(:each) do
        @password = '123456'
        @user = User.new(id: 1, name: "Any Name", email: "anyemail@gmail.com", password: @password)
        @user.save
      end
      
        it "redirects to dashboard" do
          post :login, params: {:user => {:name => "Any Name", :password => "123456"}}
          expect(response).to redirect_to(:controller => 'dashboard', :action => 'dashboard')
        end
      
        it "has confirmed_email" do
          @user = User.find_by id: 1
          @user.confirmed_email = true
          @user.save
          post :login, params: {:user => {:name => "Any Name", :password => "123456"}}
          expect(flash[:notice]).to match(/Login realizado com sucesso!*/)
        end
        
        it "hasn't confirmed_email" do
          post :login, params: {:user => {:name => "Any Name", :password => "123456"}}
          expect(flash[:alert]).to match(/Por favor, confirme seu e-mail para ativar sua conta.*/)
        end
         
        it "inputs a wrong password" do
          post :login, params: {:user => {:name => "Any Name", :password => "1"}}
          expect(flash[:danger]).to match(/Senha inválida*/)
        end
      
    end
    
    context "with valid attributes" do
      it "returns http success" do
        post :login
        expect(response).to have_http_status(:success)
      end
    end
 
    context "with invalid attributes" do
      it "is missing params" do
        post :login, params: {:user => {:name => "", :email => "email@123", :password => "Password"}}
        expect(response).to render_template("users/login")
      end
      
     it "is missing params" do
        post :login, params: {:user => {:name => "Any Name", :email => "", :password => "Password"}}
        expect(response).to render_template("users/login")
      end
      
      it "is missing params" do
        post :login, params: {:user => {:name => "Any Name", :email => "email@123", :password => ""}}
        expect(response).to render_template("users/login")
      end
    end
  end
  
  context "registered user" do
    
    before(:each) do
      @password = '123456'
      @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
      @user.save
      session[:user_id] = 1
    end
    
    describe "POST #login" do
      it "redirects to dashboard" do
        post :login 
        expect(response).to redirect_to(:controller => 'dashboard', :action => 'dashboard')
      end
    end
    
    describe "GET #confirm_email" do
      
      it "returns http success" do
        get :confirm_email, params: {:id => @user.confirm_token}
        expect(response).to have_http_status(:success)
      end
      
      it "redirects to home" do
        #invalid confirm_token
        @confirm_token = 1
        get :confirm_email, params: {:id => @confirm_token}
        expect(response).to redirect_to(:controller => 'home', :action => 'index')
      end
      
  end
  
  context "with valid attributes" do
    
    describe "POST #create" do
      
      it "creates a new user" do
        post :create, params: {:user => {:name => "Test", :email => "pibaworone@maileme101.com", :password => "123456", :password_confirmation => '123456'}}
        expect(response).to render_template("users/login")
        expect(flash[:success]).to match(/Cadastro realizado com sucesso*/)
      end
    end
    
    describe "GET #create" do
      
      it "returns http success" do
        get :create
        expect(response).to have_http_status(:success)
      end
      
    end
      
  end
    
    context "with invalid attributes" do
      it "is missing params" do
        post :create, params: {:user => {:name => "", :email => "email@123", :password => "Password"}}
        expect(response).to render_template("users/new")
      end
      
     it "is missing params" do
        post :create, params: { :user => {:name => "Any Name", :email => "", :password => "Password"} }
        expect(response).to render_template("users/new")
      end
      
      it "is missing params" do
        post :create, params: {:user => {:name => "Any Name", :email => "email@123", :password => ""} }
        expect(response).to render_template("users/new")
      end
    end
  end
end
