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
JIRA ID - KYC-49 - UBO user can view ownership graph with UBOs

Scenario:UBO user views owners graph with UBOs
a. Entity user is viewing has owners that are type person and the relationship is active, display those owners on the graph
b. If owner is type person but the relationship is inactive, do not display that person as owner on the graph
c. Person owner has percent ownership, display percent on owner's node on graph
d. Person owner has null percent ownership, do not display percent ownership on owner node on graph
e. Entity user is viewing has free text ownership, do not display on the owners graph for UBO user