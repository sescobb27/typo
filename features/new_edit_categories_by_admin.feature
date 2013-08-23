Feature: Creating and Editing Categories by admin
  As a blog admin
  In order to manage blog categories
  I should be able to Create or Edit article Categories

Background: # setup blog, login as admin
  Given the blog is set up
  And I am logged into the admin panel

  Scenario: Access Categories page by admin only
    Given I am on the admin page
    When I follow "Categories"
    Then I should be on the Categories page

  Scenario: Create a new category
    Given I am on the Categories page
    When I fill in "category_name" with "Spam"
    And I fill in "category_keywords" with "nuisance"
    And I fill in "category_description" with "automated or bots mischief"
    And I press "Save"
    Then I should see link to "Spam"

  Scenario: Edit an existing category
    Given I am on the Categories page
    When I fill in "category_name" with "Junk"
    And I fill in "category_keywords" with "useless"
    And I fill in "category_description" with "worthless"
    And I press "Save"
    Then I should see link to "Junk"
    And I follow "Junk"
    Then I should see field "category_name" with value "Junk"
    And I should see field "category_description" with value "worthless"

