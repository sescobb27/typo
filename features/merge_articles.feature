Feature: Merge Files
  As a non-admin
  I can not merge files

  Scenario: Try to merge files
    Given I am not an admin
    When I try to merge files
    Then I should be redirected to home page
    And I should see a error message
