@api @dashboard
Feature: CiviCRM homepage dashboard
  In order to conveniently access CiviCRM's primary functionality
  as a CiviCRM Administrator,
  I want to have a dashboard on the frontpage.

  Background:
    Given I am logged in as a "ndi_civi_admin"
      And I am on the homepage

  @front-page
  Scenario: CiviCRM is the front page
     Then the "h1[class='title']" element should contain "CiviCRM Home"

  @dashboard
  Scenario Outline: Dashboard "Contacts" buttons all work.
     When I press the "<BUTTON>" CiviCRM button
     Then I should be on "<PATH>"
    Examples:
      | BUTTON                | PATH                                       |
      | Create New Individual | /civicrm/contact/add?reset=1&ct=Individual |
      | Browse Contacts       | /civicrm/contact/search?reset=1&force=1    |
      | Manage Groups         | /civicrm/group?reset=1                     |
      | View All Reports      | /civicrm/report/list?reset=1               |
      # TODO: Fix these links, as they all appear to hang.
      #| Send Mailing          | /civicrm/mailing/send?reset=1              |
      #| Organize Event        | /civicrm/event/add?reset=1&action=add      |
      #| All Events            | /civicrm/event/manage?reset=1              |
      #| Search Participants   | /civicrm/event/search?reset=1              |
      #| Register Participant  | /civicrm/participant/add?reset=1&action=add&context=standalone |
      | Schedule Reminder     | /civicrm/admin/scheduleReminders?reset=1   |



