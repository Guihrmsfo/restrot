require 'bcrypt'
class UsersController < ApplicationController
    include BCrypt
    
    def new
        @user = User.new
    end
  
    def login
        
        if !session[:user_id].nil?
            redirect_to :controller => 'dashboard', :action => 'dashboard' 
            return
        end
        
        if (params[:user]).present?  
            @user = User.find_by name: params[:user][:name]
            
            if !@user.nil?
            
                @password = BCrypt::Engine.hash_secret(params[:user][:password], @user.salt)
                
                if @password == @user.password
                    flash[:notice] = "Login realizado com sucesso!"
                    flash[:color]= "Válido"
                    session[:user_id] = @user.id
                    redirect_to :controller => 'dashboard', :action => 'dashboard' 
                    return
                else
                    flash[:notice] = "Senha inválida"
                    flash[:color]= "Inválido"
                end
                
            else
                
                flash[:notice] = "Nome de usuário inválido"
                flash[:color]= "Inválido"
                
            end
            
        end 
        render "login"
    end
  
    def create
        if (params[:user]).present?  
            params.permit!
            @user = User.new(params[:user])
            if (/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/ =~ @user.email) != nil
                if @user.save
                    flash[:notice] = "Cadastrado com sucesso!"
                    flash[:color]= "Válido"
                else
                    flash[:notice] = "Dados inválidos"
                    flash[:color]= "Inválido"
                end
            else
                flash[:notice] = "E-mail inválido"
                flash[:color]= "Inválido"
            end
        end
        render "new"
    end
  
  
    def edit
        @user =User.find(session[:user_id])
    end
    
    
    def password
        @user =User.find(session[:user_id])
        puts @user.name
        if (params[:oldPassword]).present?
            @password = BCrypt::Engine.hash_secret(params[@user.name][:oldPassword], @user.salt)
            if @password == @user.password
                if :password == :password_confirmation && @user.update_with_password(:password)
                    bypass_sign_in(@user)
                    redirect_to root_path
                    flash[:notice] = "Senha alterada com sucesso!"
                    flash[:color]= "Válido"
                    return
                else
                    flash[:notice] = "Senha e confirmação de senha não são iguais"
                    flash[:color]= "Válido"
                end
            else
                flash[:notice] = "Senha inválida"
                flash[:color]= "Inválido"
            end
        else
            flash[:notice] = "campo vazio"
            flash[:color]= "Inválido"
        end
       # render "edit" - falta o template
    end
end
