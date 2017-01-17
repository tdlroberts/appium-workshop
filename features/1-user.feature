Feature: 1. User feature

  Scenario: Simple filter tests
    Given I am on create filter screen
    When I create empty property filter
    When I create filled filter
    Then I validate filter
