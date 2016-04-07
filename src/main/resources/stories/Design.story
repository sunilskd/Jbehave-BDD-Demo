Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user can view direct subsidiaries
a. with percentage ownership; with country of operations; with active legal entity subsidiaries; with active subsidiary relationships
b. with percentage null (should not display percent)
c. without country of operations (should not display country of operations)
d. with inactive legal entity subsidiaries
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page

Examples:
|fid|
|211|