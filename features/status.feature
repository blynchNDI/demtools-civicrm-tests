Feature: CiviCRM system status all green
  In order to have confidence in the a CiviCRM site's stability
  as an Administrator,
  I want to be able to ensure the system status is healthy.

  @api
  Scenario: Check the system status page
    Given I am logged in as a "ndi_civi_admin"
     When I visit "/civicrm/a/#/status"
     Then I should see the text "CiviCRM System Status"
     Then I should not see the text "Cron Not Running"
     Then I should not see the text "Configure Default Mailbox"
     Then I should not see the text "Complete Setup"
