Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: Compare entity details snapshots
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the actual snapshot for the <nodeTitle> entity details page
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> entity details page

Examples:
|fid|nodeTitle|
|58285|Berlin Hyp AG|