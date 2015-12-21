@api @test
Feature: Twitter
  In order be socially inforemd
  As an anonymous user
  I want to see the latest hashtagged tweets

  Scenario: Display tweets
    When I am on the homepage
    Then I should see "Twitter feed"
