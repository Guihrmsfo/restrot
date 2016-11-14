Feature: Ingredients Removal
  In order to manage my ingredients
  As a user
  I want to remove one ingredient from my ingredient list
  
  @javascript
  Scenario: Option to see all ingredients
    Given I am a registered user with the username "any_name" and password "123456"
    And I am on "users/login"
    When I fill in user_name with "any_name"
    And I fill in user_password with "123456"
    And I press "Login"
    Then I should be on "dashboard/dashboard"
    Given I have at least one ingredient
    And I am on "ingredients/index"
    When I click on the deletion button for the first ingredient
    And I confirm deletion by clicking ok
    Then I should not see the ingredient deleted
