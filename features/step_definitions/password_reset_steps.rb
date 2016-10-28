Given(/^that I go to "Login"$/) do
  visit ('users/login')
end

Then(/^I should be on recover password screen$/) do
  expect(page).to have_content("Recuperar Senha")
end

Given(/^that I am on recover password page$/) do
  visit ('password_resets/new')
end

Then(/^I should be redirected to home screen$/) do
  visit ('/')
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

Given(/^I am not a user with the e\-mail "([^"]*)"$/) do |email|
  @user = User.find_by_email(email)
  @user.nil?
end