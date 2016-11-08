Epic - Ownership
----
.Overall Report

image:.owners.Audit.stats.png[Audit]
----

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection
JIRA ID - KYC-311 - Audit Trails date format is incorrect. The format should be DD MMM YYYY but is DD-MMM-YYYY.
JIRA ID - KYC-463 - Display only attempts in audit trail

Meta:@owners @audit
Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: KYC user can view audit trail
a. 0. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
   2. If action date has accuracy attribute of day, then display day, month, and year
   3. If action date has accuracy attribute of month, then display only month and year
   4. If action date has accuracy attribute of year, then display only year
b. Sort all listed actions and their corresponding dates from most recent to least recent
c. If an action does not have a date associated to it, the app will ignore that action and not consider it for display or display logic
d. If there are multiple attempts made on the same day display all attempts made later than the "Supplied" "Verified" or "Denied" date
e. If no actions of type "Supplied," "Verified" or "Denied" exist and "Attempt" actions exist then display all "Attempt" actions in the audit trail.
Meta:@audit @dynamic
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see audit information with legal title of legal entity user is viewing, sorted by action by date listing the most recent at the top in owners page

Examples:
|fid|
|3|
|4|
|7|
|8|
|9|

Scenario: Verify Audit information
a. 0. If no ownership review data exists for legal entity user is viewing, then display message "No audit information available."
   1. By default audit section is collapsed
   2. User clicks "Hide Audit Information", audit section collapses
b. If no actions of type "attempt" exist at all then display message "No audit information available."
c. If "Attempt" actions that exist have date equals to the "Supplied" "Verified" or "Denied" date then do not display any actions in audit trail. Display message "No audit information available."
d. If "Attempt" actions that exist all have a date earlier than the "Supplied" "Verified" or "Denied" date then do not display any actions in audit trail. Display message "No audit information available."
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
|5|
|11|
|6|

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout