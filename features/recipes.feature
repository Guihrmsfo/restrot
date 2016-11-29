Feature: Recipe search page must be accessible
  In order to see the recipes that matches with my ingredients
  As a user
  I want to access the recipe search page
  
    Scenario: See Recipes Search Page
      Given I am a registered user with the username "any_name" and password "123456"
      And I am on "users/login"
      When I fill in user_name with "any_name"
      And I fill in user_password with "123456"
      And I press "Login"
      Then I should be on my dashboard
      And I press "Nova Busca"
      Then I should be on "recipes/search"
        
    Scenario: Option to see the complete recipe
        Given I am a registered user with the username "any_name" and password "123456"
        And I am on "users/login"
        When I fill in user_name with "any_name"
        And I fill in user_password with "123456"
        And I press "Login"
        Then I should be on "dashboard/dashboard"
        And I press "Nova Busca"
        Then I should be on "recipes/search"
        And I should see the recipes results
        And I should see the button "Ver Receita"
    
    Scenario: Option to favorite a recipe
        Given I am a registered user with the username "any_name" and password "123456"
        And I am on "users/login"
        When I fill in user_name with "any_name"
        And I fill in user_password with "123456"
        And I press "Login"
        Then I should be on "dashboard/dashboard"
        And I press "Nova Busca"
        Then I should be on "recipes/search"
        And I should see the recipes results
        And I should see the button "Favoritar"