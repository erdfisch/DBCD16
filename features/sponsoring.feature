@api
Feature: Sponsoring
  In order to run the event
  As a event organizer
  I need to be able to display sponsoring information

  Scenario: Display sponsoring information
    When I am on the homepage
    Then I should see "Sponsors"

  Scenario: Display sponsors
    Given "sponsor" content:
      | title            | field_sponsor_level |
      | Sponsor one      | Platinum            |
      | Sponsor two      | Gold                |
      | Sponsor three    | Silver              |
      | Sponsor four     | Bronze              |
      | Sponsor five     | Raspberry           |
    When I am on the homepage
    Then I should see the text "Platinum"
    Then I should see the text "Gold"
    Then I should see the text "Silver"
    Then I should see the text "Bronze"
    Then I should see the text "Raspberry"
