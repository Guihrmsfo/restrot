Given(/^I am a logged user with id "([^"]*)"$/) do |id|
  @user = User.new(id: id, name: 'any_name', email: 'any_name@gmail.com', password: '123456') 
  @user.save  
  @user.confirmed_email = true
  @user.save
end

Given(/^I am on "Dashboard"$/) do
  visit ('dashboard/dashboard')
end

When(/^I click on "Logout Icon"$/) do
  page.find("#logout").click
end
