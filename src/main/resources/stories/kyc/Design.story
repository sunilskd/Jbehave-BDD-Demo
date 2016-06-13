Meta:@design

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: scenario2
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page

Examples:
|fid|
|1038|

Scenario: scenario3
GivenStorie : F:/workspace/kyc-automated-functional-test/src/main/resources/stories/Login.story
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
Then the user should see a message thats says no audit information is available

