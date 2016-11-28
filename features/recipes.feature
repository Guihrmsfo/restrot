Feature: Recipes Search
  In order to find recipes according to my ingredients
  As a user
  I want to search recipes by my chosen ingredients
  
    Scenario: See Recipes Search Page
      Given I am a registered user with the username "any_name" and password "123456"
      And I am on "users/login"
      When I fill in user_name with "any_name"
      And I fill in user_password with "123456"
      And I press "Login"
      Then I should be on my dashboard
      And I press "Nova Busca"
      Then I should be on "recipes/search"
      