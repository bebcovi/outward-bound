Feature: Posts

  As an admin
  I want to be able to manage posts

  @javascript
  Scenario: Creating
    Given I'm logged in to the admin page
      And I have created a document

    When I click on "Posts"
      And I click on "New Post"
      And I check "English?"
      And I fill in the English title and body
      And I attach a cover photo
      And I attach 3 photos
      And I attach 1 attachment
      And I click on "Create Post"
    Then the post should be successfully created
      And the post should have 3 photos
      And the post should have 1 attachments

  @javascript
  Scenario: Editing
    Given I have created a post
      And I'm logged in to the admin page

    When I click on "Posts"
      And I click on "Edit"
      And I mark 2 photos for deletion
      And I attach 1 new photo
      And I mark 1 file for deletion
      And I attach 2 attachments
      And I click on "Update"
    Then the post should be successfully updated
      And the post should have 2 photos
      And the post should have 2 attachments

  Scenario: Viewing
    Given I have created a post

    When I visit the news page
    Then I should see the post

    When I click on the post
    Then I should see the post
