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

Scenario: KYC user views free text ownership on owners graph
a. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
b. Free text ownership does not exist for entity user is viewing, do not display free text on owners graph