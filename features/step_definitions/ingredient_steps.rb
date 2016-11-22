When(/^I should be on my dashboard$/) do
    visit('dashboard/')
end

Then(/^I should see my last registered ingredients$/) do
  expect(page).to have_content("Últimos Ingredientes Cadastrados")
end

When(/^I click on the "Ver todos" button$/) do
  page.find("#ver-todos").click
end

When(/^I click on "Meus Ingredientes" in the sidebar menu$/) do
  page.find("#meus-ingredientes").click
end

Then(/^I should be on my ingredients page$/) do
  expect(page).to have_current_path("/ingredients/index")
end

When(/^I click on the "Editar" button$/) do
  first('a.btn-primary').click
end

When(/^I see at least one ingredient in my Ingredients List$/) do
  expect(page).to have_content("Medida")
end

Then(/^I should be on my edit ingredient page$/) do
  expect(page).to have_content("Qual a quantidade desse item que tem disponível?")
end