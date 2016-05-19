Epic: Subsidiaries

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.
It is of added value to present it in graph form to the user, since they often prefer to view this information that way and would otherwise have to manually draw it.

Covers below features:
JIRA ID - KYC-69 - KYC user can view subsidiary graph
JIRA ID - KYC-109 - KYC user can highlight legal entities by country in subsidiary graph

Meta:@subsidiariesgraph

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Scenario 1
.Description
----
a. 0. Entity on the graph (could be entity user is viewing or another entity on graph) has at least one active relationship where it is the owner and the owned entity is also active, display owned entity as subsidiary on graph and display percent ownership on subsidiary
   1. Entity on the graph has an inactive relationship where it is the owner, then do not display owned entity on graph
   2. Entity on the graph has an active relationship where it is the owner but the owned entity is inactive, then do not display owned entity on graph
   3. Relationship has null percent ownership, do not display a percent ownership on the subsidiary entity
----
image:Subsidiaries-Graph-Scenario-1.png[Scenario 1]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 35(Australia)|
|QA Legal Entity 3425.9(Australia)|
|QA Legal Entity 33(Australia)|
|QA Legal Entity 550.53(Korea (Republic of))|
|QA Legal Entity 359.53(India)|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 3960.9(Australia)|
|QA Legal Entity 437.9(Korea (Republic of))|
|QA Legal Entity 41(Korea (Republic of))|
|QA Legal Entity 4070.9(Korea (Republic of))|
|QA Legal Entity 42(Korea (Republic of))|
|QA Legal Entity 149.53(UK)|
|QA Legal Entity 250.53(USA)|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 4571.9(Korea (Republic of))|
|QA Legal Entity 150.52(UK)|
|QA Legal Entity 110.23(UK)|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 4671.9(null)|

Examples:
|fid|
|LE-6|

Scenario: Scenario 2
.Description
----
Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
----
image:Subsidiaries-Graph-Scenario-2.png[Scenario 2]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 55, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 5620.23(null)|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 6055.99(null)|
|QA Legal Entity 5730.23(null)|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 5930.99(null)|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 5651.99(null)|
|QA Legal Entity 6056.99(null)|

Examples:
|fid|
|LE-55|

Scenario: Scenario 3
.Description
----
Stop traversing the path at a node which would create a circular relationship
----
image:Subsidiaries-Graph-Scenario-3.png[Scenario 3]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 52, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 53(null)|
|QA Legal Entity 5151.23(null)|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 5251.23(null)|
|QA Legal Entity 54(null)|

Examples:
|fid|
|LE-52|

Scenario: Covers below scenarios
a. Entity user is viewing does not have any active relationships where it is the owner, then display message "No known entities"
b. Entity user is viewing has no relationship where it is the owner and the owned entity is active, then display message "No known entities"
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no subsidiaries

Examples:
|fid|
|LE-58|
|LE-46|

Scenario: Highlight legal entities by country
a. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
b. "No country highlight" is default selection in country highlight drop-down
c. Select a country highlight, legal entities in the subsidiaries graph that have that country of operations are highlighted (including root node of graph if applicable)
d. Select "No country highlight", removes country highlight of legal entities
e. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
f. If no legal entity that appears on graph has country of operations, drop-down still appears with "No country highlight" as default