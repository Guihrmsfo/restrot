Given(/^that I am not a user with email "([^"]*)"$/) do |email|
   @user = User.find_by_email(email)
   @user = nil
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in field, :with => content
end

Given(/^I press "([^"]*)"$/) do |button|
    click_on button
    @user = User.new(:name => 'any name', :email => 'any-email@gmail.com', :password => '123456', :password_confirmation => '123456')
end

Then(/^I should be on login screen$/) do
    expect(page).to have_content("Cadastro realizado com sucesso")
end
