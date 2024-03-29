Epic: Full Graph
----
.Overall Report

image:.graphs.UBOFullGraph.stats.png[UBO Full Graph]
----

UBO user has access to below entity types -
1. Legal Entities
2. People
3. Other entity types (non-person, non-entity)

UBO user does not have access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-95 - UBO user can view full graph with UBOs
JIRA ID - KYC-229 - UBO user can highlight UBOs on graph
JIRA ID - KYC-157 - UBO user can view full graph with non-person/non-entity owners
JIRA ID - KYC-103 - KYC user can filter full graph by percent ownership
JIRA ID - KYC-110 - KYC user can highlight legal entities by country in full graph
JITA ID - KYC-136 - Full Graph - Direct / Indirect Filter
JIRA ID - KYC-156 - User will see in product message on full graph if they do not have access to UBO data
JIRA ID - KYC-392 - Percent filter input box is not resetting to 100 when user enters more than 100 in input box in graph page.
JIRA-ID - KYC-397 - Truncate large full graph
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph
JIRA ID - KYC-480 - Percent filter should not filter out null percent relationships
JIRA ID - KYC-586 - Root node is displayed even when its "No know Entity" fid on a full graph.
JIRA ID - KYC-559 - Change name of full graph to "Complete Ownership + Subsidiary Graph"
JIRA ID - KYC-600 - User can view "graph help" page
JIRA ID - KYC-517 - New text for truncation notifications and "show more" links

Meta:@ubofullgraph @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: UBO user views full graph
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity as owner on graph above the entity it owns.
   1. Ownership relationship has percent ownership, display percent on owner's node on graph
   2. Ownership relationship has null percent ownership, do not display percent ownership on owner node on graph
   3. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
   4. Free text ownership does not exist for entity user is viewing, do not display free text as owner on full graph
   5. Entity on the graph (could be entity user is viewing or another subsidiary entity on graph) has at least one active relationship where it is the owner and the owned entity is also active, display owned entity as subsidiary on graph and display percent ownership on subsidiary
   6. Entity on the subsidiary portion of graph has an inactive relationship where it is the owner, then do not display owned entity on graph
   7. Subsidiary relationship has percent ownership, display percent ownership on the subsidiary node
   8. Subsidiary relationship has null percent ownership, do not display a percent ownership on the subsidiary node
   9. Entity on full graph has non-institution, non-person entity type owner and the relationship is active, display that owner on the graph
   10. non-institution, non-person entity type owner has percent ownership, display on the owner's node
   11. non-institution, non-person entity type owner has null percent ownership, do not display percent ownership on owner's node
   12. non-institution, non-person entity type owner has value for owner type and description, display owner type and description
   13. If non-institution, non-person entity type owner has a value for owner type but no value for description, only display owner type in node
   14. UBO user will not see in product message on full graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
When the user resize graph to translate(921.3865131745112,568.70196664657) scale(0.33400000000000013)
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs
And the user should not see any nodes in level 5, below the root entity, in the graphs
And the user should see the list of owners in level 6, above the root entity, in the graphs
And the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
   1. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
   2. If entity on full graph has non-institution, non-person entity type owner but the relationship is inactive, do not display that owner on the graph
   3. UBO user will not see in product message on full graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see the legal entity QA Legal Entity 23, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs

And the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-23|

Scenario: Covers below scenarios
a. 0. Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
   1. Entity (including entity user is viewing) appears in the same path in the subsidiary portion of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
Then the user should not see any nodes in level 4, above the root entity, in the graphs

Examples:
|fid|
|LE-56|

Scenario: To verify circular relationship
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user resize graph to translate(947.9222564487161,280.52821774515945) scale(0.4870000000000001)
Then the user should see the full graph
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs

Examples:
|fid|
|LE-51|

Scenario: Entity user is viewing does not have owners or subsidiaries, display message "No known entities." and no nodes are displayed.
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see message displayed in place of graph explaining there are no entities in the graphs

Examples:
|fid|
|LE-58|
|13129|

Scenario: Entity user is viewing has owners but not subsidiaries, show the owners on the graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should not see any nodes in level 1, below the root entity, in the graphs

Examples:
|fid|
|LE-1|

Scenario: Entity user is viewing has subsidiaries but not owners, show the subsidiaries on the graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should not see any nodes in level 1, above the root entity, in the graphs

Examples:
|fid|
|LE-32|

Scenario: Entity on the subsidiary portion of graph has an active relationship where it is the owner but the owned entity is inactive, then do not display owned entity on graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see message displayed in place of graph explaining there are no entities in the graphs

Examples:
|fid|
|LE-62|

Scenario: Covers below scenarios
a. 0. "No country highlight" is default selection in country highlight drop-down
   1. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   2. Select a country highlight, legal entities in the full graph that have that country of operations are highlighted (including root node of graph if applicable)
   3. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   4. Select "No country highlight", removes country highlight of legal entities
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (4)|
|India (1)|
|Korea (Republic of) (6)|
|UK (11)|
|USA (5)|

When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 2|
|QA Legal Entity 6|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 6|
|QA Legal Entity 10|
|QA Legal Entity 9|
|QA Legal Entity 11|
|QA Legal Entity 12|
|QA Legal Entity 14|
|QA Legal Entity 13|
When the user selects another country India from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 3|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
   1. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graph
   2. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graph
   3. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only owners that are owned by 100 percent appear on graph
   4. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all owners are displayed in the graph
   5. Null percent relationships remain on the graph and are never filtered out by the percent filter
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
When the user resize graph to translate(921.3865131745112,568.70196664657) scale(0.33400000000000013)
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs

When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs
And the user should not see any nodes in level 2, below the root entity, in the graphs

When the user enters percentage as 200 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs
And the user should not see any nodes in level 2, below the root entity, in the graphs
And the user should see, percent filter is reset to 100 for both input box and slider, in the graphs

When the user enters percentage as abc in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs

And the user should see the list of owners in level 6, above the root entity, in the graphs
When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. Entity user is viewing has owners that are type person and the relationship is active, display those owners on the graph
   1. Person owner has percent ownership, display percent on owner's node on graph
   2. User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph)
   3. User un-checks "Direct Relationships Only" box, then graph updates to show all owners in any level
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should not see any nodes in level 2, above the root entity, in the graphs
Then the user should not see any nodes in level 2, below the root entity, in the graphs

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs

Examples:
|fid|
|LE-A|

Scenario: Covers below scenarios
a. 0. By default UBO checkbox is available but not checked
   1. If graph has UBOs (owners that are type person), checkbox is clickable
   2. User checks UBO highlight box, all person owners in the graph are highlighted
   3. User unchecks UBO highlight box, highlight is removed from person owners
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see the ultimate beneficial owners filter checkbox unchecked by default in the graph
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. Root node appears in multiple times in the same path
   1. Visual indicator count doesnt change even filter is applied
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root and highlighted on the graphs
And the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-56|QA Legal Entity 56|Appears: 2|

Scenario: Covers below scenarios
a. 0. Legal Entity appears at multiple levels
   1. Legal Entity appears at multiple levels is highlighted when clicked on one of the occurances
   2. Visual indentifier must not be displayed when Non-person/Non-legal Entities appear multiple times on the graph
b. 0. Person appears at multiple levels
   1. Person appears at multiple levels is highlighted when clicked on one of the occurances
   2. Visual indentifier must not be displayed when Non-person/Non-legal Entities appear multiple times on the graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
When the user resize graph to translate(921.3865131745112,568.70196664657) scale(0.33400000000000013)
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
And the user should not see the visual indicator displayed for non-person/non-entity when appeared multiple time for <entity> in the graphs
And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs

Examples:
|fid|legalEntity|countValue|entity|
|LE-6|QA Legal Entity 61|Appears: 3|Local Government, Legal Entity 61 owned by Local Government|
|LE-6|QA Test Person 1|Appears: 3|Local Government, Legal Entity 61 owned by Local Government|

Scenario: Visual Indicator not been displayed for Legal entities which are displayed only once
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see the legal entity QA Legal Entity 9, user is currently viewing, as the root and highlighted on the graphs
And the user should not see visual indicator for legal entity <legalEntity>, when displayed only once

Examples:
|fid|legalEntity|
|LE-9|QA Legal Entity 16|

Scenario: Visual Indicator not been displayed for persons with same name but different fid's
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root and highlighted on the graphs
And the user should not see the visual indicator for entity with same name but different fid <legalEntity>

Examples:
|fid|legalEntity|
|LE-A|QA Test Person A|

Scenario: Verify percent filter is applied at all level and null percent relationships remain on the graph and are never filtered out by the percent filter
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: User clicks on extend graph link and user is navigated to the respective graph page of that entity
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user resize graph to translate(1096.0998681640626,-181.31536080169678) scale(0.9910000000000001)
And the user clicks on extend graph link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|nodeTitle|
|9461|The Miyazaki Bank Ltd|

Scenario: Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Belgium (1)|
|France (1)|
|Japan (71)|
|Singapore (1)|
|USA (3)|

When the user resize graph to translate(-892.9171422119143,1270.0646228027344) scale(0.9910000000000001)
When the user clicks on extend graph link which appears on the legal entity node <nodeTitle> in the graphs
Then the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Austria (1)|
|France (84)|
|Japan (2)|
|UK (2)|

Examples:
|fid|nodeTitle|
|30087|Amundi Group SA|

Scenario: Verify graph truncation notification message
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5

Examples:
|fid|
|444|

Scenario: Verify graph truncation notification message
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5 and the pdf will be downloaded as a list

Examples:
|fid|
|73125|

Scenario: Verify graph truncation notification message
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and more than 2500 nodes and the pdf will be downloaded as a list

Examples:
|fid|
|7127|

Scenario: Covers below scenarios for KYC-600 User can view "graph help" page
a. 0. Verify graph help link and tool tip in graph page
   1. Verify graph help model window and close button functionality
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on graph help link in graph page
Then the user should see a model window with static help content for graph
When the user clicks close button in graph help model window
Then the model window should be closed and user should see active graph page where the user was initially
Then the user should see tool tip for zoom, ownership percentage and country highlights

Examples:
|fid|
|211|

Scenario: Not implemented, Data missing
1. If legal entity in focus returns greater than 2500 nodes on both owners and subs side of full graph.
2. If legal entity in focus returns greater than 125 triples on both owners and subs side of full graph.


Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout