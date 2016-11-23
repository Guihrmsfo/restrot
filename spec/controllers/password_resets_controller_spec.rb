require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    
    context "usuário NÃO existe" do
      it "não envia email de recuperação" do
        get :create, params: {email: "emailnaoexistente@emailnaoexistente.com"}
        expect(assigns(:user)).to be_nil
        expect(flash[:error]).to eq("O e-mail digitado não corresponde a um usuário")
        expect(response).to render_template("password_resets/new")
      end
    end
    
    context "usuário EXISTE" do
      it "envia email de recuperação" do
        @user = User.create(name: "anyName", email: "anyEmail@anyEmail.com", password: "password")
        get :create, params: {email: @user.email}
        expect(flash[:info]).to eq("Um email foi enviado com as intruções de recuperação")
        expect(ActionMailer::Base.deliveries.count).to be == 1
        expect(response).to render_template(root_path)
      end
    end
    
  end
  
  describe "GET #edit" do
    
    before(:each) do
      # ---------------- ATENÇÃO!! ----------------
      #O nome desse usuário PRECISA ser 'testUser', NÃO ALTERAR!
      #O método 'send_password_reset' do model User identifica quando o usuário é de teste e atribui
      #ao seu atributo "password_reset_sent_at" o valor de '3.hours.ago', para que o teste funcione apropriadamente
      # ---------------- ATENÇÃO!! ----------------
      @user = User.create(name: "testUser", email: "anyEmail@anyEmail.com", password: "password")
      @user.send_password_reset
    end
    
    it "link de recuperação de senha expirou" do
      get :edit, params: {id: @user.password_reset_token}
      expect(assigns(:user).password_reset_sent_at).to be < 2.hours.ago
      expect(flash[:notice]).to eq("Recuperação de senha expirada, solicite um novo link")
      expect(response).to render_template("password_resets/new")
    end
    
  end
  
  describe "PUT #update" do 
    
    before(:each) do
      @user = User.create(name: "anyName", email: "anyEmail@anyEmail.com", password: "password")
      @user.send_password_reset
    end
    
    it "atualiza a senha do usuario" do
      put :update, params: {id: @user.password_reset_token}
      expect(assigns(:user).save).to be(true)
      expect(response).to render_template(root_path)
    end
    
    it "falha ao identificar usuário" do
      put :update, params: {id: @user.password_reset_token}
      expect(response).to render_template("password_resets/edit")
    end
    
  end
  
end
