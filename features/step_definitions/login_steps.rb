Given(/^I am a registred user with the username "([^"]*)" and password "([^"]*)"$/) do |name, password|
  @user = User.new(name: name, email: 'any_name@gmail.com', password: password) 
  @user.save  
  @user.confirmed_email = true
  @user.save
end

Given(/^I am on "([^"]*)"$/) do |location|
  visit (location)
end

Given(/^I fill in user_name with "([^"]*)"$/) do |user_name|
  fill_in "user[name]", :with => user_name  
end

Given(/^I fill in user_password with "([^"]*)"$/) do |user_password|
  fill_in "user[password]", :with => user_password  
end

Then(/^I should be on "([^"]*)"$/) do |location| 
  expect(page).to have_current_path("/"+location)
end
