Epic: Full Graph

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not have access to below entity types -
1. Person (UBOs)
2. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-79 - UBO user can view full graph

Scenario: KYC user views full graph
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity as owner on graph above the entity it owns.
b. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
c. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
d. Ownership relationship has percent ownership, display percent on owner's node on graph
e. Ownership relationship has null percent ownership, do not display percent ownership on owner node on graph
f. Entity (including entity user is viewing) appears in the same path in the owners portion of graph as owner more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
g. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
h. Free text ownership does not exist for entity user is viewing, do not display free text as owner on full graph
i. Entity on the graph (could be entity user is viewing or another subsidiary entity on graph) has at least one active relationship where it is the owner and the owned entity is also active, display owned entity as subsidiary on graph and display percent ownership on subsidiary
j. Entity on the subsidiary portion of graph has an inactive relationship where it is the owner, then do not display owned entity on graph
k. Entity on the subsidiary portion of graph has an active relationship where it is the owner but the owned entity is inactive, then do not display owned entity on graph
l. Subsidiary relationship has percent ownership, display percent ownership on the subsidiary node
m. Subsidiary relationship has null percent ownership, do not display a percent ownership on the subsidiary node
n. Entity (including entity user is viewing) appears in the same path in the subsidiary portion of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
o. Entity user is viewing has owners but not subsidiaries, show the owners on the graph
p. Entity user is viewing has subsidiaries but not owners, show the subsidiaries on the graph
q. Entity user is viewing does not have owners or subsidiaries, display message "No known entities."