Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Verify graphs filter tool tips
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see tool tip for zoom, ownership percentage and country highlights

Examples:
|fid|
|211|
