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

Scenario: Verify graph truncation notification message
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5 and the pdf will be downloaded as a list

Examples:
|fid|
|73125|

Scenario: Verify graph truncation notification message
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and more than 2500 nodes and the pdf will be downloaded as a list

Examples:
|fid|
|7127|

Scenario: Not implemented, Data missing
1. If legal entity in focus returns greater than 2500 nodes on both owners and subs side of full graph.
2. If legal entity in focus returns greater than 125 triples on both owners and subs side of full graph.


Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout