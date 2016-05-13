Epic - Ownership

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection

Scenario: KYC user can view audit trail
a. By default audit section is collapsed
b. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
b. If no ownership review data exists for legal entity user is viewing, then display message "No audit information available."
c. If there is an action of type "Supplied" or "Verified", display the date for whichever action is the most recent and display the label "Last updated on" for the action
d. If there is an action of type "Attempt" or "Denied" that is more recent than the "Supplied" or "Verified" date, display the dates for those actions and display the label "Update attempted on" for the actions
e. If there is an action of type "Supplied" or "Verified" but no actions of "Attempt" or "Denied" that are more recent, display only the date for the more recent "Supplied" or "Verified"
f. If there is no action of type "Supplied" or "Verified", do not display any actions or dates even if other action types exist for the legal entity user is viewing and display message "No audit information available."
g. Sort list of actions by date, listing the most recent at the top
h. User clicks "Hide Audit Information", audit section collapses
