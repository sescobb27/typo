Feature: Admins can Merge Articles
  As a blog admin
  In order to manage related blogs
  I should be able to merge specified articles

  Background: # setup articles for testing Merge functionality and status of merged article
    Given the blog is set up
    And I am logged into the admin panel

    When I am on the new article page
    And I fill in "article_title" with "Title1"
    And I fill in "article__body_and_extended_editor" with "Text1"
    And I press "Publish"

    When I am on the new article page
    And I fill in "article_title" with "Title2"
    And I fill in "article__body_and_extended_editor" with "Text2"
    And I press "Publish"

    When I visit article with title "Title1"
    And I fill in "comment_author" with "Author1"
    And I fill in "comment_body" with "Title1-Good"
    And I press "comment"

    When I visit article with title "Title2"
    And I fill in "comment_author" with "Author2"
    And I fill in "comment_body" with "Title2-Bad"
    And I press "comment"

    Scenario: Merge option exists for admin
      When I edit article with title "Title1"
      Then I should see "Merge Articles"

    Scenario: Merged article should contain comments from both articles
      When I edit article with title "Title1"
      And I merge in article with title "Title2"
      And I visit article with title "Title1"
      Then I should see texts "Text1" and "Text2" in merged article
      Then I should see comments "Title1-Good" and "Title2-Bad" in merged article