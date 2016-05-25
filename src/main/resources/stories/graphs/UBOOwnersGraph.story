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
JIRA ID - KYC-34 - KYC user can view owners graph

Scenario: Filter owners graph by percent ownership
a. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
b. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, null percent owners are filtered out and not displayed on the graph, only owners with equal to or greater than selected percent ownership appear on the graph
c. If user enters 0 in input box, slider position automatically updates to match percent entered, all owners appear on the graph
d. If user enters number greater than 100 in input box, input box automatically updates to display 100, slider bar automatically moves to 100, only owners with 100 percent appear on graph
e. If user enters a character than is not a number in the input box, input box automatically updates to display 0, slider bar automatically moves to 0, all owners are displayed in the graph
f. If user moves slider to percent 1-100, null percent owners are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only owners with equal to or greater than selected percent appear on the graph
g. If user moves slider to 0 percent, all owners appear on graph
h. User applies percent filter that results in no owners on the graph, only root node is left on the graph
=======


Scenario: UBO user views owners graph
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
b. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
c. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
d. Owner has percent ownership, display percent on owner's node on graph
e. Owner has null percent ownership, do not display percent ownership on owner node on graph
f. Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
g. Entity user is viewing does not have any active relationships to owners, display message "No known entities."
h. Entity user is viewing does not have any owners, display message "No known entities."

