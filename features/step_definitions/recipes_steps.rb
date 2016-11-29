When(/^I should see my favorite recipes$/) do
  expect(page).to have_content("Favoritos")
end

Then(/^I should see the recipes results$/) do
  expect(page).to have_content("Busca de Receitas")
end
