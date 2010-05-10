Feature: Folders administration


  Scenario: Visit folder index
    Given I visit "/folders"
    Then response code should be "200"
