Given(/^I am a user with the e\-mail "([^"]*)"$/) do |email|
  @user = User.find_by_email(email)
  @user != nil
end

Given(/^I am on "Login"$/) do
  visit ('users/login')
end

Then(/^I should be on "([^"]*)"$/) do |dashboard| 
    visit('/'+dashboard)
end
