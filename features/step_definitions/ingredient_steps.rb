
Then(/^I should see my list of ingredients$/) do
  expect(page).to have_content("Meus Ingredientes")
end

#When(/^I go to my ingredients dashboard$/) do
#  visit('../ingredients/index')
#end