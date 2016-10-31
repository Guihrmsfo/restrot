Feature: Log out must be successfull
  In order to desconnect
  As a user
  I want to log out of the website
  
    Scenario: User log out
        Given I am a registred user with the username "any_name" and password "123456"
        And I am on "users/login"
        When I fill in user_name with "any_name"
        And I fill in user_password with "123456"
        And I press "Login"
        Then I should be on "dashboard/dashboard"
        When I click on "Logout Icon"
        Then I should be on ""
  