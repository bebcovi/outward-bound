Feature: Carousel photos

  As an admin
  I want to be able to manage carousel photos

  Scenario: Creating
    Given I'm logged in to the admin page

    When I click on "Carousel Photos"
      And I click on "New Carousel Photo"
      And I attach a photo
      And I click on "Create Carousel photo"
    Then the carousel photo should be successfully created
      And the carousel photo should be cropped
      And I should be redirected to a page where I can change the cropping of the carosuel photo

  @javascript
  Scenario: Cropping
    Given I have created a carousel photo
      And I'm logged in to the admin page

    When I click on "Carousel Photos"
      And I click on "Edit"
      And I change the crop area
      And I click on "Save"
    Then the cropping of the carousel photo should be successfully updated

  Scenario: Viewing
    Given I have created a carousel photo

    When I visit the home page
    Then I should see the carousel photo
