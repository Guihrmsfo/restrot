require 'bcrypt'
class PreferencesController < SessionController
include BCrypt

    layout 'admin_lte_2'
    
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

        if session[:user_id].nil?
            redirect_to :controller => 'users', :action => 'login' 
            return
        else
            @user = User.find(session[:user_id])
            if (params[:user]).present?
                if(params[:user][:password].present? && params[:user][:oldPassword].present? && params[:user][:passwordConfirmation].present? )
                    if(params[:user][:password].length < 6 || params[:user][:password].length > 20)
                        flash[:notice] = "Nova senha deve ter entre 6 e 20 caracteres"
                    else
                        @password = BCrypt::Engine.hash_secret(params[:user][:oldPassword], @user.salt)
                        if @password == @user.password
                            if params[:user][:password] == params[:user][:passwordConfirmation]
                                @user.salt = nil
                                @user.password = params[:user][:password]
                                if @user.save
                                    flash[:notice] = "Senha alterada com sucesso!"
                                    redirect_to root_path
                                else
                                    flash[:notice] = "Erro!"
                                end
                            else
                                flash[:notice] = "Senha nova e confirmação não combinam"
                                render :password
                            end
                        else
                            flash[:notice] = "Senha antiga incorreta"
                            render :password
                        end
                    end
                end
            end
        end
    end
end