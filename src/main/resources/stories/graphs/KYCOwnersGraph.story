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
JIRA ID - KYC-34 - KYC user can view owners graph

Scenario: KYC user views owners graph
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
b. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
c. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
d. Owner has percent ownership, display percent on owner's node on graph
e. Owner has null percent ownership, do not display percent ownership on owner node on graph
f. Entity (including entity user is viewing) appears in the same path of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
g. Entity user is viewing does not have any active relationships to owners, display message "No known entities."
h. Entity user is viewing does not have any owners, display message "No known entities."
i. Entity has owners of type person, do not display on the graph for KYC user