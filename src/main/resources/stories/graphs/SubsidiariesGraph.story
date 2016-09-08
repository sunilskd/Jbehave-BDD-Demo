Epic: Subsidiaries
----
.Overall Report

image:.graphs.SubsidiariesGraph.stats.png
----

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.
It is of added value to present it in graph form to the user, since they often prefer to view this information that way and would otherwise have to manually draw it.

Covers below features:
JIRA ID - KYC-69 - KYC user can view subsidiary graph
JIRA ID - KYC-137 - Sub Graph - Direct-Indirect filter
JIRA ID - KYC-109 - KYC user can highlight legal entities by country in subsidiary graph
JIRA ID - KYC-104 - KYC user can filter subsidiary graph by percent ownership
JIRA ID - KYC-318 - Country highlights is not working for the root node.
JIRA ID - KYC-229 - UBO user can highlight UBOs on graph
JIRA ID - KYC-392 - Percent filter input box is not resetting to 100 when user enters more than 100 in input box in graph page.
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph
JIRA ID - KYC-456 - New truncation logic for subs graph

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
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs

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
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 55, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs
And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs

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
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 52, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs

Examples:
|fid|
|LE-52|

Scenario: Covers below scenarios
a. Entity user is viewing does not have any active relationships where it is the owner, then display message "No known entities"
b. Entity user is viewing has no relationship where it is the owner and the owned entity is active, then display message "No known entities"
c. If no legal entity that appears on graph has country of operations, drop-down still appears with "No country highlight" as default
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see message displayed in place of graph explaining there are no entities in the graphs
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs

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
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (4)|
|India (1)|
|Korea (Republic of) (6)|
|UK (5)|

When the user selects a country Korea (Republic of) from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 5|
|QA Legal Entity 43|
|QA Legal Entity 42|
|QA Legal Entity 41|
|QA Legal Entity 40|
|QA Legal Entity 45|

When the user selects another country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 2|
|QA Legal Entity 6|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 1|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs

Examples:
|fid|
|LE-6|

Scenario: KYC-137 - Sub Graph - Direct-Indirect filter covers below scenarios
a. By Default checkbox for Direct relationship is not selected
b. If no subsidiaries are present, filter is still available
c. If there are no subsidiaries beyond level 1 direct relationships, filter is still available
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the direct relationship only filter checkbox unchecked by default in the graphs

Examples:
|fid|
|LE-6|
|LE-1|
|LE-2|

Scenario: Covers below scenarios
 a. 0. User selects "Direct Relationships Only", then graph updates to only show direct subsidiaries (level 1 of graph)
    1. User un-checks "Direct Relationships Only" box, then graph updates to show all subsidiaries in any level
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs

Examples:
|fid|
|LE-6|

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

Scenario: Covers below scenarios
a. By default, percent filter is set to 0 for both input box and slider, all subsidiaries are displayed in the graph
b. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
c. If user enters 0 in input box, slider position automatically updates to match percent entered, all subsidiaries appear on the graph
d. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only subsidiaries that are owned by 100 percent appear on graph
e. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all subsidiaries are displayed in the graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
When the user enters percentage as 0 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs
When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, below the root entity, in the graphs
When the user enters percentage as 200 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, below the root entity, in the graphs
And the user should see, percent filter is reset to 100 for both input box and slider, in the graphs
When the user enters percentage as abc in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. If user moves slider to percent 1-100, null percent subsidiaries are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
b. If user moves slider to 0 percent, all subsidiaries appear on graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph

Then the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
Then the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
Then the user should see the list of subsidiaries in level 3, below the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: User applies percent filter that results in no subsidiaries on the graph, only root node is left on the graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
When the user enters percentage as 51 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 3, user is currently viewing, as the root and highlighted on the graphs

Examples:
|fid|
|LE-3|

Scenario: To verify circular relationship
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs

Examples:
|fid|
|LE-51|

Scenario: Verify UBO filter is not available for subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should not see the ultimate beneficial owners filter checkbox in the subsidiaries graph

Examples:
|fid|
|LE-6|

Scenario: Verify percent filter is applied at all level
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 50 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: Verify parent child relationship
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
Then the user should see the subsidiaries for the legal entity QA Legal Entity 6 in the graphs
Then the user should see the subsidiaries for the legal entity QA Legal Entity 3 in the graphs

Examples:
|fid|
|LE-6|

Scenario: User clicks on show more link and user is navigated to the respective graph page of that entity
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user resize graph to translate(1096.0998681640626,-181.31536080169678) scale(0.9910000000000001)
And the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|nodeTitle|
|9461|The Miyazaki Bank Ltd|

Scenario: KYC-396 Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Cayman Islands (3)|
|France (1)|
|Hong Kong (2)|
|Ireland (1)|
|Japan (103)|
|Luxembourg (1)|
|Panama (1)|
|Singapore (1)|
|UK (1)|

When the user resize graph to translate(1096.0998681640626,-181.31536080169678) scale(0.9910000000000001)
When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Japan (49)|

Examples:
|fid|nodeTitle|
|9461|The Miyazaki Bank Ltd|

Scenario: Verify graph truncation notification message
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
And the user should see the notification message that the graphs are truncated

Examples:
|fid|
|444|

Scenario: KYC-396 Verify if legal entity in focus returns greater than 1500 triples for subsidiaries but does not have any ownership relationship less than 5 percent, no paths are truncated
[Data Missing]

Scenario: KYC-456 Covers below scenarios for truncated subs graph.
a. Verify if the legal entity in focus has triple count greater than 125 and node count is greater than 2500, Notification message "This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the “show more” link on tiles to view hidden segments in a new graph." is displayed.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
And the user should see the legal entity JPMorgan Chase & Co, user is currently viewing, as the root and highlighted on the graphs
And the user should see the truncation notification message that the graphs are truncated as there are more 2500 nodes on subs page

Examples:
|fid|
|7127|

Scenario: KYC-456 Covers below scenarios for truncated subs graph.
a. 0. Country highlight drop-down only displays country of operations of LEs displayed after truncation.
   1. Verify show more link displayed for the nodes which have percetage less than 5 %.
   2. Click “show more” link on tiles to view hidden segments in a new graph.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
And the user should see the legal entity Banco de Chile, user is currently viewing, as the root and highlighted on the graphs
And the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Chile (46)|
|Colombia (13)|
|Panama (2)|
|USA (1)|
When the user resize graph to translate(1038.544473153289,155.8951005596037) scale(0.39321335741032265)
And the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>
Examples:
|fid|nodeTitle|
|544|Quiñenco SA|

Scenario: KYC-456 Not implemented as Data Missing.
1. If legal entity in focus returns greater than 2500 nodes and triple count is less than 125, Notification message "This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the “show more” link on tiles to view hidden segments in a new graph." is displayed.
2. In the displayed graph same node appears multiple time and the first occurance of that node on the left has percentage less than 5%, So sub nodes for that multiple appearing nodes are displayed for the next occurance where percentage is greater than 5%.

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout