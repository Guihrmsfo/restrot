Feature: Password reset must be sucessfull
  In order to recover my password
  As a user
  I want to recover my password if I forget
  
    Scenario: Redirect to Recover Password Page
      Given that I go to "Login"
      When I press "Esqueci minha senha"
      Then I should be on recover password screen
    
    Scenario: Get recover password e-mail and be redirected
      Given that I am on recover password page
      And I am a user with the e-mail "cv.laura95@gmail.com"
      And I fill in "email" with "cv.laura95@gmail.com"
      When I press "Recuperar Senha"
      Then I should be redirected to home screen

    Scenario: Email dos not exist in records
      Given that I am on recover password page
      And I am not a user with the e-mail "cv.laura95@gmail.com"
      And I fill in "email" with "cv.laura95@gmail.com"
      When I press "Recuperar Senha"
      Then I should see "O e-mail digitado não corresponde a um usuário"