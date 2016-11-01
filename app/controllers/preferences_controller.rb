require 'bcrypt'
class PreferencesController < SessionController
include BCrypt
    
    layout 'admin_lte_2_prefs'
    
    def preferences
       render "preferences"
    end
    
    def profile
        @user = current_user
        
        if params[:user]
            @user.profile_name = params[:user][:profile_name]
            @user.profile_last_name = params[:user][:profile_last_name]
            @user.profile_image = params[:user][:profile_image_url]
            
            # File Upload has been deprecated, heroku doesn't support file uploading
            # uploaded_io = params[:user][:profile_image]
            #
            #
            # if !uploaded_io.nil? && !@user.name.nil?
            #    File.open(Rails.root.join('public', 'assets', 'profile_images', @user.name + ".jpg"), 'wb') do |file|
            #        file.write(uploaded_io.read)
            #    end
            # end
            
            if @user.save 
                flash[:notice] = "Perfil atualizado com sucesso!"
            else
                @user.errors.full_messages.each do |error| 
                    flash[:alert] = error
                end
            end
        end
        
        params[:user] = current_user
    end
    
    def password

        @user = current_user
        
        if params[:user]
            if(params[:user][:password] == params[:user][:passwordConfirmation])
                @password = BCrypt::Engine.hash_secret(params[:user][:oldPassword], @user.salt)
                if(@password == @user.password)
                    @user.password = params[:user][:password]
                    @user.updating_password = true;
                    if @user.save 
                        flash[:notice] = "Perfil atualizado com sucesso!"
                    else
                        @user.errors.full_messages.each do |error| 
                            flash[:alert] = error
                        end
                    end
                else
                    flash.now[:alert] = "Senha antiga incorreta"
                end
            end
        end
        params[:user] = current_user
    end
=begin  
        if (params[:user]).present?
            if params[:user][:password].length > 7 && params[:user][:password].length < 21
                @password = BCrypt::Engine.hash_secret(params[:user][:oldPassword], @user.salt)
                if @password == @user.password
                    if params[:user][:password] == params[:user][:passwordConfirmation]
                        @user.salt = nil
                        @user.password = params[:user][:password]
                        if @user.save
                            flash.now[:notice] = "Senha alterada com sucesso!"
                        else
                            flash.now[:alert] = "Erro"
                        end
                    else
                        flash.now[:alert] = "Senha nova e confirmação não combinam"
                    end
                else
                    flash.now[:alert] = "Senha antiga incorreta"
                end
            else
                flash.now[:alert] = "Nova senha invalida"
            end
        end
        end
=end
end
