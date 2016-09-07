Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Verify complete group structure
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the ultimate owner as QA Legal Entity 9 for the entity user is viewing in the group structure page
And the user should not see group structure in the group structure page

Examples:
|fid|
|LE-9|