Given(/^that I am not a user with email "([^"]*)"$/) do |email|
   @user = User.find_by_email(email)
   @user = nil
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in field, :with => content
end

Given(/^I press "([^"]*)"$/) do |button|
    click_on button
    @user = User.new(:name => 'cv.laura', :email => 'cv.laura95@gmail.com', :password => '123456', :password_confirmation => '123456')
end

Then(/^I should be on confirmation screen$/) do
    expect(page).to have_content("Por favor, confirme seu e-mail para ativar sua conta")
end