Epic: Subsidiaries

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.
It is of added value to present it in graph form to the user, since they often prefer to view this information that way and would otherwise have to manually draw it.

Covers below features:
JIRA ID - KYC-69 - KYC user can view subsidiary graph
JIRA ID - KYC-137 - Sub Graph - Direct-Indirect filter
JIRA ID - KYC-109 - KYC user can highlight legal entities by country in subsidiary graph
JIRA ID - KYC-104 - KYC user can filter subsidiary graph by percent ownership
JIRA ID - KYC-318 - Country highlights is not working for the root node.
JIRA ID - KYC-229 - UBO user can highlight UBOs on graph

Meta:@subsidiariesgraph @kyc @ubo

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
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4571.9Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4671.9|

Examples:
|fid|
|LE-6|

Scenario: Scenario 2
.Description
----
a. 1. Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
   2. Subsidiary graph should not display the free text
----
image:Subsidiaries-Graph-Scenario-2.png[Scenario 2]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 55, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 5620.23|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 6055.99|
|QA Legal Entity 5730.23|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 5930.99|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 5651.99|
|QA Legal Entity 6056.99|

And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graph

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
Then the user should see the legal entity QA Legal Entity 52, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 53|
|QA Legal Entity 5151.23|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 5251.23|
|QA Legal Entity 54|

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
a. 0. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   1. "No country highlight" is default selection in country highlight drop-down
   2. Select a country highlight, legal entities in the subsidiaries graph that have that country of operations are highlighted (including root node of graph if applicable)
   3. Select "No country highlight", removes country highlight of legal entities
   4. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
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

When the user selects a country Korea (Republic of) from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|NODES|
|QA Legal Entity 5|
|QA Legal Entity 43|
|QA Legal Entity 42|
|QA Legal Entity 41|
|QA Legal Entity 40|
|QA Legal Entity 45|

When the user selects another country UK from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|NODES|
|QA Legal Entity 2|
|QA Legal Entity 6|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 1|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the subsidiaries graph page
Then the user should not see the nodes highlighted in the graph page

Examples:
|fid|
|LE-6|

Scenario: KYC-137 - Sub Graph - Direct-Indirect filter covers below scenarios
a. By Default checkbox for Direct relationship is not selected
b. If no subsidiaries are present, filter is still available
c. If there are no subsidiaries beyond level 1 direct relationships, filter is still available
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the direct relationship only filter checkbox unchecked by default in the graph

Examples:
|fid|
|LE-6|
|LE-1|
|LE-2|

Scenario: Covers below scenarios
 a. 0. User selects "Direct Relationships Only", then graph updates to only show direct subsidiaries (level 1 of graph)
    1. User un-checks "Direct Relationships Only" box, then graph updates to show all subsidiaries in any level
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

When the user unchecks direct relationship only filter checkbox in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4571.9Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4671.9|

Examples:
|fid|
|LE-6|

Scenario: Verify tool tip displays legal title in graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button

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

Scenario: Covers below scenarios
a. By default, percent filter is set to 0 for both input box and slider, all subsidiaries are displayed in the graph
b. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
c. If user enters 0 in input box, slider position automatically updates to match percent entered, all subsidiaries appear on the graph
d. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only subsidiaries that are owned by 100 percent appear on graph
e. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all subsidiaries are displayed in the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 25 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 150.52UK|

When the user enters percentage as 0 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4571.9Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4671.9|

When the user enters percentage as 100 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph
And the user should not see any nodes in level 2, below the root entity, in the subsidiaries graph

When the user enters percentage as 200 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph
And the user should not see any nodes in level 2, below the root entity, in the subsidiaries graph

When the user enters percentage as abc in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph
And the user should see the list of below subsidiaries in level 4, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 4671.9|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. If user moves slider to percent 1-100, null percent subsidiaries are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
b. If user moves slider to 0 percent, all subsidiaries appear on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph

Then the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

Then the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 250.53UK|

Then the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 150.52UK|

Examples:
|fid|
|LE-6|

Scenario: User applies percent filter that results in no subsidiaries on the graph, only root node is left on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 51 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 3, user is currently viewing, as the root and highlighted in the subsidiaries graph

Examples:
|fid|
|LE-3|

Scenario: To verify circular relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 54|
|QA Legal Entity 5251.23|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 53|
|QA Legal Entity 5151.23|

Examples:
|fid|
|LE-51|

Scenario: Verify UBO filter is not available for subsidiaries
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should not see the ultimate beneficial owners filter checkbox in the subsidiaries graph

Examples:
|fid|
|LE-6|

Scenario: Verify percent filter is applied at all level
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 50 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 150.52UK|

Examples:
|fid|
|LE-6|

Scenario: Verify parent child relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the subsidiaries graph

Then the user should see the below subsidiaries for the legal entity QA Legal Entity 6 in the subsidiaries graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

Then the user should see the below subsidiaries for the legal entity QA Legal Entity 35 in the subsidiaries graph
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|

Examples:
|fid|
|LE-6|