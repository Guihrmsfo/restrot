class UserMailer < ApplicationMailer
  
  def registration_confirmation(user)
      @user = user
      mail(:to => "#{user.name} <#{user.email}>", :subject => "Confirmação de Cadastro")
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "[Restrot] Recuperação de Senha"
  end
  
end
