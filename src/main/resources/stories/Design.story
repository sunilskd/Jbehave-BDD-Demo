Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

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

Examples:
|fid|
|LE-6|