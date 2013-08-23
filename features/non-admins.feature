Feature: Merge Articles not allowed for non-Admins
  As a protective feature
  In order to allow only admins to merge articles
  non-Admins should not be able to merge articles

  Background:
    Given the blog is set up

    Scenario: Merge option does not exist for admin
      Given I am logged into the publisher panel
      And I am on the new article page
      When I fill in "article_title" with "PublisherFoobar"
      And I fill in "article__body_and_extended_editor" with "PublisherLorem Ipsum"
      And I press "Publish"
      And I follow "PublisherFoobar"
      Then I should not see "Merge Articles"