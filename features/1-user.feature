Feature: 1. User feature

  Scenario: Simple filter tests
    Given I am on create filter screen
    Given I create empty property filter
    Given I create filled filter
    Then I validate filter
