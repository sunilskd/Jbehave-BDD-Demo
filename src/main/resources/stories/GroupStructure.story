Epic: Group Structure

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list

Scenario: KYC-41 User can view group structure list
a. Entity user is viewing is highlighted in the list
b. Entity displayed on list (could be entity user is viewing) has at least one legal entity owner that is active, the ownership relationship is active, and the entity owns greater than 50 percent of the entity user is viewing, then display owning entity indented at a higher level in the list.
c. Entity displayed on list (could be entity user is viewing) has at least one legal entity owner that is active, the ownership relationship is active, there is no entity that owns greater than 50 percent, and the entity has only one owner with null percent ownership, then display owning entity indented at a higher level in the list.
d. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership and has zero owners that have null percent ownership, then that entity is at the top of the list
e. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership and has more than one owner that has null percent ownership, then that entity is at the top of the list
f. Entity displayed on list (could be entity user is viewing) has no owners, then that entity is at the top of the list
g. Entity displayed on list has an inactive owner (relationship doc is inactive), do not display that owner
h. Entity on the list has a subsidiary it owns more than 50 percent, display that subsidiary entity indented below it in the list
i. Entity on the list has a subsidiary where it has null percent ownership, there is no other owner of that same subsidiary with null percent ownership or greater than 50 percent ownership, display that subsidiary entity in the list
j. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has null percent ownership, then do not display that subsidiary on the list
k. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has greater than 50 percent ownership, then do not display that subsidiary on the list
l. Multiple entities are at the same level of indentation in the list, then sort by percent ownership descending then alphabetically by legal title
m. If null percent ownership, do not display percent ownership for that relationship
n. If no country of operations for legal entity on list, do not display country of operations
o. If subsidiary relationship document is inactive, do not display the subsidiary entity on list

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Baisc AFT steps
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the majority owner for the institution BOA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|

And the user should see the indented list of subsidiaries for the institution BOA that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|

When the user clicks on the legal entity BOA in group structure page

Then the user should see the majority owner for the institution BOA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|

And the user should see the indented list of subsidiaries for the institution BOA that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|

And the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list

Examples:
|fid|
|1038|