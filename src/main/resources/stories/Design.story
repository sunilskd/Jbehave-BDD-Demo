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
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
Then the user should see the legal title displayed in the nodes when the user hovers over it in the graphs
|LEGAL TITLE|
|QA Legal Entity 6|
|QA Legal Entity 9|
|QA Legal Entity 10|
|QA Legal Entity 16|
|QA Legal Entity 18|
|QA Legal Entity 11|
|QA Legal Entity 14|
|QA Legal Entity 12|
|QA Legal Entity 17|
|QA Legal Entity 19|
|Others|
|QA Legal Entity 15|
|QA Legal Entity 13|
|QA Legal Entity 61|
|QA Legal Entity 61|
|QA Legal Entity 61|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|
|Local Government, Legal Entity 61 owned by Local Government|
|Local Government, Legal Entity 61 owned by Local Government|
|Free float, Legal Entity 15 owned by Free float|
|QA Test Person 1|
|Local Government, Legal Entity 61 owned by Local Government|

Examples:
|fid|
|LE-6|