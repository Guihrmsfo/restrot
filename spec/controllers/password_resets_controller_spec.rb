require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    it "não envia email se usuario não existe" do
      get :create
      user = User.create(name: 'Laura', email: '123@test.com', password: 'password')
      user = nil
      expect(response).to render_template("password_resets/create")
    end
    
    it "envia email recuperacao se usuario existe" do
      get :create
      user = User.create(name: 'Laura', email: '123@test.com', password: 'password')
      user.send_password_reset
      expect(response).to render_template(root_path)
    end
  end
  
  describe "PUT #update" do 
    
    before(:each) do
      @password = '123456'
      @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
      @user.save
      session[:user_id] = 1
    end
    
    it "atualiza a senha do usuario" do
      put :update, params: {id: 1}
      expect(response).to render_template(root_path)
    end
    
    it "falha ao identificar usuário" do
      put :update, params: {id: 1}
      expect(response).to render_template("password_resets/edit")
    end
  end
  
  #describe "GET #edit" do
  #  it "checa se link expirou" do
  #    get :edit 
  #   user = User.create(name: 'Laura', email: '123@test.com', password: 'password')
  #   expect(response).to render_template("password_resets/new")
  #  end
  #end
end
