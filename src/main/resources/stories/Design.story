Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

Examples:
|fid|
|LE-6|