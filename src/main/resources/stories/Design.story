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

Scenario:No legal entities in list have country of operations, then no countries are available as highlight option.
a.User applies a filter by percent ownership that results in no legal entities in list or no legal entities that have a country of operations, then no countries populate the available highlight options
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should not see any country in country highlights list

Examples:
|fid|percentFilter|
|173|50|
