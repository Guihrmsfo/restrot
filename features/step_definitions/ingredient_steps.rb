
Then(/^I should see my last registered ingredients$/) do
  expect(page).to have_content("Últimos Ingredientes Cadastrados")
end

When(/^I should be on my dashboard$/) do
    visit('dashboard/')
end

Then(/^I should be on my ingredients page$/) do
  visit('ingredients/index')
end

When(/^I click on the "Ver todos" button$/) do
  page.find("#ver-todos").click
end

When(/^I click on "Meus Ingredientes" in the sidebar menu$/) do
  page.find("#meus-ingredientes").click
end