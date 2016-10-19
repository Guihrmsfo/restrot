class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_path, :notice => "Um email foi enviado com as intruções de recuperação"
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Recuperação de Senha Expirada!"
    else
      if (params[:user]).present?
        if params[:user][:password] == params[:user][:password_confirmation]
          if(params[:user][:password].length < 6 || params[:user][:password].length > 20)
            render :edit, :notice => "Senha deve ter entre 6 e 20 caracteres"
          else
            @user.salt = nil
            @user.password = params[:user][:password]

            if @user.save
               redirect_to root_path, :notice => "Senha redefinida com sucesso!"
            else
              flash[:notice] = "Erro!"
            end
          end
        else
          flash[:notice] = "Nova senha e confirmação de senha não são iguais"
        end
      else
        render :edit
      end
    end
  end
end