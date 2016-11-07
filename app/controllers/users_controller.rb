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
                    redirect_to :controller => 'dashboard', :action => 'dashboard'
                    session[:user_id] = @user.id
                    if @user.confirmed_email
                        flash[:notice] = "Login realizado com sucesso!"
                    else
                        flash[:alert] = "Por favor, confirme seu e-mail para ativar sua conta"
                    end
                    return
                else
                    flash.now["alert alert-danger"] = "Senha inválida"
                end
                
            else
                flash.now["alert alert-danger"] = "Nome de usuário inválido"
            end
            
        end 
        render "login"
    end
  
    def create
        if (params[:user]).present?  
            @user = User.new(user_params)
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
    user = User.find_by confirm_token: params[:id]
        if user
            user.email_activate
            flash[:success] = "Seja bem-vindo ao Restrot. Faça login para continuar"
            render "login"
        else
            flash[:error] = "Usuário inexistente"
            redirect_to :controller => 'home', :action => 'index' 
        end
    end
    
    private 
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :created_at, :updated_at)
    end
    
end
