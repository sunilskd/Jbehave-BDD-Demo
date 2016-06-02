Epic: Ownership

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
A key part of this process is to find out if there are any owners of the bank they will potentially do business which are known to be risky or involved in criminal activities. The graph provides information about owners in a visual way so that it is easier to follow relationship paths.

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not have access to below entity types -
1. Person (UBOs)
2. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-112 - KYC user can view free text ownership on owners graph
JIRA ID - KYC-37 - KYC user can filter owners graph by percent ownership
JIRA ID - KYC-34 - KYC user can view owners graph
JIRA ID - KYC-138 - Owners Graph - Direct-Indirect filter
JIRA ID - KYC-105 - KYC user can highlight legal entities by country in ownership graph
JIRA ID - KYC-114 - UBO user can view non-person, non-entity owners on owners graph

Meta:@kycownersgraph @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
   1. Owner has percent ownership, display percent on owner's node on graph
   2. Owner has null percent ownership, do not display percent ownership on owner node on graph
   3. Entity has owners of type person, do not display on the graph for KYC user
   4. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
   5. Free text ownership does not exist for entity user is viewing, do not display free text on owners graph
   6. Entity on the graph has a non-institution, non-person owner, do not display that owner on the graph for KYC user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

And the user should see the list of below owners in level 4, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|
|Top 20 shareholders,57.67; Others,...|

And the user should see the list of below owners in level 5, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 6141.99|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

And the user should see the list of below owners in level 6, above the root entity, in the owners graph
|NODES|
|Top shareholdersowning less than 2,...|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. Entity user is viewing does not have any active relationships to owners, display message "No known entities."
b. Entity user is viewing does not have any owners, display message "No known entities."
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no owners

Examples:
|fid|
|LE-D|
|LE-32|

Scenario: Covers below scenarios
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
   1. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 23, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 2951.53India|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 322.53India|
|QA Legal Entity 30India|

Examples:
|fid|
|LE-23|

Scenario: Covers below scenarios
a. Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5630.23|
|Top shareholdersowning less than 2,...|

Then the user should not see any nodes in level 4, above the root entity, in the owners graph

Examples:
|fid|
|LE-56|

Scenario: To verify circular relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5251.23|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5151.23|

Examples:
|fid|
|LE-51|

Scenario: To verify owners graph when entity user is viewing is also an owner of the same entity
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity Vontobel Holding AG, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|Vontrust Family Holding12.5Switzerland|
|Vontobel Foundation10.9Switzerland|
|Pellegrinus Holding AG4.2Switzerland|
|Vontobel Holding AG2.5Switzerland|
|Kreditanstalt fur Wiederaufbau (KfW)0.5Germany|
|Dr Hans Vontobel,18.1; Ruth de la Cour...|

Examples:
|fid|
|11262|

Scenario: KYC-138 - Owners Graph - Direct-Indirect filter covers below scenarios
a. By Default checkbox for Direct relationship is not selected
b. If no owners are present, filter is still available
c. If there are no owners beyond level 1 direct relationships, filter is still available
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user verifies direct relationship checkbox is not checked on graph

Examples:
|fid|
|LE-6|
|LE-55|
|LE-61|

Scenario: Covers below scenarios
a. 0. User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph)
   1. User un-checks "Direct Relationships Only" box, then graph updates to show all owners in any level
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship checkbox on graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Then the user should not see any nodes in level 2, above the root entity, in the owners graph
When the user unchecks direct relationship checkbox on graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|

Examples:
|fid|
|LE-6|

Scenario: User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph) including free text
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship checkbox on graph
Then the user should see the legal entity QA Legal Entity 61, user is currently viewing, as the root in the owners graph
And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|Top shareholdersowning less than 2,...|

Then the user should not see any nodes in level 2, above the root entity, in the owners graph

Examples:
|fid|
|LE-61|

Scenario: Verify tool tip displays legal title in graphs
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

Then the user should see the legal title displayed in the nodes when the user hovers over it in the graphs
|LEGAL TITLE|
|QA Legal Entity 6|
|QA Legal Entity 9|
|QA Legal Entity 10|
|QA Legal Entity 16|
|QA Legal Entity 18|
|QA Legal Entity 11|
|Treasury shares, 3.8; Trade Union Federations of SGB (where no federation owns 3 or more), 4.8; Others, 23.4|
|QA Legal Entity 14|
|QA Legal Entity 12|
|QA Legal Entity 17|
|QA Legal Entity 19|
|Other shareholders owning less than 2, 71.315|
|QA Legal Entity 15|
|QA Legal Entity 13|
|QA Legal Entity 61|
|QA Legal Entity 61|
|Top 20 shareholders, 57.67; Others, 42.33. There were no persons with a substantial shareholding in the Bank|
|QA Legal Entity 61|
|Top shareholders owning less than 2, 71.315|
|Top shareholders owning less than 2, 71.315|
|Top shareholders owning less than 2, 71.315|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. "No country highlight" is default selection in country highlight drop-down
   1. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   2. Select a country highlight, legal entities in the owners graph that have that country of operations are highlighted (including root node of graph if applicable)
   3. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   4. Select "No country highlight", removes country highlight of legal entities
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

Then the user should see no country highlight selected by default in country highlight drop-down in the owners graph page
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the owners graphs page
|COUNTRIES|
|No country highlight|
|UK|
|USA|

When the user selects a country UK from the country highlight list in the owners graph page
Then the user should see the below owners in the owners graph that have the selected country of operations highlighted in the owners graph page
|NODES|
|QA Legal Entity 6|
|QA Legal Entity 10|
|QA Legal Entity 9|
|QA Legal Entity 11|
|QA Legal Entity 12|
|QA Legal Entity 14|
|QA Legal Entity 13|

When the user selects a country USA from the country highlight list in the owners graph page
Then the user should see the below owners in the owners graph that have the selected country of operations highlighted in the owners graph page
|NODES|
|QA Legal Entity 16|
|QA Legal Entity 18|
|QA Legal Entity 17|
|QA Legal Entity 19|
|QA Legal Entity 15|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the owners graph page
Then the user should not see the nodes highlighted in the graph page

Examples:
|fid|
|LE-6|

Scenario: Country list is not displayed when No known entities
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see no country highlight selected by default in country highlight drop-down in the owners graph page
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the owners graphs page
|COUNTRIES|
|No country highlight|
And the user verifies no other country names are listed in dropdown

Examples:
|fid|
|1|

Scenario: Free text ownership always remains visible on graph despite any filter applied
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 25 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 10, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 1151.53UK|
|Treasury shares, 3.8;Trade Union...|

Examples:
|fid|
|LE-10|

Scenario: Covers below scenarios
a. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
b. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graph
c. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graph
d. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only owners that are owned by 100 percent appear on graph
e. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all owners are displayed in the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 1 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 945.53UK|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholdersowning less than 2,...|

And the user should see the list of below owners in level 4, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|
|Top 20 shareholders,57.67; Others,...|

And the user should see the list of below owners in level 5, above the root entity, in the owners graph
|NODES|
|Top shareholdersowning less than 2,...|
|Top shareholdersowning less than 2,...|

When the user enters percentage as 100 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should not see any nodes in level 2, above the root entity, in the owners graph

When the user enters percentage as 200 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should not see any nodes in level 2, above the root entity, in the owners graph

When the user enters percentage as abc in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should see the list of below owners in level 6, above the root entity, in the owners graph

|NODES|
|Top shareholdersowning less than 2,...|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. If user moves slider to percent 1-100, null percent owners are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only owners that are owned by equal to or greater than selected percent appear on the graph
b. If user moves slider to 0 percent, all owners appear on graph
c. User applies percent filter that results in no owners on the graph, only root node is left on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should not see any nodes in level 2, above the root entity, in the owners graph

Examples:
|fid|
|LE-6|


Scenario: KYC -33 Visual indentifier must not be displayed when free text appears multiple times on the graph

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user verifies visual indicator is not displayed for free text ownership when appeared multiple time<freeTextValue>

Examples:
|fid|nonEntityValue|
|LE-6|Top shareholders owning less than 2%, 71.315 %|

