@communications
Feature: Communications
  In order to have communications on my website
  As an administrator
  I want to manage communications

  Background:
    Given I am a logged in refinery user
    And I have no communications

  @communications-list @list
  Scenario: Communications List
   Given I have communications titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of communications
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @communications-valid @valid
  Scenario: Create Valid Communication
    When I go to the list of communications
    And I follow "Add New Communication"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 communication

  @communications-invalid @invalid
  Scenario: Create Invalid Communication (without title)
    When I go to the list of communications
    And I follow "Add New Communication"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 communications

  @communications-edit @edit
  Scenario: Edit Existing Communication
    Given I have communications titled "A title"
    When I go to the list of communications
    And I follow "Edit this communication" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of communications
    And I should not see "A title"

  @communications-duplicate @duplicate
  Scenario: Create Duplicate Communication
    Given I only have communications titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of communications
    And I follow "Add New Communication"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 communications

  @communications-delete @delete
  Scenario: Delete Communication
    Given I only have communications titled UniqueTitleOne
    When I go to the list of communications
    And I follow "Remove this communication forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 communications
 