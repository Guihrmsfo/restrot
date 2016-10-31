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
      And I am a registered user with the email "email@email.com"
      And I fill in "email" with "email@email.com"
      When I press "Recuperar Senha"
      Then I should be redirected to home screen

    Scenario: Email dos not exist in records
      Given that I am on recover password page
      And I am not a registered user with the email "email@email.com"
      And I fill in "email" with "email@email.com"
      When I press "Recuperar Senha"
      Then I should see "O e-mail digitado não corresponde a um usuário"
      And I should receive a password reset email
      
    Scenario: I click on recuperation link on my email
      Given I am a registered user with the email "email@email.com"
      And I received a password reset e-mail
      When I click on the link, I am on the recover password update page
      Then I should see "Digite uma nova senha"