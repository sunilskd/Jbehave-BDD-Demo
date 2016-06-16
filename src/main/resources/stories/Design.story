Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios for owners graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
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

And the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs

Examples:
|fid|legalEntity|countValue|
|LE-6|QA Legal Entity 61|Appears: 3|

