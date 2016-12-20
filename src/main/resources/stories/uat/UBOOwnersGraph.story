Epic: UBO
----
.Overall Report

image:.uat.UBOOwnersGraph.stats.png
----

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).

UBO user has access to below entity types -
1. Legal Entities
2. People
3. Other entity types (non-person, non-entity)

UBO user does not have access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-37 - KYC user can filter owners graph by percent ownership
JIRA ID - KYC-138 - Owners Graph - Direct-Indirect filter
JIRA ID - KYC-105 - KYC user can highlight legal entities by country in ownership graph
JIRA ID - KYC-49 - UBO user can view ownership graph with UBOs
JIRA ID - KYC-114 - UBO user can view non-person, non-entity owners on owners graph
JIRA ID - KYC-33 - KYC user can see visual indicator for entity that appears multiple times in the ownership graph
JIRA ID - KYC-229 - UBO user can highlight UBOs on graph
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph
JIRA ID - KYC-167 - Do not display ownership for inactive legal entity
JIRA ID - KYC-480 - Percent filter should not filter out null percent relationships

Meta:@uboownersgraphLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: Covers below scenarios
a. 0. User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph)
   1. User un-checks "Direct Relationships Only" box, then graph updates to show all owners in any level
   2. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
   3. Owner has percent ownership, display percent on owner's node on graph
   4. "No country highlight" is default selection in country highlight drop-down
   5. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   6.  By Default checkbox for Direct relationship is not selected
   7. If no owners are present, filter is still available
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the direct relationship only filter checkbox unchecked by default in the graphs
Then the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
When the user resize graph to  translate(900.4094412838654,547.8049067378745) scale(0.29800000000000004)
Then the user should see the list of owners in level 1, above the root entity, in the graphs
When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs

Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Ireland (1)|
|Malaysia (30)|

Examples:
|fid|
|69867|


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
   9. User clicks on extend graph link and user is navigated to the respective graph page of that entity
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

Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 2 in ownership percentage filter text box in the graphs
Then the user should see the legal entity Intesa Sanpaolo SpA, user is currently viewing, as the root and highlighted on the graphs
When the user selects a country Norway from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Norges Bank|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs
When the user enters percentage as 0 in ownership percentage filter text box in the graphs
When the user resize graph to translate(946.9235,516.7025) scale(0.9910000000000001)
When the user clicks on extend graph link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Examples:
|fid|nodeTitle|
|444|Blackrock Inc|

Scenario: When the user manipulates URL to navigate to an FID for an inactive legal entity. User should see inactive institution page with message "No ownership information available"
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user manipulates URL to navigate to 286840
Then the user should see the inactive institution page with message "No ownership information available"

Examples:
|fid|
|1038|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page











