@api
Feature: Program
  In order to decide whether I am interested in the event
  As a anonymous user
  I need to be able to see the program

  Scenario: Display list of events
    Given "event" content:
    | title       | promote | body                         | field_track      |
    | Event one   |       0 | Lorem ipsum dolor site amet. | Business track   |
    | Event two   |       0 | Lorem ipsum dolor site amet. | Business track   |
    | Event three |       0 | Lorem ipsum dolor site amet. | Business track   |
    | Event four  |       0 | Lorem ipsum dolor site amet. | Community Sprint |
    | Event five  |       0 | Lorem ipsum dolor site amet. | Community Sprint |
    | Event six   |       0 | Lorem ipsum dolor site amet. | Community Sprint |
    When I am on the homepage
    Then I should see "Event one"
    And I should see "Event two"
    And I should see "Event three"
    And I should see "Event four"
    And I should see "Event five"
    And I should see "Event six"
