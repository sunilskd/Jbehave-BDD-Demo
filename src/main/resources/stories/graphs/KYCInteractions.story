Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 interaction between percent filter and direct/indirect filter on all graphs

Meta:@interactions

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: User applies percent filter and direct relationships only filter on owners graph
a. If user applies "direct relationships only" filter to graph, percent filter resets to 0
b. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|

Then the user should not see any nodes in level 2, above the root entity, in the owners graph

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Then the user should not see any nodes in level 2, above the root entity, in the owners graph

When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below owners in level 2, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

And the user should see the list of below owners in level 3, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

And the user should see the list of below owners in level 4, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|
|Top 20 shareholders,57.67; Others,...|

And the user should see the list of below owners in level 5, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 6141.99|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

And the user should see the list of below owners in level 6, above the root entity, in the owners graphs
|NODES|
|Top shareholdersowning less than 2,...|

Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs

Examples:
|fid|
|LE-6|

Scenario: User applies percent filter and direct relationships only filter on subs graph
a. If user applies "direct relationships only" filter to graph, percent filter resets to 0
b. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
