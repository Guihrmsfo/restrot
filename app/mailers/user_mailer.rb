class UserMailer < ActionMailer::Base
    default :from => "noreplyrestrot@gmail.com"

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.name} <#{user.email}>", :subject => "Confirmação de Cadastro")
    end
    
end    