Epic: Ownership, Subsidiaries, Full Graph
----
.Overall Report

image:.graphs.KYCInteractions.stats.png[KYC Interactions]
----

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 - Interaction between percent filter and direct/indirect filter on all graphs
JIRA ID - KYC 265 - Interaction between filters and highlights on all graphs

Meta:@kycinteractions @kyc

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios for owners graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
   4. Country highlights drop down updates when percent filter applied
   5. Country highlights drop down updates when direct relationships only filter applied
   6. Country highlights drop down updates when direct relationships only filter and percent filter are applied
   7. If user applies percent or direct filter, any highlights previously applied (country,appears multiple) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible
   9. User selects country highlight ,Count of tiles currently visible that match that country is displayed
   10. User selects country highlight and If a filter is applied, only tiles still visible after the filter count

When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK (2)|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK (3)|

When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 9|
|QA Legal Entity 6|
|QA Legal Entity 10|

When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the list of owners in level 1, above the root entity, in the graphs

And the user should not see the entities highlighted in the graphs

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs
And the user should see the list of owners in level 6, above the root entity, in the graphs
And the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK (7)|
|USA (5)|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-6|QA Legal Entity 61|Appears: 3|

Scenario: Covers below scenarios for subs graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
   4. Country highlights drop down updates when percent filter applied
   5. Country highlights drop down updates when direct relationships only filter applied
   6. Country highlights drop down updates when direct relationships only filter and percent filter are applied
   7. If user applies percent or direct filter, any highlights previously applied (country) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times doesnt appear
   9. User selects country highlight ,Count of tiles currently visible that match that country is displayed
   10. User selects country highlight and If a filter is applied, only tiles still visible after the filter count

When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs

And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (1)|
|India (1)|
|Korea (Republic of) (1)|
|UK (4)|

When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 2|
|QA Legal Entity 6|
|QA Legal Entity 1|
|QA Legal Entity 1|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should not see the entities highlighted in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (3)|
|India (1)|
|Korea (Republic of) (1)|
|UK (1)|

When the user enters percentage as 50 in ownership percentage filter text box in the graphs
Then the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|India (1)|
|Korea (Republic of) (1)|
|UK (1)|

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (4)|
|India (1)|
|Korea (Republic of) (6)|
|UK (5)|

And the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios for full graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
   4. Country highlights drop down updates when percent filter applied
   5. Country highlights drop down updates when direct relationships only filter applied
   6. Country highlights drop down updates when direct relationships only filter and percent filter are applied
   7. If user applies percent or direct filter, any highlights previously applied (country, appears multiple) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible
   9. User selects country highlight ,Count of tiles currently visible that match that country is displayed
   10. User selects country highlight and If a filter is applied, only tiles still visible after the filter count

When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user enters percentage as 25 in ownership percentage filter text box in the graphs

Then the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (4)|
|India (1)|
|Korea (Republic of) (4)|
|UK (10)|
|USA (1)|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (3)|
|India (1)|
|Korea (Republic of) (1)|
|UK (3)|

When the user selects a country Australia from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 33|
|QA Legal Entity 34|
|QA Legal Entity 35|

When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should not see the entities highlighted in the graphs

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs
And the user should see the list of owners in level 6, above the root entity, in the graphs

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia (4)|
|India (1)|
|Korea (Republic of) (6)|
|UK (11)|
|USA (5)|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-6|QA Legal Entity 61|Appears: 3|

Scenario: Covers below scenarios for full graph
a. 0. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
   1. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight
   2. if User selects country highlight and If user changes color of a highlighted tile to appears multiple, it still counts toward the country highlight count
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user selects a country Switzerland from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Pellegrinus Holding AG|
|Vontobel Foundation|
|Vontrust Family Holding|
|Vontobel Holding AG|
|Vontobel Holding AG|
|Harcourt Investment Consulting AG|
|Vontobel Swiss Wealth Advisors AG|
|Vontobel Securities AG|
|Vontobel Fonds Services AG|
|VT Investment (Zürich) AG|
|Bank Vontobel AG|
|Vontobel Holding AG|
|Vontobel Holding AG|
|Vontobel Beteiligungen AG|
|Finanzgesellschaft Hugo Kahn & Co Ltd|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
And the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Pellegrinus Holding AG|
|Vontobel Foundation|
|Vontrust Family Holding|
|Harcourt Investment Consulting AG|
|Vontobel Swiss Wealth Advisors AG|
|Vontobel Securities AG|
|Vontobel Fonds Services AG|
|VT Investment (Zürich) AG|
|Bank Vontobel AG|
|Vontobel Holding AG|
|Vontobel Holding AG|
|Vontobel Beteiligungen AG|
|Finanzgesellschaft Hugo Kahn & Co Ltd|

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Austria (3)|
|Bahamas (1)|
|Cayman Islands (1)|
|Czech Republic (1)|
|Germany (5)|
|Hong Kong (2)|
|Hungary (3)|
|Liechtenstein (1)|
|Luxembourg (2)|
|Singapore (1)|
|Slovenia (1)|
|Switzerland (14)|
|UAE (2)|
|USA (2)|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Pellegrinus Holding AG|
|Vontobel Foundation|
|Vontrust Family Holding|
|Vontobel Holding AG|
|Vontobel Holding AG|
|Harcourt Investment Consulting AG|
|Vontobel Swiss Wealth Advisors AG|
|Vontobel Securities AG|
|Vontobel Fonds Services AG|
|VT Investment (Zürich) AG|
|Bank Vontobel AG|
|Vontobel Holding AG|
|Vontobel Holding AG|
|Vontobel Beteiligungen AG|
|Finanzgesellschaft Hugo Kahn & Co Ltd|

And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|
|11262|Vontobel Holding AG|

Scenario: Covers below scenarios for owners graph
a. 0. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
   1. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user selects a country Switzerland from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Pellegrinus Holding AG|
|Vontobel Foundation|
|Vontrust Family Holding|
|Vontobel Holding AG|
|Vontobel Holding AG|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
And the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Pellegrinus Holding AG|
|Vontobel Foundation|
|Vontrust Family Holding|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Pellegrinus Holding AG|
|Vontobel Foundation|
|Vontrust Family Holding|
|Vontobel Holding AG|
|Vontobel Holding AG|

And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|
|11262|Vontobel Holding AG|

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout