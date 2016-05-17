Epic - Ownership

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection

Scenario: KYC user can view audit trail
a. By default audit section is collapsed
b. User clicks "Display Audit Information", audit section expands with legal title of legal entity user is viewing in the header of the table, button user clicked is renamed to "Hide Audit Information"
c. If no ownership review data exists for legal entity user is viewing, then display message "No audit information available."
d. If there is one action of type "Supplied" or "Verified", display the date for whichever action is the most recent and display the label "Last updated on" for the action
e. If there is an action of type "Attempt" or "Denied" that is more recent than the "Supplied" or "Verified" date, display the dates for those actions and display the label "Update attempted on" for the actions
f. If there is an action of type "Supplied" or "Verified" but no actions of "Attempt" or "Denied" that are more recent, display only the date for the more recent "Supplied" or "Verified"
g. If there is no action of type "Supplied" or "Verified", do not display any actions or dates even if other action types exist for the legal entity user is viewing and display message "No audit information available."
h. Sort list of actions by date, listing the most recent at the top'
i. User clicks "Hide Audit Information", audit section collapses
j. If action date has accuracy attribute of day, then display day, month, and year
k. If action date has accuracy attribute of month, then display only month and year
l. If action date has accuracy attribute of year, then display only year
m. If there are multiple "Supplied" dates, choose the most recent
n. If there are multiple "Verified" dates, choose the most recent
o. If there is a "Supplied" date and a "Verified" date, choose whichever is more recent
p. If there is only a "Supplied" date, display that as the "Last updated on" date
q. If there is only a "Verified" date, display that as the "Last updated on" date

