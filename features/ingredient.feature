Feature: Ingredients and Receipts Visualization
  In order to manage my ingredients and see receipts
  As a user
  I want to see these items in my dashboard
  
    Scenario: See ingredients list
      Given I am a registered user with the username "any_name" and password "123456"
      And I am on "users/login"
      When I fill in user_name with "any_name"
      And I fill in user_password with "123456"
      And I press "Login"
      Then I should be on my dashboard
      And I should see my last registered ingredients
    
    Scenario: Option to see all ingredients
      Given I am a registered user with the username "any_name" and password "123456"
      And I am on "users/login"
      When I fill in user_name with "any_name"
      And I fill in user_password with "123456"
      And I press "Login"
      Then I should be on my dashboard
      And I should see my last registered ingredients
      When I click on the "Ver todos" button
      Then I should be on my ingredients page
    
    Scenario: Option to go to My Ingredients page
      Given I am a registered user with the username "any_name" and password "123456"
      And I am on "users/login"
      When I fill in user_name with "any_name"
      And I fill in user_password with "123456"
      And I press "Login"
      Then I should be on my dashboard
      When I click on "Meus Ingredientes" in the sidebar menu
      Then I should be on my ingredients page
      
      
      
      