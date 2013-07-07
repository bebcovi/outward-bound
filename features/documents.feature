Feature: Documents

  As an admin
  I want to be able to manage documents

  Scenario: Creating
    Given I'm logged in to the admin page

    When I click on "Documents"
      And I click on "New Document"
      And I fill in "Name" with "Some name"
      And I attach 1 file
      And I click "Create document"
    Then the document should be successfully created

  Scenario: Editing
    Given I'm logged in to the admin page
      And I have created a document

    When I click on "Documents"
      And I click on "Edit"
      And I attach 1 file
      And I click "Create document"
    Then the document should be successfully updated
