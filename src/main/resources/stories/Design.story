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

Scenario: Highlight legal entities by country
a. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
b. "No country highlight" is default selection in country highlight drop-down
c. Select a country highlight, legal entities in the subsidiaries graph that have that country of operations are highlighted (including root node of graph if applicable)
d. Select "No country highlight", removes country highlight of legal entities
e. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button

Then country highlights should display with no country highlight option selected
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