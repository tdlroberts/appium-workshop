Feature: Filters

  Scenario: Validate intro screen elements
    Given I am on intro screen
  Scenario: User creates an empty filter
    Given I am on extra filters screen
    Given I am on create filter screen
    When I create empty property filter
  Scenario: User creates a filter with values
    Given I am on create filter screen
    When I create filled filter
    Then I validate filter
