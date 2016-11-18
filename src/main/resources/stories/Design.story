Meta:@design

Scenario: Login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Verify tool tip displays legal title in graphs
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal title displayed in the nodes when the user hovers over it in the graphs
|LEGAL TITLE|
|QA Legal Entity 6|
|QA Legal Entity 35|
|QA Legal Entity 34|
|QA Legal Entity 33|
|QA Legal Entity 5|
|QA Legal Entity 3|
|QA Legal Entity 39|
|QA Legal Entity 43|
|QA Legal Entity 41|
|QA Legal Entity 40|
|QA Legal Entity 42|
|QA Legal Entity 1|
|QA Legal Entity 2|
|QA Legal Entity 45|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 46|

Examples:
|fid|
|LE-6|