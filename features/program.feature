@api
Feature: Program
  In order to decide whether I am interested in the event
  As a anonymous user
  I need to be able to see the program

  Scenario: Display list of events
    Given "event" content:
    | title       | promote | body                         |
    | Event one   |       1 | Lorem ipsum dolor site amet. |
    | Event two   |       1 | Lorem ipsum dolor site amet. |
    | Event three |       1 | Lorem ipsum dolor site amet. |
    | Event four  |       1 | Lorem ipsum dolor site amet. |
    | Event five  |       1 | Lorem ipsum dolor site amet. |
    When I am on the homepage
    Then I should see "Event one"
    And I should see "Event two"
    And I should see "Event three"
    And I should see "Event four"
    And I should see "Event five"
