Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: Covers below scenarios
a. 0. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
   1. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graph
   2. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graph
   3. If user moves slider to percent 1-100, null percent owners are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only owners that are owned by equal to or greater than selected percent appear on the graph
   4. Root node appears in multiple times in the same path
   5. By default UBO checkbox is available but not checked
   6. If graph has UBOs (owners that are type person), checkbox is clickable
   7. User checks UBO highlight box, all person owners in the graph are highlighted
   8. Verify in product message is not displaying for the users with UBO access
   9. User clicks on show more link and user is navigated to the respective graph page of that entity
   10. Verify graph truncation notification message
   11. Entity on owners graph has non-institution, non-person entity type owner and the relationship is active, display that owner on the graph
   12. non-institution, non-person entity type owner has percent ownership, display on the owner's node
   13. Entity user is viewing has owners that are type person and the relationship is active, display those owners on the graph
   14. Person owner has percent ownership, display percent on owner's node on graph
   15. Select a country highlight, legal entities in the owners graph that have that country of operations are highlighted (including root node of graph if applicable)
   16. Select "No country highlight", removes country highlight of legal entities
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (11)|
|Belgium (3)|
|Bermuda (11)|
|Canada (16)|
|France (4)|
|Italy (13)|
|Japan (30)|
|Lebanon (2)|
|Norway (2)|
|South Africa (5)|
|UK (11)|
|USA (553)|

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

When the user resize graph to translate(-9524.62870605469,2084.3533395156865) scale(0.9910000000000001)
When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|countValue|legalEntity|nodeTitle|
|444|Appears: 3|Intesa Sanpaolo SpA|JPMorgan Chase & Co|