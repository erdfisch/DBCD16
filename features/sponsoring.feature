@api
Feature: Sponsoring
  In order to run the event
  As a event organizer
  I need to be able to display sponsoring information

  Scenario: Display sponsoring information
    When I am on the homepage
    Then I should see "Sponsoring"

  Scenario: Display sponsors
    Given "sponsor" content:
      | title            | promote | body                         |
      | Sponsor one      |       1 | Lorem ipsum dolor site amet. |
      | Sponsor two      |       1 | Lorem ipsum dolor site amet. |
      | Sponsor three    |       1 | Lorem ipsum dolor site amet. |
      | Sponsor four     |       1 | Lorem ipsum dolor site amet. |
      | Sponsor five     |       1 | Lorem ipsum dolor site amet. |
    When I am on the homepage
    Then I should see "Sponsor one"
    And I should see "Sponsor two"
    And I should see "Sponsor three"
    And I should see "Sponsor four"
    And I should see "Sponsor five"