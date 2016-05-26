Epic: Full Graph

UBO user has access to below entity types -
1. Legal Entities
2. People
3. Other entity types (non-person, non-entity)

UBO user does not have access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-79 - UBO user can view full graph


Scenario: UBO user views full graph
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity as owner on graph above the entity it owns.
b. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is inactive, do not display that entity as an owner on the graph
c. An entity on the graph (could be entity user is viewing) has owner that is a legal entity but the relationship is inactive, do not display that entity as an owner on the graph
d. Ownership relationship has percent ownership, display percent on owner's node on graph
e. Ownership relationship has null percent ownership, do not display percent ownership on owner node on graph
f. Entity (including entity user is viewing) appears in the same path in the owners portion of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
g. Entity on the graph (could be entity user is viewing or another subsidiary entity on graph) has at least one active relationship where it is the owner and the owned entity is also active, display owned entity as subsidiary on graph
h. Entity on the subsidiary portion of graph has an inactive relationship where it is the owner, then do not display owned entity on graph
i. Entity on the subsidiary portion of graph has an active relationship where it is the owner but the owned entity is inactive, then do not display owned entity on graph
j. Subsidiary relationship has percent ownership, display percent on subsidiary's node
l. Subsidiary relationship has null percent ownership, do not display a percent ownership on the subsidiary node
m. Entity (including entity user is viewing) appears in the same path in the subsidiary portion of the graph more than once, then stop traversing path after second appearance only displaying an entity a maximum of two times in one path
n. Entity user is viewing has owners but not subsidiaries, show the owners on the graph
o. Entity user is viewing has subsidiaries but not owners, show the subsidiaries on the graph
p. Entity user is viewing does not have owners or subsidiaries, display message "No known entities."