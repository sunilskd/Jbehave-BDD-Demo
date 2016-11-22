Epic: Group Structure
----
.Overall Report

image:.groupstructure.GroupStructureSubsidiaries.stats.png[Group Structure Subsidiaries]
----

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list
JIRA ID - KYC-570 - Change name of group structure list to "Majority Ownership Group Structure"

Meta:@groupstructuresubsidiaries @kyc @ubo

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Scenario 1
.Description
----
h. Entity on the list has a subsidiary it owns more than 50 percent, display that subsidiary entity indented below it in the list
l. Multiple entities are at the same level of indentation in the list, then sort by percent ownership descending then alphabetically by legal title
m. If null percent ownership, do not display percent ownership for that relationship
----
image:GS-Sub-Scenario-1.png[Scenario 1]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 11 for the entity user is viewing in the group structure page

Then the user should see the indented list of subsidiaries for the focused institution QA Legal Entity 6 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 3|India|59.53|
|QA Legal Entity 5|Korea (Republic of)|50.53|
|QA Legal Entity 33|Australia||
|QA Legal Entity 35|Australia||

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 35 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 40|Korea (Republic of)|70.9045|
|QA Legal Entity 39|Australia|60.986|
|QA Legal Entity 41|Korea (Republic of)||
|QA Legal Entity 42|Korea (Republic of)||

And the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list

Examples:
|fid|
|LE-6|

Scenario: Scenario 2
.Description
----
i. Entity on the list has a subsidiary where it has null percent ownership, there is no other owner of that same subsidiary with null percent ownership or greater than 50 percent ownership, display that subsidiary entity in the list
----
image:GS-Sub-Scenario-2.png[Scenario 2]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 17 for the entity user is viewing in the group structure page

Then the user should see the indented list of subsidiaries for the focused institution QA Legal Entity 16 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 38|Australia||

Examples:
|fid|
|LE-16|

Scenario: Scenario 3
.Description
----
k. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has greater than 50 percent ownership, then do not display that subsidiary on the list
----
image:GS-Sub-Scenario-3.png[Scenario 3]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 49 for the entity user is viewing in the group structure page
Then the user should not see any subsidiaries for the legal entity QA Legal Entity 47 in the group structure page

Examples:
|fid|
|LE-47|

Scenario: Scenario 4
.Description
----
j. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has null percent ownership, then do not display that subsidiary on the list
----
image:GS-Sub-Scenario-4.png[Scenario 4]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 25 for the entity user is viewing in the group structure page
Then the user should not see any subsidiaries for the legal entity QA Legal Entity 24 in the group structure page

Examples:
|fid|
|LE-24|

Scenario: Scenario 5
.Description
----
n. If no country of operations for legal entity on list, do not display country of operations
o. If subsidiary relationship document is inactive, do not display the subsidiary entity on list and if there is another active subisidiary for the same owner with >50 percent ownership then display that subsidairy on the list
----
image:GS-Sub-Scenario-5.png[Scenario 5]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 43 for the entity user is viewing in the group structure page

Then the user should see the indented list of subsidiaries for the focused institution QA Legal Entity 45 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 46||71.91|

Examples:
|fid|
|LE-45|

Scenario: Scenario 6
.Description
----
p. If entity on the list has a subsidiary where it has null percent ownership, but there are another owner of that same subsidiary that has <50 percent ownership, then display that subsidiary on the list
----
image:GS-Sub-Scenario-6.png[Scenario 6]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 49 for the entity user is viewing in the group structure page
Then the user should see the indented list of subsidiaries for the ultimate owner that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 47|||

Examples:
|fid|
|LE-49|

Scenario: Scenario 7
.Description
----
q. Owner owns greater than 50 percent of subsidiary, but there is another relationship where the same owner entity is owned by the same subsidiary entity by more than 50 percent,
    then display the owner entity and subsidiary entity in the group structure list.
----
image:GS-Sub-Scenario-7.png[Scenario 7]
----
----
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 52 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 52, user is currently viewing, highlighted in the group structure page

Then the user should see the indented list of subsidiaries for the ultimate owner that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 51||51.23|
|QA Legal Entity 53|||

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 51 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 54|||

When the user clicks on the legal entity QA Legal Entity 51 in group structure page

Then the user should see the ultimate owner as QA Legal Entity 51 for the entity user is viewing in the group structure page
Then the user should see the legal entity QA Legal Entity 51, user is currently viewing, highlighted in the group structure page

Then the user should see the indented list of subsidiaries for the ultimate owner that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 52||51.23|
|QA Legal Entity 54|||

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 52 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 53|||

Examples:
|fid|
|LE-52|

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout