Epic - Ownership

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection
JIRA ID - KYC-311 - Audit Trails date format is incorrect. The format should be DD MMM YYYY but is DD-MMM-YYYY.

Meta:@auditLive @live
Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: KYC user can view audit trail
a. 0. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
   1. If there is one action of type "Supplied", display the date for whichever action is the most recent and display the label "Last updated on" for the action
   2. If there is an action of type "Attempt" or "Denied" that is more recent than the "Supplied" or "Verified" date, display the dates for those actions and display the label "Update attempted on" for the actions
   3. Sort list of actions by date, listing the most recent at the top
   4. If action date has accuracy attribute of day, then display day, month, and year
   5  If there is only a "Supplied" date, display that as the "Last updated on" date
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see audit information with legal title of legal entity user is viewing, sorted by action by date listing the most recent at the top in owners page

Examples:
|fid|
|4521|

Scenario: Verify Audit information
a. 0. If no ownership review data exists for legal entity user is viewing, then display message "No audit information available."
   1. By default audit section is collapsed
   2. User clicks "Hide Audit Information", audit section collapses
b. If there is no action of type "Supplied" or "Verified", do not display any actions or dates even if other action types exist for the legal entity user is viewing and display message "No audit information available."
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
|211|

