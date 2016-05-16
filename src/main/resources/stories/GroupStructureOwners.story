Epic: Group Structure

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list

Meta:@groupstructureowners @kyc @ubo

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Scenario 1
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list (could be entity user is viewing) has at least one legal entity owner that is active, the ownership relationship is active,
        and the entity owns greater than 50 percent of the entity user is viewing, then display owning entity indented at a higher level in the list.
----
image:GS-Own-Scenario-1.png[Scenario 1]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 11 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 1, user is currently viewing, highlighted in the group structure page

Then the user should see the majority owners for the focused institution QA Legal Entity 1 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 2|USA|50.53|

Then the user should see the majority owners for the institution QA Legal Entity 2 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 3|India|59.53|

Then the user should see the majority owners for the institution QA Legal Entity 3 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 6|UK||

Then the user should see the majority owners for the institution QA Legal Entity 6 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 10|UK|51.53|

Examples:
|fid|
|LE-1|

Scenario: Scenario 2
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list (could be entity user is viewing) has at least one legal entity owner that is active, the ownership relationship is active,
        there is no entity that owns greater than 50 percent, and the entity has only one owner with null percent ownership, then display owning entity indented at a higher level in the list.
----
image:GS-Own-Scenario-2.png[Scenario 2]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 11 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, highlighted in the group structure page

Then the user should see the majority owners for the focused institution QA Legal Entity 6 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 10|UK|51.53|

Examples:
|fid|
|LE-6|

Scenario: Scenario 3
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership and has more than one owner that has null percent ownership,
        then that entity is at the top of the list
----
image:GS-Own-Scenario-3.png[Scenario 3]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 11 for the entity user is viewing in the group structure page

Examples:
|fid|
|LE-11|

Scenario: Scenario 4
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership and has zero owners that have null percent ownership,
        then that entity is at the top of the list
   2. Entity displayed on list (could be entity user is viewing) has no owners, then that entity is at the top of the list
----
image:GS-Own-Scenario-4.png[Scenario 4]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 9 for the entity user is viewing in the group structure page
And the user should not see any majority owners for the legal entity QA Legal Entity 9 in the group structure page

Examples:
|fid|
|LE-9|

Scenario: Scenario 5
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list (could be entity user is viewing) has one owner that has greater than 50 percent ownership and more than 1 null percent ownership,
        then display owning entity indented at a higher level in the list.
----
image:GS-Own-Scenario-5.png[Scenario 5]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 21 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 8, user is currently viewing, highlighted in the group structure page

Then the user should see the majority owners for the focused institution QA Legal Entity 8 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 20|USA|51.53|

Examples:
|fid|
|LE-8|

Scenario: Scenario 6
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list has an inactive owner (relationship doc is inactive), do not display that owner
----
image:GS-Own-Scenario-6.png[Scenario 6]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 26 for the entity user is viewing in the group structure page
Then the user should see the indented list of subsidiaries for the ultimate owner that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 4|Australia|51.53|

Examples:
|fid|
|LE-26|

Scenario: Scenario 7
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list has an inactive owner with percentage greater than 50 and active owner greater than 50 then follow the active path and display owning entity indented at a higher level in the list.
----
image:GS-Own-Scenario-7.png[Scenario 7]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 30 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 23, user is currently viewing, highlighted in the group structure page

Then the user should see the majority owners for the focused institution QA Legal Entity 23 in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 29|India||

Examples:
|fid|
|LE-23|


Scenario: Scenario 8
.Description
----
a. 0. Entity user is viewing is highlighted in the list
   1. Entity displayed on list has an inactive owner with percentage greater than 50 and active owner less than 50 and only one active null percentage owner
        then follow the active path and display owning entity indented at a higher level in the list.
----
image:GS-Own-Scenario-8.png[Scenario 8]
----
----
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 30 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 29, user is currently viewing, highlighted in the group structure page

Examples:
|fid|
|LE-29|