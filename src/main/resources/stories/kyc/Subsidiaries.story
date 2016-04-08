Meta:@subsidiaries @kyc

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
JIRA ID - KYC-45 - KYC user can view direct subsidiaries

Scenario: KYC user can view direct subsidiaries
a. with percentage ownership; with country of operations; with active legal entity subsidiaries; with active subsidiary relationships
b. with percentage null (should not display percent)
c. without country of operations (should not display country of operations)
d. with inactive legal entity subsidiaries
e. With inactive subsidiary relationships
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page

Examples:
|fid|
|211|
|815|
|146115|
|200|
|1717|

Scenario: KYC user can view direct subsidiaries
Meta:@static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Public Finance Ltd|Hong Kong|100|
|Public Financial Securities Ltd|Hong Kong|100|

Examples:
|fid|
|200|

Scenario: Display message in place of subs list if no subsidiaries for entity user is viewing
a. No subsidiaries
Meta:@static @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see message displayed in place of list explaining there are no subsidiaries

Examples:
|fid|
|269306|