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
JIRA ID - KYC-392 - Percent filter input box is not resetting to 100 when user enters more than 100 in input box in graph page.
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph

Meta:@subsidiariesgraphLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: Verify below scenarios
a. 0. Entity on the graph (could be entity user is viewing or another entity on graph) has at least one active relationship where it is the owner and the owned entity is also active, display owned entity as subsidiary on graph and display percent ownership on subsidiary
   1. Relationship has null percent ownership, do not display a percent ownership on the subsidiary entity
   2. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   3. "No country highlight" is default selection in country highlight drop-down
   4. Select a country highlight, legal entities in the subsidiaries graph that have that country of operations are highlighted (including root node of graph if applicable)
   5. Select "No country highlight", removes country highlight of legal entities
   6. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   7. By Default checkbox for Direct relationship is not selected
   8. User selects "Direct Relationships Only", then graph updates to only show direct subsidiaries (level 1 of graph)
   9. User un-checks "Direct Relationships Only" box, then graph updates to show all subsidiaries in any level
   10. By default, percent filter is set to 0 for both input box and slider, all subsidiaries are displayed in the graph
   11. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
   12. Verify UBO filter is not available for subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see the legal entity BIO, user is currently viewing, as the root and highlighted on the graphs
When the user resize graph to translate(701.8609045988187,383.0603029629543) scale(0.1)
Then the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs

Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Belgium (1)|
|Benin (48)|
|Burkina Faso (1)|
|Burundi (2)|
|Chad (1)|
|Congo (Democratic Republic of) (1)|

When the user selects a country Burundi from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Banque de Crédit de Bujumbura SM|
|Banque Nationale pour le Développement Economique SM|

When the user selects another country Ghana from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Bank of Africa - Ghana|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs
Then the user should see the direct relationship only filter checkbox unchecked by default in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the legal entity BIO, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should not see any nodes in level 2, below the root entity, in the graphs
When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the legal entity BIO, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 7, below the root entity, in the graphs
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 5 in ownership percentage filter text box in the graphs
Then the user should see the legal entity BIO, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
Then the user should not see the ultimate beneficial owners filter checkbox in the subsidiaries graph

Examples:
|fid|
|285271|

Scenario: Verify below scenarios
a. 0. Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
   1. User clicks on show more link and user is navigated to the respective graph page of that entity
   2. Verify graph truncation notification message
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the notification message that the graphs are truncated
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Albania (1)|
|Algeria (1)|
|Australia (3)|
|Belgium (6)|
|Benin (1)|
|Bermuda (1)|
|Bulgaria (1)|
|Burkina Faso (1)|

When the user resize graph to translate(553.5,346.5817501726486) scale(0.397)
When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|France (1)|
|USA (1)|

Examples:
|fid|nodeTitle|
|9461|Ballane SAS|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page

