Given(/^I am a user with the e\-mail "([^"]*)"$/) do |email|
  @user = User.new(:name => 'cv.laura', :email => 'cv.laura95@gmail.com', :password => '123456', :password_confirmation => '123456')
end

Given(/^I am on "Login"$/) do
  visit ('users/login')
end

Then(/^I should be on "([^"]*)"$/) do |dashboard| 
    visit('/'+dashboard)
end
