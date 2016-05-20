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
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user selects a country <country> from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|
|QA Legal Entity 33|
|QA Legal Entity 34|
|QA Legal Entity 35|
|QA Legal Entity 39|

When the user selects another country <changecountry> from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|
|QA Legal Entity 2|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|

Examples:
|fid|country|changecountry|
|LE-6|Australia|USA|