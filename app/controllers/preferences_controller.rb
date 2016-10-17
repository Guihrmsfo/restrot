require 'bcrypt'
class PreferencesController < ApplicationController
include BCrypt


    def new
        @user = User.new
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