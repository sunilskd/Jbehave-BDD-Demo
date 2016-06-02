Meta:@fullgraph

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: scenario description
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button

Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the full graph

And the user should see the list of below owners in level 1, above the root entity, in the full graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below subsidiaries in level 1, below the root entity, in the full graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see no country highlight selected by default in country highlight drop-down in the full graph page
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the full graphs page
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|
|USA|

When the user selects a country UK from the country highlight list in the full graph page
Then the user should see the below nodes in the full graph that have the selected country of operations highlighted in the full graph page
|NODES|
|QA Legal Entity 2|
|QA Legal Entity 6|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 1|
|QA Legal Entity 6|
|QA Legal Entity 10|
|QA Legal Entity 9|
|QA Legal Entity 11|
|QA Legal Entity 12|
|QA Legal Entity 14|
|QA Legal Entity 13|

When the user selects another country India from the country highlight list in the full graph page
Then the user should see the below nodes in the full graph that have the selected country of operations highlighted in the full graph page
|NODES|
|QA Legal Entity 3|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the full graph page
Then the user should not see the nodes highlighted in the graph page
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 25 in ownership percentage filter text box in the graph

Then the user should see the list of below subsidiaries in level 1, below the root entity, in the full graph
|NODES|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the full graph
|NODES|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53UK|

And the user should see the list of below owners in level 1, above the root entity, in the full graph
|NODES|
|QA Legal Entity 945.53UK|

When the user enters percentage as 100 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the full graph
And the user should not see any nodes in level 2, above the root entity, in the owners graph

When the user enters percentage as 200 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the full graph
And the user should not see any nodes in level 2, above the root entity, in the owners graph

When the user enters percentage as abc in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the full graph

And the user should see the list of below owners in level 6, above the root entity, in the full graph
|NODES|
|Top shareholdersowning less than 2,...|

When the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the full graph
And the user should not see any nodes in level 2, above the root entity, in the full graph
Then the user verifies direct relationship checkbox is not checked on graph
When the user clicks on direct relationship checkbox on graph

Then the user should see the list of below subsidiaries in level 1, below the root entity, in the full graph
|NODES|
|QA Legal Entity 35Australia|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 33Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below owners in level 1, above the root entity, in the full graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Examples:
|fid|
|LE-6|