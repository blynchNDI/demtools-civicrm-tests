@organization @api
Feature: CRUD for organization contacts
  In order to manage CiviCRM organizations
  as an Administrator,
  I need to be able to create, search for, update and delete them.

  Background:
    Given I am logged in as a "ndi_civi_admin"

  @to-do @create-organization
  Scenario: Create a new organization.
    Given I visit "/civicrm/contact/add?reset=1&ct=Organization"
     Then I should see the text "New Organization"
    Given I enter "NDItech" for "organization_name"
      And I enter "National Democratic Institute Technology Team" for "legal_name"
     When I press "_qf_Contact_upload_view"
     Then I should see the text "NDItech"
      #TODO: figure out why Behat isn't seeing this
      #And I should see the text "National Democratic Institute Technology Team"

  @update-organization
  Scenario: Search for and update an organization
    Given I visit "/civicrm/contact/search?reset=1"
      And I enter "NDItech" for "sort_name"
     When I press "Search"
     Then I should see "NDItech"
    Given I click "NDItech"
      And I click "Edit"
      And I enter "NDItech Innovation" for "organization_name"
     When I press "_qf_Contact_upload_view"
     Then I should see "NDItech Innovation"

  @delete-organization
  Scenario: Search for and delete an organization
    Given I visit "/civicrm/contact/search?reset=1"
      And I enter "NDItech Innovation" for "sort_name"
     When I press "Search"
     Then I should see "NDItech Innovation"
    Given I click "NDItech Innovation"
      And I click "Delete Contact"
     When I press "Delete Contact(s)"
     Then I should see "NDItech Innovation" in the "del" element
     When I click "Delete Permanently"
     Then I should see the text "Are you sure you want to delete the selected contact(s)?"
     When I press "Delete Contact(s)"
     Then I should see "CiviCRM Home"

