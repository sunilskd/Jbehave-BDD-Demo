Epic: Ownership

Covers below features:
JIRA ID - KYC-226 - Global 500 error message
JIRA ID - KYC-225 - 404 error message


Meta:@errorscreen @kyc

Scenario: User will see 404 error screen when an invalid fid is attempeted to retrieve
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
Then the user should see 404 error screen

Examples:
|fid|
|abc|

Scenario: User will see 500 error screen when application is down due to any reason
When the application is down due to any reason
Then the user should see 500 error screen


