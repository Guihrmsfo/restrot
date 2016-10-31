require 'rails_helper'
require 'spec_helper'

RSpec.describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit 'users/login'
    click_link "Esqueci minha senha"
    fill_in "Email", :with => user.email
    click_button "Recuperar Senha"
  end
end
