Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Scenario: KYC-455 Covers below scenarios for truncated owners graph for a KYC user.
a. 0. Verify graph truncation notification message when number of nodes are greater than 2500
   1. Percent ownership filter options not affected by truncation.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the notification message that the graphs are truncated when there are more than 2500 nodes
When the user enters percentage as 7 in ownership percentage filter text box in the graphs
And the user resize graph to translate(208.5,1229.8999939537052) scale(0.397)
Then the user should see the list of owners in level 11, above the root entity, in the graphs

Examples:
|fid|
|250786|