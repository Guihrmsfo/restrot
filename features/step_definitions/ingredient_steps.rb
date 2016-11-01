
Then(/^I should see my last registered ingredients$/) do
  expect(page).to have_content("Últimos Ingredientes Cadastrados")
end

When(/^I should be on my dashboard$/) do
    visit('dashboard/')
end

And (/^I want to be able to click on "Ver todos"$/) do
     expect(page).to have_selector(:link_or_button, 'Ver todos')
end