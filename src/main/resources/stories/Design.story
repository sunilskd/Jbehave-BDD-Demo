Meta:@design

Scenario: User selects "Direct Relationships Only", then graph updates to only show direct subsidiaries (level 1 of graph)
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user clicks on direct relationship checkbox on graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|OWNERS|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Examples:
|fid|
|LE-6|

