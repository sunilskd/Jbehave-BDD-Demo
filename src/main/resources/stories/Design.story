Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: By Default checkbox for Direct relationship is not selected
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries graphs page
|COUNTRIES|
|No country highlight|
|Australia|
|India|
|Korea (Republic of)|
|UK|
|USA|

When the user selects a country <country> from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|
|QA Legal Entity 5|
|QA Legal Entity 43|
|QA Legal Entity 41|
|QA Legal Entity 40|
|QA Legal Entity 42|
|QA Legal Entity 45|

When the user selects another country <changecountry> from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|
|QA Legal Entity 2|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the subsidiaries graph page
Then the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page
|SUBSIDIARIES|

Examples:
|fid|country|changecountry|
|LE-6|Korea (Republic of)|USA|