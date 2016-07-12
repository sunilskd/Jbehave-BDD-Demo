Epic: Full Graph

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not have access to below entity types -
1. Person (UBOs)
2. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-79 - UBO user can view full graph
JIRA ID - KYC-229 - UBO user can highlight UBOs on the graph
JIRA ID - KYC-116 - KYC user can view free text ownership on full graph
JIRA ID - KYC-103 - KYC user can filter full graph by percent ownership
JIRA ID - KYC-110 - KYC user can highlight legal entities by country in full graph
JIRA ID - KYC-158 - KYC user can see visual indicator for entity that appears multiple times on the full graph
JIRA ID - KYC-136 - Full Graph - Direct / Indirect Filter
JIRA ID - KYC-156 - User will see in product message on full graph if they do not have access to UBO data
JIRA ID - KYC-250 - User can click hyperlink "please subscribe" in UBO in product message
JIRA ID - KYC-392 - % filter input box is not resetting to 100% when user enters more than 100% in % input box in graph page.
JIRA ID - KYC-241 - Do not display the free text when the % filters are applied.
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph

Meta:@kycfullgraph @kyc

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
   9. Subsidiary graph should not display the free text
   10. User will see in product message on owners graph if they do not have access to UBO data and UBOs exisits fot the entity user is viewing.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.901Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below owners in level 2, above the root entity, in the graphs
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below owners in level 3, above the root entity, in the graphs
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the graphs
|NODES|
|QA Legal Entity 4571.91Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below owners in level 4, above the root entity, in the graphs
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|
|Top 20 shareholders,57.67; Others,...|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the graphs
|NODES|
|QA Legal Entity 4671.91|

And the user should see the list of below owners in level 5, above the root entity, in the graphs
|NODES|
|QA Legal Entity 6141.99|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

And the user should see the list of below owners in level 6, above the root entity, in the graphs
|NODES|
|Top shareholdersowning less than 2,...|

And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://www.accuity.com/Util/login.aspx?ReturnUrl=%2ffinancial-counterparty-kyc%2fubo%2f on accuity.com

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
   1. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
   2. User will see in product message on full graph if they do not have access to UBO data , and UBOs exisits in any paths of the full graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 23, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 2951.53India|

And the user should see the list of below owners in level 2, above the root entity, in the graphs
|NODES|
|QA Legal Entity 322.53India|
|QA Legal Entity 30India|

And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://www.accuity.com/Util/login.aspx?ReturnUrl=%2ffinancial-counterparty-kyc%2fubo%2f on accuity.com

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
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 3, above the root entity, in the graphs
|NODES|
|QA Legal Entity 5630.23|
|Top shareholdersowning less than 2,...|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the graphs
|NODES|
|QA Legal Entity 5651.99|
|QA Legal Entity 6056.99|

Then the user should not see any nodes in level 4, above the root entity, in the graphs

Examples:
|fid|
|LE-56|

Scenario: To verify circular relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 5251.23|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 54|
|QA Legal Entity 5251.23|

And the user should see the list of below owners in level 2, above the root entity, in the graphs
|NODES|
|QA Legal Entity 5151.23|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
|NODES|
|QA Legal Entity 53|
|QA Legal Entity 5151.23|

Examples:
|fid|
|LE-51|

Scenario: Covers below scenarios
a. 0. Entity user is viewing does not have owners or subsidiaries, display message "No known entities."
   1. Do not display in product message when there are no UBOs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no entities in the graphs
And the kyc user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-58|

Scenario: Entity user is viewing has owners but not subsidiaries, show the owners on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should not see any nodes in level 1, below the root entity, in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the graphs
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
Then the user should not see any nodes in level 1, above the root entity, in the graphs

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 1451.53UK|

Examples:
|fid|
|LE-15|

Scenario: Covers below scenario
a. 0. Entity on the subsidiary portion of graph has an active relationship where it is the owner but the owned entity is inactive, then do not display owned entity on graph
   1. Do not display in product message when there are no UBOs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should not see any nodes in level 1, below the root entity, in the graphs
And the kyc user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs

Examples:
|fid|
|LE-62|

Scenario: Covers below scenarios
a. 0. "No country highlight" is default selection in country highlight drop-down
   1. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   2. Select a country highlight, legal entities in the full graph that have that country of operations are highlighted (including root node of graph if applicable)
   3. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   4. Select "No country highlight", removes country highlight of legal entities
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|
|USA|

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
   5. Display only root node when the applied percent filter doesn't result in any other nodes
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 25 in ownership percentage filter text box in the graphs

Then the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 3425.901Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
|NODES|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the graphs
|NODES|
|QA Legal Entity 150.52UK|

And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|

When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs

When the user enters percentage as 200 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs
And the user should see, percent filter is reset to 100 for both input box and slider, in the graphs

When the user enters percentage as abc in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs

And the user should see the list of below owners in level 6, above the root entity, in the graphs
|NODES|
|Top shareholdersowning less than 2,...|

When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph)
   1. User un-checks "Direct Relationships Only" box, then graph updates to show all owners in any level
   2. User will see in product message on owners graph if they do not have access to UBO data
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.901Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

Then the user should not see any nodes in level 2, above the root entity, in the graphs
Then the user should not see any nodes in level 2, below the root entity, in the graphs

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 2, above the root entity, in the graphs
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://www.accuity.com/Util/login.aspx?ReturnUrl=%2ffinancial-counterparty-kyc%2fubo%2f on accuity.com

Examples:
|fid|
|LE-6|

Scenario: By default UBO highlight checkbox is available on full graph, but is disabled for KYC user and not selectable
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the ultimate beneficial owners filter checkbox disabled in the graph
And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://www.accuity.com/Util/login.aspx?ReturnUrl=%2ffinancial-counterparty-kyc%2fubo%2f on accuity.com

Examples:
|fid|
|LE-A|

Scenario: Covers below scenarios
a. 0. Root node appears in multiple times in the same path
   1. Visual indicator count doesnt change even filter is applied
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root and highlighted in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-56|QA Legal Entity 56|Appears: 2|

Scenario: Covers below scenarios
a. 0. Legal Entity appears at multiple levels
   1. Legal Entity appears at multiple levels is highlighted when clicked on one of the occurances
   2. Visual indentifier must not be displayed when free text appears multiple times on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
And the user should not see the visual indicator displayed for free text ownership when appeared multiple time for <entity> in the graphs

Examples:
|fid|legalEntity|countValue|entity|
|LE-6|QA Legal Entity 61|Appears: 3|Top shareholders owning less than 2, 71.315|

Scenario: Visual Indicator not been displayed for Legal entities which are displayed only once
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 9, user is currently viewing, as the root and highlighted in the graphs
And the user should not see visual indicator for legal entity <legalEntity>, when displayed only once

Examples:
|fid|legalEntity|
|LE-9|QA Legal Entity 16|

Scenario: Covers below scenarios
a. 0. User clicks on free text in owners graph and a side panel should display with free text information under header "details"
   1. User clicks on another free text, then the side panel is displayed with free text of the selected node
   2. User clicks on close button on the side panel, then panel closed and user continues to be on owners graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button

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

Scenario: Verify percent filter is applied at all level
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
|NODES|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the graphs
|NODES|
|QA Legal Entity 150.52UK|

Examples:
|fid|
|LE-6|

Scenario: Verify parent child relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

Then the user should see the below owners for the legal entity QA Legal Entity 6 in the graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Then the user should see the below owners for the legal entity QA Legal Entity 10 in the graphs
|NODES|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

Then the user should see the below owners for the legal entity QA Legal Entity 9 in the graphs
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|

Then the user should see the below owners for the legal entity QA Legal Entity 18 in the graphs
|NODES|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

Then the user should see the below owners for the legal entity QA Legal Entity 61 in the graphs
|NODES|
|Top shareholdersowning less than 2,...|

Then the user should see the below subsidiaries for the legal entity QA Legal Entity 6 in the graphs
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.901Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

Then the user should see the below subsidiaries for the legal entity QA Legal Entity 35 in the graphs
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|

Examples:
|fid|
|LE-6|

Scenario: Display the free text when the % filters are applied
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 10, user is currently viewing, as the root and highlighted in the graphs
When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the below owners for the legal entity QA Legal Entity 10 in the graphs
|NODES|
|Treasury shares, 3.8;Trade Union...|

Examples:
|fid|
|LE-10|

Scenario: User clicks on show more link and user is navigated to the respective graph page of that entity
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|nodeTitle|
|9461|The Miyazaki Bank Ltd|