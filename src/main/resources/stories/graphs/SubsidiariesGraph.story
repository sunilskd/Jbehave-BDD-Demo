Epic: Subsidiaries

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.
It is of added value to present it in graph form to the user, since they often prefer to view this information that way and would otherwise have to manually draw it.

Covers below features:
JIRA ID - KYC-69 - KYC user can view subsidiary graph
JIRA ID - KYC-104 - KYC user can filter subsidiary graph by percent ownership
JIRA ID - KYC-109 - KYC user can highlight legal entities by country in subsidiary graph
JIRA ID - KYC-324 - Country list in owners graph and subs graph is not displaying root node's country.

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
c. If no legal entity that appears on graph has country of operations, drop-down still appears with "No country highlight" as default
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no subsidiaries
Then the user should see no country highlight selected by default in country highlight drop-down in the subsidiaries graph page

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
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button

Then the user should see no country highlight selected by default in country highlight drop-down in the subsidiaries graph page
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries graphs page
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|
|USA|

When the user selects a country Korea (Republic of) from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|
|QA Legal Entity 5|
|QA Legal Entity 43|
|QA Legal Entity 41|
|QA Legal Entity 40|
|QA Legal Entity 42|
|QA Legal Entity 45|

When the user selects another country India from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|
|QA Legal Entity 3|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the subsidiaries graph page
Then the user should not see the nodes highlighted in the subsidiaries graph page

Examples:
|fid|
|LE-16|

Scenario: KYC-104 - KYC user can filter subsidiary graph by percent ownership
b. If user moves slider to percent 1-100, null percent subsidiaries are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
c. If user moves slider to 0 percent, all subsidiaries appear on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the subsidiaries graph page
Then subsidiaries with percent filter matching should be displayed

Examples:
|fid|
|LE-6|

Scenario: KYC-104 - KYC user can filter subsidiary graph by percent ownership
a. By default, percent filter is set to 0 for both input box and slider, all subsidiaries are displayed in the graph
d. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
e. If user enters 0 in input box, slider position automatically updates to match percent entered, all subsidiaries appear on the graph
f. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only subsidiaries that are owned by 100 percent appear on graph
g. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all subsidiaries are displayed in the graph
h. User applies percent filter that results in no subsidiaries on the graph,display entity user is viewing as root node
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the pecentage filter is set to 0 by default in the subsidiaries graph page
When the user enters percentage as 25 in ownership percentage text box in the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 3425.9(Australia)|
|QA Legal Entity 550.53(Korea (Republic of))|
|QA Legal Entity 359.53(India)|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 149.53(UK)|
|QA Legal Entity 250.53(USA)|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 150.52(UK)|

When the user enters percentage as 0 in ownership percentage text box in the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 3425.9(Australia)|
|QA Legal Entity 550.53(Korea (Republic of))|
|QA Legal Entity 359.53(India)|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 149.53(UK)|
|QA Legal Entity 250.53(USA)|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 150.52(UK)|

When the user enters percentage as 100 in ownership percentage text box in the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

When the user enters percentage as 200 in ownership percentage text box in the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

When the user enters percentage as abc in ownership percentage text box in the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|SUBSIDIARIES|
|QA Legal Entity 3425.9(Australia)|
|QA Legal Entity 550.53(Korea (Republic of))|
|QA Legal Entity 359.53(India)|

Examples:
|fid|
|LE-6|