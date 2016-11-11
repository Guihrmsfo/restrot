Feature: Sign up must be successfull
  In order to use the website features
  As a user
  I want to sign up to the website

  Scenario: User sign up
    Given that I am not a user with email "cv.laura95@gmail.com"
    And I am on "users/create"
    When I fill in "user_name" with "cv.laura"
    And I fill in "user_email" with "cv.laura95@gmail.com"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Register"
    Then I should be on login screen
