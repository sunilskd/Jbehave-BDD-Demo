Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Verify UBO count scenarios in full graph
a. 1. Count of tiles currently visible that match UBO highlight is displayed
   2. If a filter is applied, only tiles still visible after the filter count
   3. If user changes color of a highlighted tile to appears multiple, it still counts toward the UBO highlight count
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see UBO count as 10 displayed next to UBO checkbox label
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see UBO count as 8 displayed next to UBO checkbox label
When the user enters percentage as 50 in ownership percentage filter text box in the graphs
Then the user should see UBO count as 2 displayed next to UBO checkbox label
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see UBO count as 2 displayed next to UBO checkbox label

Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person C|
|QA Test Person G|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see UBO count as 2 displayed next to UBO checkbox label

Examples:
|fid|legalEntity|
|LE-A|QA Test Person G|