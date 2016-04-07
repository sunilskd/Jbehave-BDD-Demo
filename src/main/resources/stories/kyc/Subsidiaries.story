Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
JIRA ID - KYC-45 - KYC user can view direct subsidiaries

Scenario: KYC user can view direct subsidiaries
a. with percentage ownership
b. with percentage null (should not display percent)
c. with country of operations
d. without country of operations (should not display country of operations)
e. with active legal entity subsidiaries
f. with inactive legal entity subsidiaries
g. with active subsidiary relationships
h. with inactive subsidiary relationships

Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page

Examples:


Scenario: Display message in place of subs list if no subsidiaries for entity user is viewing
a. No subsidiaries

Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see message displayed in place of list explaining there are no subsidiaries