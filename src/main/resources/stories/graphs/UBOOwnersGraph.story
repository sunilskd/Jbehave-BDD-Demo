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
JIRA ID - KYC-49 - UBO user can view ownership graph with UBOs
JIRA ID - KYC-114 - UBO user can view non-person, non-entity owners on owners graph

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
   2. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
   3. Owner has percent ownership, display percent on owner's node on graph
   4. Owner has null percent ownership, do not display percent ownership on owner node on graph
   5. Entity user is viewing has free text ownership, do not display on the owners graph for UBO user
   6. Entity on owners graph has non-institution, non-person entity type owner and the relationship is active, display that owner on the graph
   7. non-institution, non-person entity type owner has percent ownership, display on the owner's node
   8. non-institution, non-person entity type owner has null percent ownership, do not display percent ownership on owner's node
   9. non-institution, non-person entity type owner has value for owner type and description, display owner type and description
   10. If non-institution, non-person entity type owner has a value for owner type but no value for description, only display owner type in node
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

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 14UK|
|QA Legal Entity 12UK|
|QA Legal Entity 1751.53USA|
|QA Legal Entity 1951.53USA|
|Others9.52|

And the user should see the list of below owners in level 4, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 1551.53USA|
|QA Legal Entity 1351.53UK|
|QA Legal Entity 614.99|
|QA Legal Entity 6114.99|

And the user should see the list of below owners in level 5, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 6141.99|
|QA Test Person 15.93|
|QA Test Person 15.93|
|QA Test Person 251.93|
|Local Government,Legal Entity 61 owned...59.52|
|Local Government,Legal Entity 61 owned...59.52|
|Free float, LegalEntity 15 owned by...|

And the user should see the list of below owners in level 6, above the root entity, in the owners graph
|NODES|
|QA Test Person 15.93|
|Local Government,Legal Entity 61 owned...59.52|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. 0. Entity user is viewing does not have any active relationships to owners, display message "No known entities."
   1. Entity user is viewing does not have any owners, display message "No known entities."
b. 0. If owner is type person but the relationship is inactive, do not display that person as owner on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see message displayed in place of graph explaining there are no owners

Examples:
|fid|
|LE-32|
|LE-F|

Scenario: Covers below scenarios
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
   1. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
   2. If entity on owners graph has non-institution, non-person entity type owner but the relationship is inactive, do not display that owner on the graph
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

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person 2|

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

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5951.99|
|QA Legal Entity 5520.23|
|Others, Legal Entity56 owned by Others9.52|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5730.99|

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
|QA Test Person 110.93|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Legal Entity 5151.23|
|QA Test Person 29.93|

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
|Free float32.5|
|Ruth de la Cour -Vontobel5.5|
|Others, ExecutiveMembers|

Examples:
|fid|
|11262|

Scenario: Covers below scenarios
a. 0. Entity user is viewing has owners that are type person and the relationship is active, display those owners on the graph
   1. Person owner has percent ownership, display percent on owner's node on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Test Person E49.23|
|QA Legal Entity B50.52|
|QA Test Person A45.52|
|QA Legal Entity C50.52|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Test Person B40.23|
|QA Test Person G50.222|
|QA Legal Entity D50.52|
|QA Test Person D49.23|
|QA Test Person G4.93|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person H49.23|
|QA Test Person G4.23|
|QA Test Person C50.52|

Examples:
|fid|
|LE-A|

Scenario: Person owner has null percent ownership, do not display percent ownership on owner node on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 30, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Test Person 2|

Examples:
|fid|
|LE-30|

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
|QA Legal Entity 14|
|QA Legal Entity 12|
|QA Legal Entity 17|
|QA Legal Entity 19|
|Others|
|QA Legal Entity 15|
|QA Legal Entity 13|
|QA Legal Entity 61|
|QA Legal Entity 61|
|QA Legal Entity 61|
|QA Test Person 1|
|QA Test Person 1|
|QA Test Person 2|
|Local Government, Legal Entity 61 owned by Local Government|
|Local Government, Legal Entity 61 owned by Local Government|
|Free float, Legal Entity 15 owned by Free float|
|QA Test Person 15.93|
|Local Government, Legal Entity 61 owned by Local Government|

Examples:
|fid|
|LE-6|

Scenario: Covers below scenarios
a. By default, percent filter is set to 0 for both input box and slider, all subsidiaries are displayed in the graph
b. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
c. If user enters 0 in input box, slider position automatically updates to match percent entered, all subsidiaries appear on the graph
d. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only subsidiaries that are owned by 100 percent appear on graph
e. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all subsidiaries are displayed in the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 25 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Test Person E49.23|
|QA Legal Entity B50.52|
|QA Test Person A45.52|
|QA Legal Entity C50.52|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Test Person B40.23|
|QA Test Person G50.222|
|QA Legal Entity D50.52|
|QA Test Person D49.23|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person H49.23|
|QA Test Person C50.52|

When the user enters percentage as 0 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Test Person B40.23|
|QA Test Person G50.222|
|QA Legal Entity D50.52|
|QA Test Person D49.23|
|QA Test Person G4.93|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person H49.23|
|QA Test Person G4.23|
|QA Test Person C50.52|

When the user enters percentage as 100 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph
And the user should not see any nodes in level 2, below the root entity, in the subsidiaries graph

When the user enters percentage as 200 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph
And the user should not see any nodes in level 2, below the root entity, in the subsidiaries graph

When the user enters percentage as abc in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph
And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Test Person B40.23|
|QA Test Person G50.222|
|QA Legal Entity D50.52|
|QA Test Person D49.23|
|QA Test Person G4.93|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person H49.23|
|QA Test Person G4.23|
|QA Test Person C50.52|

Examples:
|fid|
|LE-A|

Scenario: Covers below scenarios
a. If user moves slider to percent 1-100, null percent subsidiaries are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
b. If user moves slider to 0 percent, all subsidiaries appear on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the subsidiaries graph page

Then the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Legal Entity B50.52|
|QA Legal Entity C50.52|

Then the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Test Person G50.222|
|QA Legal Entity D50.52|

Then the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person C50.52|

Examples:
|fid|
|LE-A|

Scenario: User applies percent filter that results in no subsidiaries on the graph, only root node is left on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 51 in ownership percentage filter text box in the graph
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph

Examples:
|fid|
|LE-A|