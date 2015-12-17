@api
Feature: Tickets
  In order to attend the event
  As a anonymous user
  I need to be able to book tickets

  Scenario: Display ticket information
    When I am on the homepage
    Then I should see "Tickets"
