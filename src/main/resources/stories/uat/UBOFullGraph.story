Epic: Full Graph

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
JIRA ID - KYC-392 - % filter input box is not resetting to 100% when user enters more than 100% in % input box in graph page.
JIRA-ID - KYC-397 - Truncate large full graph
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph

Meta:@ubofullgraphLive @live

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: UBO user views full graph
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity as owner on graph above the entity it owns.
   1. Ownership relationship has percent ownership, display percent on owner's node on graph
   2. Ownership relationship has null percent ownership, do not display percent ownership on owner node on graph
   3. Entity on full graph has non-institution, non-person entity type owner and the relationship is active, display that owner on the graph
   4. UBO user will not see in product message on full graph
   5. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
   6. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graph
   7. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graph
   8. If user moves slider to percent 1-100, null percent owners are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only owners that are owned by equal to or greater than selected percent appear on the graph
   9. Root node appears in multiple times in the same path
   10. By default UBO checkbox is available but not checked
   11. If graph has UBOs (owners that are type person), checkbox is clickable
   12. User checks UBO highlight box, all person owners in the graph are highlighted
   13. User clicks on show more link and user is navigated to the respective graph page of that entity
   14. Verify graph truncation notification message
   15. Entity on owners graph has non-institution, non-person entity type owner and the relationship is active, display that owner on the graph
   16. non-institution, non-person entity type owner has percent ownership, display on the owner's node
   17. Entity user is viewing has owners that are type person and the relationship is active, display those owners on the graph
   18. Person owner has percent ownership, display percent on owner's node on graph
   19. Select a country highlight, legal entities in the owners graph that have that country of operations are highlighted (including root node of graph if applicable)
   20. Select "No country highlight", removes country highlight of legal entities
   21. Subsidiary relationship has percent ownership, display percent ownership on the subsidiary node
   22. Subsidiary relationship has null percent ownership, do not display a percent ownership on the subsidiary node
   23. Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
Then the user should see the notification message that the graphs are truncated
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Albania (2)|
|Australia (11)|
|Bangladesh (1)|
|Belgium (6)|
|Bermuda (11)|
|Bosnia-Herzegovina (4)|
|Brazil (2)|
|Cameroon (1)|
|Canada (16)|
|Chile (1)|
|China (1)|
|Croatia (10)|
|Egypt (2)|
|France (14)|
|Germany (4)|
|Guadeloupe (1)|
|Guernsey (1)|
|Hungary (23)|
|Ireland (6)|
|Italy (277)|
|Japan (30)|
|Lebanon (2)|
|Luxembourg (116)|
|Norway (7)|
|Romania (7)|
|Russian Federation (5)|
|Slovakia (10)|
|Slovenia (8)|
|South Africa (5)|
|Spain (1)|
|St Lucia (1)|
|Switzerland (2)|
|Tunisia (2)|
|Uganda (1)|
|UK (13)|
|Ukraine (1)|
|USA (556)|

Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 2 in ownership percentage filter text box in the graphs
Then the user should see the legal entity Intesa Sanpaolo SpA, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
When the user selects a country Norway from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Norges Bank|
|State of the Kingdom of Norway|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs
When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 0 in the graph
Then the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
Then the user should see the ultimate beneficial owners filter checkbox unchecked by default in the graph
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
When the user resize graph to translate(103.29471032745596,355.8186382754924) scale(0.1)
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|Mrs Nada Aoueini|

When the user enters percentage as 51 in ownership percentage filter text box in the graphs
When the user resize graph to translate(1008.589110477431,306.03967399687065) scale(0.1)
Then the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
Then the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 0 in the graph
When the user resize graph to translate(-9524.62870605469,2084.3533395156865) scale(0.9910000000000001)
When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|countValue|legalEntity|nodeTitle|
|444|Appears: 3|Intesa Sanpaolo SpA|JPMorgan Chase & Co|