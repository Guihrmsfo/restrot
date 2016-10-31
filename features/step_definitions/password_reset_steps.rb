Given(/^I am a registered user with the email "([^"]*)"$/) do |email|
  @user = User.new(name: 'username', email: email, password: 'password') 
  @user.save  
  @user.confirmed_email = true
  @user.save
end

Given(/^I am not a registered user with the email "([^"]*)"$/) do |email|
  @user = User.new(name: 'username', email: 'other_email@email.com', password: 'password') 
  @user.save  
  @user.confirmed_email = true
  @user.save
end

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

Then(/^I should receive a password reset email$/) do
  @user.send_password_reset
end

Given(/^I am not a user with the e\-mail "([^"]*)"$/) do |email|
  @user = User.find_by_email(email)
  @user.nil?
end

Given(/^I received a password reset e\-mail$/) do
  @user.send_password_reset
  @user.password_reset_sent_at = 3.hours.ago
end

When(/^I click on the link, I am on the recover password update page$/) do
  visit ('/password_resets/'+@user.password_reset_token+'/edit')
end

#test 
#testing