require 'bcrypt'
class PreferencesController < ApplicationController
include BCrypt
    def new
        @user = User.new
    end
    
    def preferences
        
        if session[:user_id].nil?
            redirect_to :controller => 'users', :action => 'login' 
            return
        else
            render "preferences"
        end
      
    end
    
    def password

        if session[:user_id].nil?
            redirect_to :controller => 'users', :action => 'login' 
            return
        else
=begin
            @user = User.find(session[:user_id])
            puts @user.name
            if (params[:user]).present?
                if(params[:user][:password].present? && params[:user][:oldPassword].present? && params[:user][:passwordConfirmation].present? )
                    @password = BCrypt::Engine.hash_secret(params[:user][:oldPassword], @user.salt)
                    if @password == @user.password
                        if params[:user][:password] == params[:user][:passwordConfirmation]
                            @user.salt = nil
                            @user.password = params[:user][:password]
                            if @user.save
                                flash[:notice] = "Senha alterada com sucesso!"
                                flash[:color]= "Válido"
                                return
                            else
                                flash[:notice] = "Erro!"
                                flash[:color]= "Inválido"
                                return
                            end
                        else
                            flash[:notice] = "Senha e confirmação de senha não são iguais"
                            flash[:color]= "Válido"
                            return
                        end
                    else
                        flash[:notice] = "Senha inválida"
                        flash[:color]= "Inválido"
                        return
                    end
                else
                    flash[:notice] = "Complete todos os campos"
                    flash[:color]= "Inválido"
                    return
                end
            else
                flash[:notice] = "Campo vazio"
                flash[:color]= "Inválido"
                return
            end
=end
            render "password"
        end
    end
end