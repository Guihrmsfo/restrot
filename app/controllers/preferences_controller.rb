require 'bcrypt'
class PreferencesController < SessionController
include BCrypt

    layout 'admin_lte_2'
    
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
    
    def profile
        @user = current_user
        
        if params[:user]
            @user.profile_name = params[:user][:profile_name]
            @user.profile_last_name = params[:user][:profile_last_name]
            
            uploaded_io = params[:user][:profile_image]
            
            if !uploaded_io.nil?
                File.open(Rails.root.join('public', 'assets', 'profile_images', @user.name + ".jpg"), 'wb') do |file|
                    file.write(uploaded_io.read)
                end
            end
            
            Rails.cache.clear
            
            @user.save
            flash[:notice] = "Perfil atualizado com sucesso!"
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