Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 - Interaction between percent filter and direct/indirect filter on all graphs
JIRA ID - KYC 265 - Interaction between filters and highlights on all graphs
JIRA ID - KYC-262 - Interaction between appears multiple highlight, country highlight and UBO highlight
JIRA ID - KYC-371 - Zoom on owners graph
JIRA ID - KYC-372 - Zoom on subsidiaries graph
JIRA ID - KYC-371 - Zoom on full graph
JIRA ID - KYC-415 - User can see count of tiles that match a highlight

Meta:@ubointeractionsLive @live

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Covers below scenarios for full graph
a. 1. if User selects country highlight and If user changes color of a highlighted tile to appears multiple, it still counts toward the country highlight count
   2. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   3. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   4. User applies direct relationships only filter and percent filter
   5. User unchecks "direct relationships only" filter, percent filter resets to 0
   6. Country highlights drop down updates when percent filter applied
   7. Country highlights drop down updates when direct relationships only filter applied
   8. User selects country highlight ,Count of tiles currently visible that match that country is displayed
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button

When the user resize graph to translate(917.5,266.5) scale(0.397)
When the user enters percentage as 90 in ownership percentage filter text box in the graphs
Then the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
Then the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
Then the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should not see any nodes in level 1, above the root entity, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Bahamas (1)|
|Cayman Islands (1)|
|Germany (2)|
|Hong Kong (2)|
|Liechtenstein (1)|
|Luxembourg (2)|
|Singapore (1)|
|Slovenia (1)|
|Switzerland (9)|
|UAE (2)|
|USA (2)|

When the user selects a country Franec from the country highlight list in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
Then the user should not see the entities highlighted in the graphs
And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Austria (1)|
|Cayman Islands (1)|
|Germany (3)|
|Hong Kong (2)|
|Liechtenstein (1)|
|Luxembourg (2)|
|Singapore (1)|
|Switzerland (11)|
|UAE (2)|
|USA (2)|

When the user selects a country Norway from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Vontobel Wealth Management (Hong Kong) Ltd|
|Vontobel Asia Pacific Ltd|

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Austria (1)|
|Cayman Islands (1)|
|Germany (3)|
|Hong Kong (2)|
|Liechtenstein (1)|
|Luxembourg (2)|
|Singapore (1)|
|Switzerland (11)|
|UAE (2)|
|USA (2)|

When the user unchecks direct relationship only filter checkbox in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user selects a country USA from the country highlight list in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should not see the multiple appearance highlight on any node in the graphs


Examples:
|fid|legalEntity|
|444|Vanguard Group Inc|