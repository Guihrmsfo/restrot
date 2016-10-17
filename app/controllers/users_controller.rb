require 'bcrypt'

class UsersController < ApplicationController
    include BCrypt
    
    def new
        @user = User.new
    end
  
    def login
        
        if !session[:user_id].nil?
            @user = User.find_by id: session[:user_id]
            if !@user.nil?
                redirect_to :controller => 'dashboard', :action => 'dashboard' 
                return
            end
        end
        
        if (params[:user]).present?  
            @user = User.find_by name: params[:user][:name]
            
            if !@user.nil?
            
                @password = BCrypt::Engine.hash_secret(params[:user][:password], @user.salt)
                if @password == @user.password
                    if @user.confirmed_email
                        flash[:notice] = "Login realizado com sucesso!"
                        flash[:color]= "Válido"
                        session[:user_id] = @user.id
                        redirect_to :controller => 'dashboard', :action => 'dashboard' 
                        return
                    else
                        flash.now[:error] = "Por favor, confirme seu e-mail para ativar sua conta"
                    end
                    
                else
                    flash.now[:error] = "Senha inválida"
                end
                
            else
                
                flash.now[:error] = "Nome de usuário inválido"
                
            end
            
        end 
        render "login"
    end
  
    def create
        if (params[:user]).present?  
            params.permit!
            @user = User.new(params[:user])
    
            if @user.save
                UserMailer.registration_confirmation(@user).deliver
                flash[:success] = "Por favor, confirme seu e-mail para ativar sua conta"
                render "login"
                return
            else
                flash.now[:error] = "Dados inválidos"
            end
            
        end
        
        render "new"
    end
    
    def confirm_email
    user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Seja bem-vindo ao Restrot. Faça login para continuar"
            render "login"
        else
            flash[:error] = "Usuário inexistente"
            redirect_to :controller => 'home', :action => 'index' 
        end
    end
    
end
