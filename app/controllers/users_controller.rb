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
                    flash[:error] = "Senha inválida"
                    flash[:color]= "Inválido"
                end
                
            else
                
                flash[:error] = "Nome de usuário inválido"
                flash[:color]= "Inválido"
                
            end
            
        end 
        render "login"
    end
  
    def create
        if (params[:user]).present?  
            params.permit!
            if @user.save
                flash[:notice] = "Cadastrado com sucesso!"
                flash[:color]= "Válido"
            else
                flash[:error] = "Dados inválidos"
                flash[:color]= "Inválido"
            end
        end
        render "new"
    end
end
