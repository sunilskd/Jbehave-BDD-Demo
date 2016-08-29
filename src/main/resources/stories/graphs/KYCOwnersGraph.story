Epic: Ownership

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
A key part of this process is to find out if there are any owners of the bank they will potentially do business which are known to be risky or involved in criminal activities. The graphs provides information about owners in a visual way so that it is easier to follow relationship paths.

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not have access to below entity types -
1. Person (UBOs)
2. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-112 - KYC user can view free text ownership on owners graphs
JIRA ID - KYC-37 - KYC user can filter owners graphs by percent ownership
JIRA ID - KYC-34 - KYC user can view owners graphs
JIRA ID - KYC-138 - Owners graphs - Direct-Indirect filter
JIRA ID - KYC-105 - KYC user can highlight legal entities by country in ownership graphs
JIRA ID - KYC-114 - UBO user can view non-person, non-entity owners on owners graphs
JIRA ID - KYC-254 - Side panel for free text ownership on owners graphs
JIRA ID - KYC-33 - KYC user can see visual indicator for entity that appears multiple times in the ownership graphs
JIRA ID - KYC-229 - UBO user can highlight UBOs on graphs
JIRA ID - KYC-330 - Remove links for person,non-entity or non-person in graphs
JIRA ID - KYC-155 - User will see in product message on owners graph if they do not have access to UBO data
JIRA ID - KYC-250 - User can click hyperlink "please subscribe" in UBO in product message
JIRA ID - KYC-392 - % filter input box is not resetting to 100% when user enters more than 100% in % input box in graph page.
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph
JIRA ID - KYC-455 - new truncation logic owners graph

Meta:@kycownersgraphs @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Scenario 1
.Description
----
a. 0. An entity on the graphs (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graphs above the entity it owns.
   1. Owner has percent ownership, display percent on owner's node on graphs
   2. Owner has null percent ownership, do not display percent ownership on owner node on graphs
   3. Entity has owners of type person, do not display on the graphs for KYC user
   4. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
   5. Free text ownership does not exist for entity user is viewing, do not display free text on owners graphs
   6. Entity on the graphs has a non-institution, non-person owner, do not display that owner on the graphs for KYC user
   7. User will see in product message on owners graph if they do not have access to UBO data and UBOs exisits fot the entity user is viewing.
----
image:KYCOwnersgraphs-Scenario-1.png[Scenario 1]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs
And the user should see the list of owners in level 6, above the root entity, in the graphs
Then the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://accuity.lookbookhq.com/bankers-almanac-ubo/video?cmpid=ILC%7CBRSK%7CBAFPU-2016-0810-GLOB-ba-ubo%7CLookBook&sfid=701D0000000dwwH on accuity.com

Examples:
|fid|
|LE-6|

Scenario:
a. 0. Entity user is viewing does not have any owners, display message "No known entities."
   1. Do not display in product message when there are no UBOs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see message displayed in place of graph explaining there are no entities in the graphs
And the kyc user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-32|

Scenario: Covers below scenarios
a. 0. Entity user is viewing does not have any active relationships to legal entity owners do not display owners
   1. User will see in product message on owners list if UBO's exist and they do not have access to UBO data
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-D|

Scenario: Scenario 2
.Description
----
a. 0. An entity on the graphs (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graphs
   1. An entity on the graphs (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graphs
----
image:KYCOwnersgraphs-Scenario-2.png[Scenario 2]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 23, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-23|

Scenario: Scenario 3
.Description
----
Entity (including entity user is viewing) appears in the same path of the graphs more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
----
image:KYCOwnersgraphs-Scenario-3.png[Scenario 3]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 3, above the root entity, in the graphs
Then the user should not see any nodes in level 4, above the root entity, in the owners graph

Examples:
|fid|
|LE-56|

Scenario: Scenario 4
.Description
----
To verify circular relationship
----
image:KYCOwnersgraphs-Scenario-4.png[Scenario 4]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-51|

Scenario: To verify owners graphs when entity user is viewing is also an owner of the same entity
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity Vontobel Holding AG, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|11262|

Scenario: KYC-138 - Owners graphs - Direct-Indirect filter covers below scenarios
a. By Default checkbox for Direct relationship is not selected
b. If no owners are present, filter is still available
c. If there are no owners beyond level 1 direct relationships, filter is still available
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the direct relationship only filter checkbox unchecked by default in the graphs

Examples:
|fid|
|LE-6|
|LE-55|
|LE-61|

Scenario: Covers below scenarios
a. 0. User selects "Direct Relationships Only", then graphs updates to only show direct owners (level 1 of graphs)
   1. User un-checks "Direct Relationships Only" box, then graphs updates to show all owners in any level
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of owners in level 1, above the root entity, in the graphs
Then the user should not see any nodes in level 2, above the root entity, in the owners graph
When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
Examples:
|fid|
|LE-6|

Scenario: User selects "Direct Relationships Only", then graphs updates to only show direct owners (level 1 of graphs) including free text
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity 61, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of owners in level 1, above the root entity, in the graphs
Then the user should not see any nodes in level 2, above the root entity, in the owners graph

Examples:
|fid|
|LE-61|

Scenario: Verify tool tip displays legal title in graphss
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph

Then the user should see the legal title displayed in the nodes when the user hovers over it in the graphs
|LEGAL TITLE|
|QA Legal Entity 6|
|QA Legal Entity 9|
|QA Legal Entity 10|
|QA Legal Entity 16|
|QA Legal Entity 18|
|QA Legal Entity 11|
|Treasury shares, 3.8; Trade Union Federations of SGB (where no federation owns 3 or more), 4.8; Others, 23.4|
|QA Legal Entity 14|
|QA Legal Entity 12|
|QA Legal Entity 17|
|QA Legal Entity 19|
|Other shareholders owning less than 2, 71.315|
|QA Legal Entity 15|
|QA Legal Entity 13|
|QA Legal Entity 61|
|QA Legal Entity 61|
|Top 20 shareholders, 57.67; Others, 42.33. There were no persons with a substantial shareholding in the Bank|
|QA Legal Entity 61|
|Top shareholders owning less than 2, 71.315|
|Top shareholders owning less than 2, 71.315|
|Top shareholders owning less than 2, 71.315|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. "No country highlight" is default selection in country highlight drop-down
   1. List country of operations for legal entities that appear on the graphs in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   2. Select a country highlight, legal entities in the owners graphs that have that country of operations are highlighted (including root node of graphs if applicable)
   3. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   4. Select "No country highlight", removes country highlight of legal entities
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph

Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK (7)|
|USA (5)|

When the user selects a country UK from the country highlight list in the graphs

Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 6|
|QA Legal Entity 10|
|QA Legal Entity 9|
|QA Legal Entity 11|
|QA Legal Entity 12|
|QA Legal Entity 14|
|QA Legal Entity 13|

When the user selects a country USA from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 16|
|QA Legal Entity 18|
|QA Legal Entity 17|
|QA Legal Entity 19|
|QA Legal Entity 15|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. Country highlight should display No country highlight even when there are no entities to display in the graphs
   1. Do not display in product message when there are no entities to display in graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|

And the kyc user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|1|

Scenario: Free text ownership always remains visible on graphs despite any filter applied
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 10, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs

Examples:
|fid|
|LE-10|

Scenario: Covers below scenarios
a. 0. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graphs
   1. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graphs
   2. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graphs
   3. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only owners that are owned by 100 percent appear on graphs
   4. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all owners are displayed in the graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs

When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should not see any nodes in level 2, below the root entity, in the graphs

When the user enters percentage as 200 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should not see any nodes in level 2, below the root entity, in the graphs
And the user should see, percent filter is reset to 100 for both input box and slider, in the graphs

When the user enters percentage as abc in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of owners in level 6, above the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. If user moves slider to percent 1-100, null percent owners are filtered out and not displayed on the graphs, input box automatically updates to reflect percent selected by slider, only owners that are owned by equal to or greater than selected percent appear on the graphs
   1. If user moves slider to 0 percent, all owners appear on graphs
   2. User applies percent filter that results in no owners on the graphs, only root node is left on the graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should not see any nodes in level 2, above the root entity, in the owners graph

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. User clicks on free text in owners graphs and a side panel should display with free text information under header "details"
   1. User clicks on another free text, then the side panel is displayed with free text of the selected node
   2. User clicks on close button on the side panel, then panel closed and user continues to be on owners graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph

When the user clicks on the tile of the free text entity Treasury shares, 3.8 (including the entity of interest) in the graphs
Then the user should see below free text in the side panel in the graphs
|FREETEXT|
|Treasury shares, 3.8; Trade Union Federations of SGB (where no federation owns 3 or more), 4.8; Others, 23.4|

When the user clicks on the tile of the free text entity Other shareholders (including the entity of interest) in the graphs
Then the user should see below free text in the side panel in the graphs
|FREETEXT|
|Other shareholders owning less than 2, 71.315|

When the user clicks on close button on the side panel in the graphs
Then the user should see the side panel closed and should be able to continue in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. Root node appears in multiple times in the same path
   1. Visual indicator count doesnt change even filter is applied
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root and highlighted on the graphs
And the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-56|QA Legal Entity 56|Appears: 2|

Scenario: Covers below scenarios
a. 0. Legal Entity appears at multiple levels
   1. Legal Entity appears at multiple levels is highlighted when clicked on one of the occurances
   2. Visual indentifier must not be displayed when free text appears multiple times on the graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
And the user should not see the visual indicator displayed for free text ownership when appeared multiple time for <entity> in the graphs
And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs

Examples:
|fid|legalEntity|countValue|entity|
|LE-6|QA Legal Entity 61|Appears: 3|Top shareholders owning less than 2, 71.315 |

Scenario: Visual Indicator not been displayed for Legal entities which are displayed only once
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 9, user is currently viewing, as the root and highlighted on the graphs
And the user should not see visual indicator for legal entity <legalEntity>, when displayed only once

Examples:
|fid|legalEntity|
|LE-9|QA Legal Entity 16|

Scenario: By default UBO highlight checkbox is available on owners graphs, but is disabled for KYC user and not selectable
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the ultimate beneficial owners filter checkbox disabled in the graph

Examples:
|fid|
|LE-A|

Scenario: Verify parent child relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

Then the user should see the owners for the legal entity QA Legal Entity 6 in the graphs
Then the user should see the owners for the legal entity QA Legal Entity 10 in the graphs
Then the user should see the owners for the legal entity QA Legal Entity 9 in the graphs
Then the user should see the owners for the legal entity QA Legal Entity 18 in the graphs
Then the user should see the owners for the legal entity QA Legal Entity 61 in the graphs

Examples:
|fid|
|LE-6|

Scenario: User clicks on show more link and user is navigated to the respective graph page of that entity
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user enters percentage as 35 in ownership percentage filter text box in the graphs
And the user resize graph to translate(858.3435068817788,1096.5485766439203) scale(0.649)
And the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|nodeTitle|
|51859|Santander Holding Internacional SA|

Scenario: KYC-455 Covers below scenarios for truncated owners graph for KYC user.
a. 0. Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
   1. click “show more” link on tiles to view hidden segments in a new graph.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Belgium (1)|
|Italy (12)|

When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Italy (52)|
|Luxembourg (1)|
|Norway (3)|
|UK (1)|
|USA (1)|

Examples:
|fid|nodeTitle|
|415|Unione Fiduciaria SpA|

Scenario: KYC-455 Covers below scenarios for truncated owners graph for a KYC user.
a. 0. Verify graph truncation notification message when number of nodes are greater than 2500
   1. Percent ownership filter options not affected by truncation.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the notification message that the graphs are truncated when there are more than 2500 nodes
When the user enters percentage as 7 in ownership percentage filter text box in the graphs
And the user resize graph to translate(208.5,1229.8999939537052) scale(0.397)
Then the user should see the list of owners in level 11, above the root entity, in the graphs

Examples:
|fid|
|250786|

Scenario: Scenarios pending as Data missing
1. If legal entity in focus returns greater than 125 triples for ownership and an ownership relationship has >2500 owner nodes, then the message "This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the “show more” link on tiles to view hidden segments in a new graph" should be displayed.


Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout