Given(/^I visit the homepage$/) do
  visit :home
end

Then(/^I should see the button "Login"$/) do
    expect(page).to have_selector(:link_or_button, 'Login')
end

And (/^I should see the button "Cadastre-se"$/) do
     expect(page).to have_selector(:link_or_button, 'Cadastre-se')
end