Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC user login
Scenario: KYC-455 Covers below scenarios for truncated owners graph for a KYC user.
a. 0. Verify graph truncation notification message when number of nodes are greater than 2500
   1. Percent ownership filter options not affected by truncation.
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
When the user clicks on graph help link in graph page
Then the user should see a model window with static help content for graph
When the user clicks close button in graph help model window
Then the model window should be closed and user should see active graph page where the user was initially

Examples:
|fid|
|LE-6|
