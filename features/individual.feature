@api @individual @wip
# There are a number of issues with these tests that require debugging.
# Note that the equivalent tests for organizations *do* work.
Feature: CRUD for individual contacts
  In order to manage CiviCRM individuals
  as an Administrator,
  I need to be able to create, search for, update and delete them.

  Background:
    Given I am logged in as a "ndi_civi_admin"

  @create-individual
  Scenario: Create a new individual.
    #When I click "New Individual"
    Given I visit "/civicrm/contact/add?reset=1&ct=Individual"
     Then I should see the text "New Individual"
    Given I enter "Ben" for "first_name"
      And I enter "Lynch for "last_name"
      And I enter "blynch@ndi.org" for "email_1_email"
     When I press "_qf_Contact_upload_view"
     Then I should see the text "Ben Lynch"
      And I should see the text "blynch@ndi.org"

  @update-individual
  Scenario: Search for and update an individual
    Given I visit "/civicrm/contact/search/advanced?reset=1"
      And I enter "Ben" for "sort_name"
     When I press "_qf_Advanced_refresh-botton"
     Then I should see the text "Lynch, Ben"
    Given I click "Lynch, Ben"
     Then I should see the text "Ben Lynch"
      And I should see the text "blynch@ndi.org"
    Given I click "Edit"
      And I enter "Benjamin" for "first_name"
      And I fill in "first_name" with "Benjamin"
     When I press "_qf_Contact_upload_view"
     Then I should see the text "Benjamin Lynch"

  @delete-individual
  Scenario: Search for and delete an organization
    Given I visit "/civicrm/contact/search/advanced?reset=1"
      And I enter "Benjamin" for "sort_name"
      And I press "_qf_Advanced_refresh-botton"
      And I click "Lynch, Benjamin"
     When I click "Delete Contact"
      And I press "Delete Contact(s)"
     Then I should see "Benjamin Lynch" in the "del" element
     When I click "Delete Permanently"
     Then I should see the text "Are you sure you want to delete the selected contact(s)?"
     When I press "Delete Contact(s)"
     Then I should see "CiviCRM Home"

