Epic: UBO

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).

UBO user has access to below entity types -
1. Legal Entities
2. People
3. Other entity types (non-person, non-entity)

UBO user does not have access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-37 - KYC user can filter owners graph by percent ownership
JIRA ID - KYC-138 - Owners Graph - Direct-Indirect filter

Meta:@uboownersgraph @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

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
Then the user clicks on direct relationship checkbox on graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Then the user unchecks direct relationship checkbox on graph
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
And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 1951.53USA|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 12UK|
|QA Legal Entity 14UK|
And the user should see the list of below owners in level 4, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 574.99|
|QA Legal Entity 5714.99|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 1551.53USA|
And the user should see the list of below owners in level 5, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5630.23|
|QA Test Person 15.93|
|QA Legal Entity 5630.23|
|QA Test Person 15.93|
|QA Legal Entity 5741.99|
|QA Test Person 251.93|
And the user should see the list of below owners in level 6, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5520.23|
|QA Legal Entity 5951.99|
|QA Legal Entity 5520.23|
|QA Legal Entity 5951.99|
|QA Legal Entity 5630.23|
|QA Legal Entity 15.93|
And the user should see the list of below owners in level 7, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5730.99|
|QA Legal Entity 5730.99|
|QA Legal Entity 5520.23|
|QA Legal Entity 5951.99|
And the user should see the list of below owners in level 8, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5730.99|

Examples:
|fid|
|LE-6|