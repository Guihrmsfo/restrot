Feature: Log in must be successfull
  In order to use the website features
  As a user
  I want to log in into the website
  
    Scenario: User log in
        Given I am a user with the e-mail "cv.laura95@gmail.com"
        And I am on "Login"
        When I fill in "user_name" with "cv.laura"
        And I fill in "user_password" with "123456"
        And I press "Login"
        Then I should be on "dashboard/dashboard"
  