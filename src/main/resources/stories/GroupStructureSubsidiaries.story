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


Scenario: Scenario 1
h. 0. Entity on the list has a subsidiary it owns more than 50 percent, display that subsidiary entity indented below it in the list
l. Multiple entities are at the same level of indentation in the list, then sort by percent ownership descending then alphabetically by legal title
m. If null percent ownership, do not display percent ownership for that relationship
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the indented list of subsidiaries for the focused institution QA Legal Entity 6 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 3|India|59.53|
|QA Legal Entity 5|Korea (Republic of)|50.53|
|QA Legal Entity 33|Australia||
|QA Legal Entity 35|Australia||

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 35 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 40|Korea (Republic of)|70.9|
|QA Legal Entity 39|Australia|60.9|
|QA Legal Entity 41|Korea (Republic of)||
|QA Legal Entity 42|Korea (Republic of)||

And the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list

Examples:
|fid|
|LE-6|

Scenario: Scenario 2
i. Entity on the list has a subsidiary where it has null percent ownership, there is no other owner of that same subsidiary with null percent ownership or greater than 50 percent ownership, display that subsidiary entity in the list

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 16 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 38|Australia||

Examples:
|fid|
|LE-16|

Scenario: Scenario 3
k. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has greater than 50 percent ownership, then do not display that subsidiary on the list

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 47 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
||||

Examples:
|fid|
|LE-47|

Scenario: Scenario 4
j. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has null percent ownership, then do not display that subsidiary on the list

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 24 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
||||

Examples:
|fid|
|LE-24|

Scenario: Scenario 5
n. If no country of operations for legal entity on list, do not display country of operations
o. If subsidiary relationship document is inactive, do not display the subsidiary entity on list and if there is another active subisidiary for the same owner with >50 percent ownership then display that subsidairy on the list

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 45 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 46||71.9|

Examples:
|fid|
|LE-45|

Scenario: Scenario 6
p. If entity on the list has a subsidiary where it has null percent ownership, but there are another owner of that same subsidiary that has <50 percent ownership, then display that subsidiary on the list

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the indented list of subsidiaries for the institution QA Legal Entity 49 that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 47|||

Examples:
|fid|
|LE-49|