Feature: Merge Files
  As a blogger
  In order to merge different articles with same topic
  I want merge files

  Scenario: I am not a blogger admin
    Given I am on the edit article "SaaSRoR" page
    Then The 'merge_with' form should not be present 

  Scenario: When articles are merged
    Given I am on the edit article "SaaSRoR" page
    When I fill 'merge_with' form with '1'
    Then I press the 'merge' button
    And I see the text of both previous articles together
    And I see only one Author's name
    And I see only one article's title
    And I see all comments together