@javascript
Feature: Carousel photos

  As an admin
  I want to be able to manage carousel photos

  Scenario: Managing
    When I log in to the admin page
      And I click on "Carousel Photos"
      And I click on "New Carousel Photo"
      And I attach a photo
      And I click on "Create Carousel photo"
    Then I should be able to crop the photo

    When I choose the crop area
      And I click on "Save"
    Then I should see the carousel photo

    When I visit the home page
    Then I should see the carousel photo
