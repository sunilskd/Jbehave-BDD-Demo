Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Verify graph truncation notification message
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5

Examples:
|fid|
|444|