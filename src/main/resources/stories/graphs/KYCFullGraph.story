Epic: Full Graph

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not have access to below entity types -
1. Person (UBOs)
2. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-79 - UBO user can view full graph

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC user views full graph
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity as owner on graph above the entity it owns.
   1. Ownership relationship has percent ownership, display percent on owner's node on graph
   2. Ownership relationship has null percent ownership, do not display percent ownership on owner node on graph
   3. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
   4. Free text ownership does not exist for entity user is viewing, do not display free text as owner on full graph
   5. Entity on the graph (could be entity user is viewing or another subsidiary entity on graph) has at least one active relationship where it is the owner and the owned entity is also active, display owned entity as subsidiary on graph and display percent ownership on subsidiary
   6. Entity on the subsidiary portion of graph has an inactive relationship where it is the owner, then do not display owned entity on graph
   7. Subsidiary relationship has percent ownership, display percent ownership on the subsidiary node
   8. Subsidiary relationship has null percent ownership, do not display a percent ownership on the subsidiary node
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the full graph

And the user should see the list of below owners in level 1, above the root entity, in the full graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the full graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below owners in level 2, above the root entity, in the full graph
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the full graph
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below owners in level 3, above the root entity, in the full graph
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the full graph
|NODES|
|QA Legal Entity 4571.9Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below owners in level 4, above the root entity, in the full graph
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|
|Top 20 shareholders,57.67; Others,...|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the full graph
|NODES|
|QA Legal Entity 4671.9|

And the user should see the list of below owners in level 5, above the root entity, in the full graph
|NODES|
|QA Legal Entity 6141.99|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

And the user should see the list of below owners in level 6, above the root entity, in the full graph
|NODES|
|Top shareholdersowning less than 2,...|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
   1. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 23, user is currently viewing, as the root in the full graph

And the user should see the list of below owners in level 1, above the root entity, in the full graph
|NODES|
|QA Legal Entity 2951.53India|

And the user should see the list of below owners in level 2, above the root entity, in the full graph
|NODES|
|QA Legal Entity 322.53India|
|QA Legal Entity 30India|

Examples:
|fid|
|LE-23|

Scenario: Covers below scenarios
a. 0. Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
   1. Entity (including entity user is viewing) appears in the same path in the subsidiary portion of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root in the full graph

And the user should see the list of below owners in level 3, above the root entity, in the full graph
|NODES|
|QA Legal Entity 5630.23|
|Top shareholdersowning less than 2,...|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the full graph
|NODES|
|QA Legal Entity 5651.99|
|QA Legal Entity 6056.99|

Then the user should not see any nodes in level 4, above the root entity, in the full graph

Examples:
|fid|
|LE-56|

Scenario: To verify circular relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root in the full graph

And the user should see the list of below owners in level 1, above the root entity, in the full graph
|NODES|
|QA Legal Entity 5251.23|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the full graph
|NODES|
|QA Legal Entity 54|
|QA Legal Entity 5251.23|

And the user should see the list of below owners in level 2, above the root entity, in the full graph
|NODES|
|QA Legal Entity 5151.23|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the full graph
|NODES|
|QA Legal Entity 53|
|QA Legal Entity 5151.23|

Examples:
|fid|
|LE-51|

Scenario: Entity user is viewing does not have owners or subsidiaries, display message "No known entities."
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no entities

Examples:
|fid|
|LE-58|

Scenario: Entity user is viewing has owners but not subsidiaries, show the owners on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should not see any nodes in level 1, below the root entity, in the full graph

And the user should see the list of below owners in level 2, above the root entity, in the full graph
|NODES|
|QA Legal Entity 250.52UK|
|QA Legal Entity 549.53Korea (Republic of)|
|QA Legal Entity 4010.23Korea (Republic of)|
|QA Legal Entity 7UK|

Examples:
|fid|
|LE-1|

Scenario: Entity user is viewing has subsidiaries but not owners, show the subsidiaries on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should not see any nodes in level 1, above the root entity, in the full graph

And the user should see the list of below subsidiaries in level 2, below the root entity, in the full graph
|NODES|
|QA Legal Entity 1451.53UK|

Examples:
|fid|
|LE-15|

Scenario: Entity on the subsidiary portion of graph has an active relationship where it is the owner but the owned entity is inactive, then do not display owned entity on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no entities

Examples:
|fid|
|LE-62|
