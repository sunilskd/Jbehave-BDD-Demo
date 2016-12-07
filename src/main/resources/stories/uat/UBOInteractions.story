Epic: Ownership, Subsidiaries, Full Graph
----
.Overall Report

image:.uat.UBOInteractions.stats.png
----

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

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: Covers below scenarios for full graph
a. 1. if User selects country highlight and If user changes color of a highlighted tile to appears multiple, it still counts toward the country highlight count
   2. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   3. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   4. User applies direct relationships only filter and percent filter
   5. User unchecks "direct relationships only" filter, percent filter resets to 0
   6. Country highlights drop down updates when percent filter applied
   7. Country highlights drop down updates when direct relationships only filter applied
   8. User selects country highlight ,Count of tiles currently visible that match that country is displayed
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user resize graph to translate(898.3741874779042,259.4939128665061) scale(0.19757611705949005)
When the user enters percentage as 90 in ownership percentage filter text box in the graphs
Then the user should not see any nodes in level 1, above the root entity, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Albania (1)|
|Bosnia-Herzegovina (1)|
|Brazil (1)|
|Croatia (5)|
|France (2)|
|Ireland (4)|
|Italy (39)|
|Luxembourg (23)|
|Romania (2)|
|Slovakia (4)|
|Slovenia (2)|
|Switzerland (1)|
|UK (1)|
|Ukraine (1)|
|USA (3)|

When the user selects a country France from the country highlight list in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
Then the user should not see the entities highlighted in the graphs
And the user should not see any nodes in level 2, above the root entity, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Albania (1)|
|Brazil (1)|
|China (1)|
|Egypt (1)|
|France (1)|
|Hungary (1)|
|Ireland (1)|
|Italy (90)|
|Luxembourg (7)|
|Norway (1)|
|Romania (1)|
|Russian Federation (1)|
|Serbia (1)|
|Slovenia (1)|
|Spain (1)|
|Tunisia (1)|
|Ukraine (1)|
|USA (2)|

When the user selects a country Norway from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Norges Bank|

Examples:
|fid|legalEntity|
|444|Vanguard Group Inc|


Scenario: Verify multiple highlights
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user resize graph to translate(898.3741874779042,259.4939128665061) scale(0.19757611705949005)
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user selects a country USA from the country highlight list in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|
|732|MSL Inc|


Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page