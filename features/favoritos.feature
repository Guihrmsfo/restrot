Feature: Log in must be successfull
  In order to use the website features
  As a user
  I want to log in into the website
  
    Scenario: User log in
        Given I am a registered user with the username "any_name" and password "123456"
        And I am on "users/login"
        When I fill in user_name with "any_name"
        And I fill in user_password with "123456"
        And I press "Login"
        Then I should be on "dashboard/dashboard"
        And I press "Favoritos"
        Then I should be on "favorites/index"
  