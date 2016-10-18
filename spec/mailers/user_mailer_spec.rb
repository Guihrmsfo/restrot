require 'rails_helper'
require 'spec_helper'

RSpec.describe UserMailer, type: :model do
    describe 'registration_confirmation' do
        let(:user) { double User, name: 'Guilherme', email: 'guilherme_oliveira55@hotmail.com', confirm_token: '123456' }
        let(:mail) { described_class.registration_confirmation(user).deliver_now }

        it 'renders the subject' do
          expect(mail.subject).to eq('Confirmação de Cadastro')
        end
    
        it 'renders the receiver email' do
          expect(mail.to).to eq([user.email])
        end
    
        it 'renders the sender email' do
          expect(mail.from).to eq(['noreplyrestrot@gmail.com'])
        end

    end
end
