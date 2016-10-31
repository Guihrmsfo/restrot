require 'bcrypt'
class PreferencesController < ApplicationController
include BCrypt
    
    layout 'admin_lte_2_prefs'
    
    def new
        @user = User.new
    end
    
    def preferences
        
        if session[:user_id].nil?
            redirect_to :controller => 'users', :action => 'login'
            return
        else
            # render "preferences"
        end
      
    end
    
    def password

        if session[:user_id].nil?
            redirect_to :controller => 'users', :action => 'login'
            return
        else
            @user = User.find(session[:user_id])
            if (params[:user]).present?
                if(params[:user][:password].present? && params[:user][:oldPassword].present? && params[:user][:passwordConfirmation].present? )
                    if(params[:user][:password].length < 6 || params[:user][:password].length > 20)
                        flash.now[:notice] = "Nova senha deve ter entre 6 e 20 caracteres"
                    else
                        @password = BCrypt::Engine.hash_secret(params[:user][:oldPassword], @user.salt)
                        if @password == @user.password
                            if params[:user][:password] == params[:user][:passwordConfirmation]
                                @user.salt = nil
                                @user.password = params[:user][:password]
                                if @user.save
                                    flash.now[:notice] = "Senha alterada com sucesso!"
                                else
                                    flash.now[:notice] = "Erro!"
                                end
                            else
                                flash.now[:notice] = "Senha nova e confirmação não combinam"
                            end
                        else
                            flash.now[:notice] = "Senha antiga incorreta"
                        end
                    end
                else
                    flash.now[:notice] = "Digite todos os dados"
                end
            end
        end
    end
end
