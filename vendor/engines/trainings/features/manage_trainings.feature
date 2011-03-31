@trainings
Feature: Trainings
  In order to have trainings on my website
  As an administrator
  I want to manage trainings

  Background:
    Given I am a logged in refinery user
    And I have no trainings

  @trainings-list @list
  Scenario: Trainings List
   Given I have trainings titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of trainings
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @trainings-valid @valid
  Scenario: Create Valid Training
    When I go to the list of trainings
    And I follow "Add New Training"
    And I fill in "Focus" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 training

  @trainings-invalid @invalid
  Scenario: Create Invalid Training (without focus)
    When I go to the list of trainings
    And I follow "Add New Training"
    And I press "Save"
    Then I should see "Focus can't be blank"
    And I should have 0 trainings

  @trainings-edit @edit
  Scenario: Edit Existing Training
    Given I have trainings titled "A focus"
    When I go to the list of trainings
    And I follow "Edit this training" within ".actions"
    Then I fill in "Focus" with "A different focus"
    And I press "Save"
    Then I should see "'A different focus' was successfully updated."
    And I should be on the list of trainings
    And I should not see "A focus"

  @trainings-duplicate @duplicate
  Scenario: Create Duplicate Training
    Given I only have trainings titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of trainings
    And I follow "Add New Training"
    And I fill in "Focus" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 trainings

  @trainings-delete @delete
  Scenario: Delete Training
    Given I only have trainings titled UniqueTitleOne
    When I go to the list of trainings
    And I follow "Remove this training forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 trainings
 