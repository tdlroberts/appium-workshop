Feature: Filters

  Scenario: Validate intro screen elements
    Given I have opened intro screen
  Scenario: User creates an empty filter
    Given I have opened extra filters screen
    Given I have opened create filter screen
    When I create empty property filter
  Scenario: User creates a filter with values
    Given I have opened create filter screen
    When I create filled filter
    Then I validate filter
