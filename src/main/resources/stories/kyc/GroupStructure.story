Epic: Group Structure

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list

Scenario: KYC-41 User can view group structure list
a. Entity user is viewing is highlighted in the list
b. Entity user is viewing has at least one legal entity owner that is active, the ownership relationship is active, and the entity owns greater than 50 percent of the entity user is viewing, then display owning entity indented at a higher level in the list.
c. Entity user is viewing has at least one legal entity owner that is active, the ownership relationship is active, there is no entity that owns greater than 50 percent, and the entity has only one owner with null percent ownership, then display owning entity indented at a higher level in the list.
d. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership, or has zero or more than one owner that has null percent ownership, then that entity is at the top of the list
e. Entity on the list has at least one subsidiary it owns more than 50 percent, display that subsidiary entity indented below it in the list
f. Entity on the list has a subsidiary where it is the only owner of that entity to have null percent ownership, display that subsidiary entity in the list
g. Multiple entities are at the same level of indentation in the list, then sort by percent ownership descending then alphabetically by legal title
h. If null percent ownership, do not display percent ownership for that relationship
i. If no country of operations for legal entity on list, do not display country of operations
j. If legal entity owner or subsidiary is inactive, or the relationship document is inactive, do not display the entity on list