Feature: User profile should say not available when user marks status as unavailable
  In order to provide accurate information about user hosting availability
  As a site user
  I need to let people know if I am unavilable for hosting

@api
Scenario: User sets their status to currently not available
Given I am logged in as a user with the "authenticated user" role
  And I click "View Profile"
    Then I should see "About this Member"
    Then I should see "Hosting information"
  And I click "Edit"
    Given I check the box "edit-notcurrentlyavailable"
    And I select "United States" from "edit-country"
    And I fill in "edit-city" with "Durham"
    And I select "NOT LISTED" from "edit-province"
    And I fill in "edit-postal-code" with "NONE"
    And I fill in "edit-fullname" with "Test User"
    And I fill in "edit-comments" with "Please do not type in nonsense because we will read it and you may have your registration delayed"
    And I press "Save"
    Then I should see the text "This member has marked themselves as not currently available for hosting"

@api
Scenario: User sets their status to available
Given I am logged in as a user with the "authenticated user" role
  And I click "View Profile"
    Then I should see "About this Member"
  And I click "Edit"
    Given I uncheck the box "edit-notcurrentlyavailable"
    And I fill in "edit-preferred-notice" with "2 weeks"
    And I select "United States" from "edit-country"
    And I fill in "edit-city" with "Durham"
    And I select "NOT LISTED" from "edit-province"
    And I fill in "edit-postal-code" with "NONE"
    And I fill in "edit-fullname" with "Test User"
    And I fill in "edit-comments" with "Please do not type in nonsense because we will read it and you may have your registration delayed"
    And I press "Save"
    Then I should see the text "Hosting information"
      And I should see the text "Preferred Notice"
      And I should see the text "2 weeks"
