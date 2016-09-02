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
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the indented list of subsidiaries for the ultimate owner that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|QA Legal Entity 4|Australia|51.53|

Examples:
|fid|
|LE-26|