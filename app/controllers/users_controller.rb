class UsersController < ApplicationController
  def new
    @user = User.new 
  end
  def create
    if (params[:user]).present?  
        params.permit!
        @user = User.new(params[:user])
        if @user.save
          flash[:notice] = "Cadastro com sucesso!"
          flash[:color]= "valid"
        else
          flash[:notice] = "Dados inválidos"
          flash[:color]= "invalid"
        end
    end
    render "new"
  end
end
