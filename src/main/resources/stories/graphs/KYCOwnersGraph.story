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
JIRA ID - KYC-37 - KYC user can filter owners graph by percent ownership
JIRA ID - KYC-34 - KYC user can view owners graph
JIRA ID - KYC-138 - Owners Graph - Direct-Indirect filter

Meta:@kycownersgraph @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
b. Owner has percent ownership, display percent on owner's node on graph
c. Owner has null percent ownership, do not display percent ownership on owner node on graph
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
|Treasury shares, 3.8%; Trade Union Federations of SGB (where no federation owns 3% or more), 4.8%; Others, 23.4%|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Other shareholders owning less than 2%, 71.315 %|

And the user should see the list of below owners in level 4, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 5714.99|
|QA Legal Entity 574.99|
|Top 20 shareholders, 57.67%; Others, 42.33%. There were no persons with a substantial shareholding in the Bank|

And the user should see the list of below owners in level 5, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5741.99|
|QA Legal Entity 5630.23|
|QA Legal Entity 5630.23|
|Top shareholders owning less than 2%, 71.315 %|
|Top shareholders owning less than 2%, 71.315 %|

And the user should see the list of below owners in level 6, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5630.23|
|QA Legal Entity 5951.99|
|QA Legal Entity 5520.23|
|QA Legal Entity 5951.99|
|QA Legal Entity 5520.23|
|Top shareholders owning less than 2%, 71.315 %|

And the user should see the list of below owners in level 7, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5951.99|
|QA Legal Entity 5520.23|
|QA Legal Entity 5730.99|
|QA Legal Entity 5730.99|

And the user should see the list of below owners in level 8, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5730.99|

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
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
b. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
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
b. Entity has owners of type person, do not display on the graph for KYC user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 56, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5630.23|

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


Scenario: To verify circular relationship
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
|Dr Hans Vontobel, 18.1%; Ruth de la Cour - Vontobel, 5.5%; Vontrust AG (Holding of the Vontobel family shareholders), 12.5%; Other shares of family shareholders, 0.5%; Vontobel Foundation, 10.9%; Pellegrinus Holding AG, 4.2%; Vontobel Holding AG, 2.5%; Executive Members, 0.8%; Publicly Traded, 32.5%|

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