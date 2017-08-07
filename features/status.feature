@api @system-status
Feature: CiviCRM system status all green
  In order to have confidence in the a CiviCRM site's stability
  as an Administrator,
  I want to be able to ensure the system status is healthy.

  Scenario: Regular users shouldn't see system status messages
    Given I am logged in as a "authenticated user"
      And I am on the homepage
     Then I should not see the text "Cron Not Running"
     Then I should not see the text "Configure Default Mailbox"
     Then I should not see the text "Complete Setup"
     When I visit "/user"
     Then I should see the text "Member for"
      And I should see the text "Log out"
 
  @to-do
  Scenario: Admin users can check the CiviCRM system status page
    Given I am logged in as a "ndi_civi_admin"
     When I visit "/civicrm/a/#/status"
     Then I should see the text "CiviCRM System Status"
      # TODO: Fix these warnings out-of-the-box, if possible.
      #And I should not see the text "Cron Not Running"
      #And I should not see the text "Configure Default Mailbox"
      #And I should not see the text "Complete Setup"
      # TODO: Check "good" status items.

  @to-do
  Scenario: Admin users can check the Drupal status report
    Given I am logged in as a "ndi_civi_admin"
     # TODO: this role doesn't currently allow access to the Drupal status report.
     # And I am at "/admin/reports"
     #When I follow "Status Report"
     #Then the url should match "/admin/reports/status"
     #Then I should see the text "Up to date"


