Epic - Ownership

KYC user can navigate to BA.com when viewing an entity on new platform

Covers below features:
JIRA ID - KYC-14 - KYC user can navigate to BA.com when viewing an entity on new platform

Meta:@integration
Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: BA.com and UBO Integration scenario
Meta:@integration
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
When the user clicks on view on bankers almanac
Then the user should be navigated to the full details of that entity on bankersalmanac page

Examples:
|fid|
|2|

Scenario: UBO user login
Meta:@integration
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: BA.com and UBO Integration scenario
Meta:@integration
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
When the user clicks on view on bankers almanac
Then the user should be navigated to the full details of that entity <fid> on bankersalmanac page

Examples:
|fid|
|2|