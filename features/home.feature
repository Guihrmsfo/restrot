#encoding: utf-8

Feature: Homepage should be displayed
  In order to understand the use the website
  As a user
  I want to see the homepage options
  
  Scenario: Viewing the homepage
    Given I visit the homepage
    Then I should see "Login"
    And I should see "Cadastre-se"