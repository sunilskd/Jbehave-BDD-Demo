Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 - Interaction between percent filter and direct/indirect filter on all graphs
JIRA ID - KYC 265 - Interaction between filters and highlights on all graphs
JIRA ID - KYC-262 - Interaction between appears multiple highlight, country highlight and UBO highlight
JIRA ID - KYC-371 - Zoom on owners graph
JIRA ID - KYC-372 - Zoom on subsidiaries graph
JIRA ID - KYC-371 - Zoom on full graph

Meta:@ubointeractions @ubo

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Covers below scenarios for owners graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
   4. Country highlights drop down updates when percent filter applied
   5. Country highlights drop down updates when direct relationships only filter applied
   6. Country highlights drop down updates when direct relationships only filter and percent filter are applied
   7. If user applies percent or direct filter, any highlights previously applied (country,appears multiple, ubo) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs
And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|

And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK|

When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 9|
|QA Legal Entity 6|
|QA Legal Entity 10|

When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|

And the user should not see the entities highlighted in the graphs
When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below owners in level 2, above the root entity, in the graphs
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|

And the user should see the list of below owners in level 3, above the root entity, in the graphs
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Others9.52|

And the user should see the list of below owners in level 4, above the root entity, in the graphs
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|

And the user should see the list of below owners in level 5, above the root entity, in the graphs
|NODES|
|QA Legal Entity 6141.99|
|QA Test Person 15.93|
|QA Test Person 15.93|
|QA Test Person 251.93|
|Local Government,Legal Entity 61 owned...59.52|
|Local Government,Legal Entity 61 owned...59.52|
|Free float, LegalEntity 15 owned by...|

And the user should see the list of below owners in level 6, above the root entity, in the graphs
|NODES|
|QA Test Person 15.93|
|Local Government,Legal Entity 61 owned...59.52|

And the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK|
|USA|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance highlight on any node in the graphs
And the user should see the highlight removed from ultimate beneficial owners in the graph
And the user should see the ultimate beneficial owners filter checkbox unchecked in the graph

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

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
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

And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|

When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 2|
|QA Legal Entity 6|
|QA Legal Entity 1|
|QA Legal Entity 1|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.901Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should not see the entities highlighted in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|

When the user enters percentage as 50 in ownership percentage filter text box in the graphs
Then the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|India|
|Korea (Republic of)|
|UK|

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.901Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
|NODES|
|QA Legal Entity 3960.9Australia|
|QA Legal Entity 437.9Korea (Republic of)|
|QA Legal Entity 41Korea (Republic of)|
|QA Legal Entity 4070.9Korea (Republic of)|
|QA Legal Entity 42Korea (Republic of)|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the graphs
|NODES|
|QA Legal Entity 4571.91Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the graphs
|NODES|
|QA Legal Entity 4671.91|

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|

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
   7. If user applies percent or direct filter, any highlights previously applied (country, appears multiple, ubo) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
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

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
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

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|

When the user selects a country Australia from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|QA Legal Entity 33|
|QA Legal Entity 34|
|QA Legal Entity 35|

When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the graphs
|NODES|
|QA Legal Entity 945.53UK|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should not see the entities highlighted in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|India|
|Korea (Republic of)|
|UK|

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
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
|Others9.52|

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

And the user should see the list of below subsidiaries in level 4, below the root entity, in the graphs
|NODES|
|QA Legal Entity 4671.91|

And the user should see the list of below owners in level 5, above the root entity, in the graphs
|NODES|
|QA Legal Entity 6141.99|
|QA Test Person 15.93|
|QA Test Person 15.93|
|QA Test Person 251.93|
|Local Government,Legal Entity 61 owned...59.52|
|Local Government,Legal Entity 61 owned...59.52|
|Free float, LegalEntity 15 owned by...|

And the user should not see any nodes in level 5, below the root entity, in the graphs

And the user should see the list of below owners in level 6, above the root entity, in the graphs
|NODES|
|QA Test Person 15.93|
|Local Government,Legal Entity 61 owned...59.52|

And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|
|USA|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance highlight on any node in the graphs
And the user should see the highlight removed from ultimate beneficial owners in the graph
And the user should see the ultimate beneficial owners filter checkbox unchecked in the graph

Examples:
|fid|legalEntity|countValue|
|LE-6|QA Legal Entity 61|Appears: 3|

Scenario: Covers below scenarios for owners graph
a. 0. If user applied UBO highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches UBO highlight takes style of UBO highlight
   1. If user applied both UBO highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of UBO highlight
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 2|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|
|LE-6|QA Test Person 1|

Scenario: Covers below scenarios for owners graph
a. 0. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
   1. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight
Given the user is on the ubo login page
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

Scenario: Covers below scenarios for full graph
a. 0. If user applied UBO highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches UBO highlight takes style of UBO highlight
   1. If user applied both UBO highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of UBO highlight
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 2|

When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the ultimate beneficial owners highlighted in the graph
|NODES|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|

And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|
|LE-6|QA Test Person 1|

Scenario: Covers below scenarios for full graph
a. 0. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
   1. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight
Given the user is on the ubo login page
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

Scenario: Verify tool tip on ownsership graph
a. 0. User hovers cursor over "i" icon next to zoom slider. Display text "User your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move."
   1. User hovers cursor over "i" icon next to percent filter. Display text "Display ownership greater than or equal to the value shown. User slider or input to change the percentage."
   2. User hovers cursor over "i" icon next to country highlight. Display text "Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information."
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user hovers cursor over i icon next to zoom slider on the graphs
Then user should see the info 'Use your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move graphs' on the graphs
When the user hovers cursor over i icon next to percent filter on the graphs
Then user should see the info 'Display ownership greater than or equal to the value shown. User slider or input to change the percentage.' on the graphs
When the user hovers cursor over i icon next to country highlight on the graphs
Then user should see the info 'Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information.' on the graphs

Examples:
|fid|
|LE-6|


Scenario: Verify tool tip on subsidiaries graph
a. 0. User hovers cursor over "i" icon next to zoom slider. Display text "User your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move."
   1. User hovers cursor over "i" icon next to percent filter. Display text "Display ownership greater than or equal to the value shown. User slider or input to change the percentage."
   2. User hovers cursor over "i" icon next to country highlight. Display text "Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information."
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user hovers cursor over i icon next to zoom slider on the graphs
Then user should see the info 'Use your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move graphs' on the graphs
When the user hovers cursor over i icon next to percent filter on the graphs
Then user should see the info 'Display ownership greater than or equal to the value shown. User slider or input to change the percentage.' on the graphs
When the user hovers cursor over i icon next to country highlight on the graphs
Then user should see the info 'Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information.' on the graphs

Examples:
|fid|
|LE-6|


Scenario: Verify tool tip on full graph
a. 0. User hovers cursor over "i" icon next to zoom slider. Display text "User your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move."
   1. User hovers cursor over "i" icon next to percent filter. Display text "Display ownership greater than or equal to the value shown. User slider or input to change the percentage."
   2. User hovers cursor over "i" icon next to country highlight. Display text "Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information."
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user hovers cursor over i icon next to zoom slider on the graphs
Then user should see the info 'Use your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move graphs' on the graphs
When the user hovers cursor over i icon next to percent filter on the graphs
Then user should see the info 'Display ownership greater than or equal to the value shown. User slider or input to change the percentage.' on the graphs
When the user hovers cursor over i icon next to country highlight on the graphs
Then user should see the info 'Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information.' on the graphs

Examples:
|fid|
|LE-6|