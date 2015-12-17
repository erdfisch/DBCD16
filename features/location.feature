@api
Feature: Location
  In order to know where to go
  As a anonymous user
  I need some information about the venue

  Scenario: Display list pages
    Given "page" content:
    | title       | promote | body                         |
    | Page one    |       1 | Lorem ipsum dolor site amet. |
    | Page two    |       1 | Lorem ipsum dolor site amet. |
    When I am on the homepage
    Then I should see "Page one"
    And I should see "Page two"
