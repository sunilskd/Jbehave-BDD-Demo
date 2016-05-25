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
JIRA ID - KYC-137 - Sub Graph - Direct-Indirect filter

Scenario: Filter owners graph by percent ownership
a. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
b. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, null percent owners are filtered out and not displayed on the graph, only owners with equal to or greater than selected percent ownership appear on the graph
c. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graph
d. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only owners with 100 percent appear on graph
e. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all owners are displayed in the graph
f. If user moves slider to percent 1-100, null percent owners are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only owners with equal to or greater than selected percent appear on the graph
g. If user moves slider to 0 percent, all owners appear on graph
h. User applies percent filter that results in no owners on the graph, only root node is left on the graph


Scenario: KYC-137 - Sub Graph - Direct-Indirect filter
a. By default, "Direct Relationships Only" is not selected
b. User selects "Direct Relationships Only", then graph updates to only show direct subsidiaries (level 1 of graph)
c. User un-checks "Direct Relationships Only" box, then graph updates to show all subsidiaries in any level
d. If no subsidiaries are present, filter is still available
e. If there are no subsidiaries beyond level 1 direct relationships, filter is still available

Scenario:By Default checkbox for Direct relationship is not selected
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user verifies direct relationship checkbox is not checked

Examples:
|fid|
|LE-6|

Scenario: User selects "Direct Relationships Only", then graph updates to only show direct subsidiaries (level 1 of graph)
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user clicks on direct relationship checkbox
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph
And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|OWNERS|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

Then the user unchecks direct relationship checkbox
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|OWNERS|
|QA Legal Entity 945.53UK|
|QA Legal Entity 10UK|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|OWNERS|
|QA Legal Entity 161.53USA|
|QA Legal Entity 181.53USA|
|QA Legal Entity 1151.53UK|


Examples:
|fid|
|LE-6|