Epic - Ownership

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection

Scenario: KYC user can view audit trail
a. By default audit section is collapsed
b. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
c. If there is an action of type "Supplied" or "Verified", display the date for whichever action is the most recent and display the label "Last updated on" for the action
d. If there is an action of type "Attempt" or "Denied" that is more recent than the "Supplied" or "Verified" date, display the dates for those actions and display the label "Update attempted on" for the actions
e. If there is an action of type "Supplied" or "Verified" but no actions of "Attempt" or "Denied" that are more recent, display only the date for the more recent "Supplied" or "Verified"
f. If there is no action of type "Supplied" or "Verified", do not display any actions or dates even if other action types exist for the legal entity user is viewing and display message "No audit information available."
g. Sort list of actions by date, listing the most recent at the top
h. User clicks "Hide Audit Information", audit section collapses

Meta:@owners @audit

Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Verify Audit information

a. 0. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
   1. If there is an action of type "Supplied" or "Verified", display the date for whichever action is the most recent and display the label "Last updated on" for the action
   2. If there is an action of type "Attempt" or "Denied" that is more recent than the "Supplied" or "Verified" date, display the dates for those actions and display the label "Update attempted on" for the actions
   3. Sort list of actions by date, listing the most recent at the top

b. If there is an action of type "Supplied" or "Verified" but no actions of "Attempt" or "Denied" that are more recent, display only the date for the more recent "Supplied" or "Verified"
Meta:@audit @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see audit information with legal title of legal entity user is viewing, sorted by action by date listing the most recent at the top in owners page

Examples:
|fid|
|3|
|6|

Scenario: Verify Audit information
a. If no ownership review data exists for legal entity user is viewing, then display message "No audit information available."
b. If there is no action of type "Supplied" or "Verified", do not display any actions or dates even if other action types exist for the legal entity user is viewing and display message "No audit information available."
Meta:@audit @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see a message thats says no audit information is available

Examples:
|fid|
|211|
|5|


Scenario: to be automated
By default audit section is collapsed
User clicks "Hide Audit Information", audit section collapses
Meta:@audit @dynamic
Given the user is on the ubo login page
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