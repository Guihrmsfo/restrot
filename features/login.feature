Feature: Favorites page must be visible
  In order to easily access my favorite recipes
  As a user
  I want to see my favorites page
  
    Scenario: Favorites Page
        Given I am a registered user with the username "any_name" and password "123456"
        And I am on "users/login"
        When I fill in user_name with "any_name"
        And I fill in user_password with "123456"
        And I press "Login"
        Then I should be on "dashboard/dashboard"
  