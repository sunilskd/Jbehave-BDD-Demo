Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Verify tool tip displays legal title in graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the full graph

Then the user should see the below owners for the legal entity QA Legal Entity 6 in the owners graph
|NODES|

Examples:
|fid|
|LE-6|