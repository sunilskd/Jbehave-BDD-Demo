Epic - Ownership
----
.Overall Report

image:.uat.Audit.stats.png
----

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection
JIRA ID - KYC-311 - Audit Trails date format is incorrect. The format should be DD MMM YYYY but is DD-MMM-YYYY.

Meta:@auditLive @live
Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: KYC user can view audit trail
a. 0. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
      2. If action date has accuracy attribute of day, then display day, month, and year
      3. If action date has accuracy attribute of month, then display only month and year
      4. If action date has accuracy attribute of year, then display only year
      5. List dates for any action of type "Attempt" that has a date after the most recent "Supplied", Verified", or "Denied" date in the database
b. If no actions of type "Supplied," "Verified" or "Denied" exist and "Attempt" actions exist then display all "Attempt" actions in the audit trail.
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see audit information with legal title of legal entity user is viewing, sorted by action by date listing the most recent at the top in owners page

Examples:
|fid|
|3|
|211|

Scenario: Verify no audit information available
a. 0. If no ownership review data exists for legal entity user is viewing, then display message "No audit information available."
   1. By default audit section is collapsed
   2. User clicks "Hide Audit Information", audit section collapses
   3. If no actions of type "attempt" exist at all then display message "No audit information available."
b. If "Attempt" actions that exist all have a date earlier than the most recent "Supplied" "Verified" or "Denied" date then do not display any actions in audit trail. Display message "No audit information available."
Meta:@audit @dynamic
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see a message thats says no audit information is available
When the user clicks on hide audit information link in owners page
Then the audit section should collapse and Owners list should be moved to top section

Examples:
|fid|
|5|
|6|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page

