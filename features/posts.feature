@javascript
Feature: Posts

  As an admin
  I want to be able to manage posts

  Scenario: Managing
    When I log in to the admin page
      And I click on "Posts"
      And I click on "New Post"
      And I check "English?"
      And I fill in "Title en" with "Post title"
      And I fill in "Body en" with "Post body"
      And I attach a cover photo
      And I click on "Create Post"
    Then I should be able to attach photos

    When I attach 3 photos
    And I click on "Save"
    Then the post should be successfully updated
    And the post should have 3 photos

    When I visit the news page
    Then I should see the post

    When I click on the post
    Then I should see the post
