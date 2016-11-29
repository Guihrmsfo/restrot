When(/^I should see my favorite recipes$/) do
  expect(page).to have_content("Favoritos")
end

Then(/^I should see the recipes results$/) do
  expect(page).to have_content("Busca de Receitas")
end

When(/^I have "([^"]*)" in my ingredients list$/) do |ingredient|
  @ingredient = Ingredient.new(name: ingredient, unit_of_measure: "Unit")
  @ingredient.save
  @ingredients = IngredientsUser.new(user_id: 500, ingredient_id: @ingredient.id, quantity: 5)
  @ingredients.save
end

Then(/^I should see the checkbox for "([^"]*)"$/) do |ingredient|
  expect(page).to have_selector("input[value='#{ingredient}']")
end

Then(/^I select the checkbox "([^"]*)"$/) do |ingredient|
  find("input[value='#{ingredient}']").set(true)
end