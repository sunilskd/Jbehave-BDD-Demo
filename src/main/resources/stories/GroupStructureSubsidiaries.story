Epic: Group Structure

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list
JIRA ID - KYC-107 - KYC user can highlight legal entities by country in group structure list
JIRA ID - KYC-75 - KYC user can click link to another entity in group structure list

Meta:@groupstructuresubsidiaries @kyc @ubo

Scenario:
h. Entity on the list has a subsidiary it owns more than 50 percent, display that subsidiary entity indented below it in the list
i. Entity on the list has a subsidiary where it has null percent ownership, there is no other owner of that same subsidiary with null percent ownership or greater than 50 percent ownership, display that subsidiary entity in the list
j. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has null percent ownership, then do not display that subsidiary on the list
k. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has greater than 50 percent ownership, then do not display that subsidiary on the list
l. Multiple entities are at the same level of indentation in the list, then sort by percent ownership descending then alphabetically by legal title
m. If null percent ownership, do not display percent ownership for that relationship
n. If no country of operations for legal entity on list, do not display country of operations
o. If subsidiary relationship document is inactive, do not display the subsidiary entity on list
