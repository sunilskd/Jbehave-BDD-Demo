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
JIRA ID - KYC-392 - Percent filter input box is not resetting to 100 when user enters more than 100 in input box in graph page.
JIRA ID - KYC-241 - Do not display the free text when the filters are applied.
JIRA-ID - KYC-397 - Truncate large full graph
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph

Meta:@kycfullgraphLive @live

Scenario: kyc user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page

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
   11. "No country highlight" is default selection in country highlight drop-down
   12. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   13. Select a country highlight, legal entities in the full graph that have that country of operations are highlighted (including root node of graph if applicable)
   14. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   15. Select "No country highlight", removes country highlight of legal entities
   16. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
   17. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graph
   18. User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph)
   19. By default UBO highlight checkbox is available on full graph, but is disabled for KYC user and not selectable
   20. Display the free text when the % filters are applied
   21. Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity Intesa Sanpaolo SpA, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 5, below the root entity, in the graphs
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5
Then the user should see the ultimate beneficial owners filter checkbox disabled in the graph
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (4)|

When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 2|

When the user selects another country India from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 3|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs

Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 9 in ownership percentage filter text box in the graphs
Then the user should see the list of owners in level 1, above the root entity, in the graphs
Then the user should see the list of owners in level 2, above the root entity, in the graphs
Then the user should not see any nodes in level 3, above the root entity, in the graphs
Then the user should not see any nodes in level 1, below the root entity, in the graphs

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should not see any nodes in level 2, above the root entity, in the graphs
Then the user should not see any nodes in level 2, below the root entity, in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs

When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Japan (29)|

When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the owners for the legal entity The Fukuoka Chuo Bank in the graphs

And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://accuity.lookbookhq.com/bankers-almanac-ubo/video?cmpid=ILC%7CBRSK%7CBAFPU-2016-0810-GLOB-ba-ubo%7CLookBook&sfid=701D0000000dwwH on accuity.com

Examples:
|fid|legalEntity|countValue|nodeTitle|
|30087|Japan Trustee Services|Appears: 3|The Howa Bank Ltd|


Scenario: KYC user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page