@api
Feature: Jobs
  In order to get sponsors
  As a event organizer
  I need to be able to display job listings

  Scenario: Display job listings
    When I am on the homepage
    Then I should see "Jobs"

  Scenario: Display jobs
    Given "job" content:
      | title        | promote | body                         |
      | Job one      |       1 | Lorem ipsum dolor site amet. |
      | Job two      |       1 | Lorem ipsum dolor site amet. |
      | Job three    |       1 | Lorem ipsum dolor site amet. |
      | Job four     |       1 | Lorem ipsum dolor site amet. |
      | Job five     |       1 | Lorem ipsum dolor site amet. |
    When I am on the homepage
    Then I should see "Job one"
    And I should see "Job two"
    And I should see "Job three"
    And I should see "Job four"
    And I should see "Job five"