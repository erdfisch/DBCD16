@api
Feature: News
  In order to be informed on the latest topics
  As a anonymous user
  I need to see a list of news

  Scenario: Display list news
    Given "article" content:
    | title            | promote | body                         |
    | Article one      |       1 | Lorem ipsum dolor site amet. |
    | Article two      |       1 | Lorem ipsum dolor site amet. |
    | Article three    |       1 | Lorem ipsum dolor site amet. |
    | Article four     |       1 | Lorem ipsum dolor site amet. |
    | Article five     |       1 | Lorem ipsum dolor site amet. |
    When I am on the homepage
    Then I should see "Article one"
    And I should see "Article two"
    And I should see "Article three"
    And I should see "Article four"
    And I should see "Article five"
