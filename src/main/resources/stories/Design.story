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
And the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to 40 in the subsidiaries graph page

Examples:
|fid|
|LE-6|