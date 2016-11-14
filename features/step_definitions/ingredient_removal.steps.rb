Given(/^I have at least one ingredient$/) do
  @ingredient = Ingredient.new(id: 1, name: "Any Name", unit_of_measure: "Any unit")
  @ingredient.save
  @ingredients_users = IngredientsUser.new(user_id: User.all.first.id, ingredient_id: 1, quantity: 10)
  @ingredients_users.save
end

When(/^I click on the deletion button for the first ingredient$/) do
  page.find('spam.btn-danger').click
end

#Cannot "see" dialog in cucumber tests
#http://stackoverflow.com/questions/2458632/how-to-test-a-confirm-dialog-with-cucumber
And(/^I confirm deletion by clicking ok$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see the ingredient deleted$/) do
  #Capybara.using_wait_time(10) do
    expect(page).to have_current_path("/ingredients/index")
    expect(page).not_to have_selector('tr[id^="ingredient"]')
  #end
end
