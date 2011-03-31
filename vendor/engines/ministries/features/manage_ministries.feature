@ministries
Feature: Ministries
  In order to have ministries on my website
  As an administrator
  I want to manage ministries

  Background:
    Given I am a logged in refinery user
    And I have no ministries

  @ministries-list @list
  Scenario: Ministries List
   Given I have ministries titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of ministries
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @ministries-valid @valid
  Scenario: Create Valid Ministry
    When I go to the list of ministries
    And I follow "Add New Ministry"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 ministry

  @ministries-invalid @invalid
  Scenario: Create Invalid Ministry (without title)
    When I go to the list of ministries
    And I follow "Add New Ministry"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 ministries

  @ministries-edit @edit
  Scenario: Edit Existing Ministry
    Given I have ministries titled "A title"
    When I go to the list of ministries
    And I follow "Edit this ministry" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of ministries
    And I should not see "A title"

  @ministries-duplicate @duplicate
  Scenario: Create Duplicate Ministry
    Given I only have ministries titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of ministries
    And I follow "Add New Ministry"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 ministries

  @ministries-delete @delete
  Scenario: Delete Ministry
    Given I only have ministries titled UniqueTitleOne
    When I go to the list of ministries
    And I follow "Remove this ministry forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 ministries
 