Given(/^I visit the homepage$/) do
  visit :home
end

Then(/^I should see the button "([^"]*)"$/) do |button|
  expect(page).to have_selector(:link_or_button, button)
end