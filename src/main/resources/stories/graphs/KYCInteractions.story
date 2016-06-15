Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 interaction between percent filter and direct/indirect filter on all graphs
JIRA ID - KYC 265 interaction between filters and highlights on all graphs

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

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 45 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|

And the user should not see any nodes in level 2, above the root entity, in the owners graph
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs

And the user should see the list of below owners in level 1, above the root entity, in the owners graphs
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
Then the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|

And the user should not see the entities highlighted in the graphs

When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see the list of below owners in level 1, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below owners in level 2, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

And the user should see the list of below owners in level 3, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

And the user should see the list of below owners in level 4, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|
|Top 20 shareholders,57.67; Others,...|

And the user should see the list of below owners in level 5, above the root entity, in the owners graphs
|NODES|
|QA Legal Entity 6141.99|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

And the user should see the list of below owners in level 6, above the root entity, in the owners graphs
|NODES|
|Top shareholdersowning less than 2,...|

And the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|UK|
|USA|

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

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 25 in ownership percentage filter text box in the graphs
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted in the graphs

And the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 3425.9Australia|
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
|QA Legal Entity 3425.9Australia|
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
|QA Legal Entity 3425.9Australia|
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
|QA Legal Entity 4571.9Korea (Republic of)|
|QA Legal Entity 150.52UK|
|QA Legal Entity 110.23UK|

And the user should see the list of below subsidiaries in level 4, below the root entity, in the graphs
|NODES|
|QA Legal Entity 4671.9|

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

Scenario: overs below scenarios for full graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
   4. Country highlights drop down updates when percent filter applied
   5. Country highlights drop down updates when direct relationships only filter applied
   6. Country highlights drop down updates when direct relationships only filter and percent filter are applied
   7. If user applies percent or direct filter, any highlights previously applied (country, appears multiple) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user enters percentage as 25 in ownership percentage filter text box in the graphs

Then the user should see the list of below subsidiaries in level 1, below the root entity, in the graphs
|NODES|
|QA Legal Entity 3425.9Australia|
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
|QA Legal Entity 3425.9Australia|
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
|QA Legal Entity 3425.9Australia|
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
|QA Legal Entity 4571.9Korea (Republic of)|
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
|QA Legal Entity 4671.9|

And the user should see the list of below owners in level 5, above the root entity, in the graphs
|NODES|
|QA Legal Entity 6141.99|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

And the user should see the list of below owners in level 6, above the root entity, in the graphs
|NODES|
|Top shareholdersowning less than 2,...|

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
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
And the user should not see the multiple appearance highlight on any node in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-6|QA Legal Entity 61|Appears: 3|


