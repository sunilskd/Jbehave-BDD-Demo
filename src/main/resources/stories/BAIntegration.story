Epic - Ownership

KYC user can navigate to BA.com when viewing an entity on new platform

Covers below features:
JIRA ID - KYC-14 - KYC user can navigate to BA.com when viewing an entity on new platform
JIRA ID - KYC-111 - UBO user can follow a link to the UBO declaration document from the UBO list

Meta:@baintegration
Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: BA.com and UBO Integration scenario
Meta:@baintegration
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on view on bankers almanac
Then the user should be navigated to the full details of that entity <fid> on bankersalmanac page

Examples:
|fid|
|2|

Scenario: UBO user login
Meta:@baintegration
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: BA.com and UBO Integration scenario
Meta:@baintegration
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on view on bankers almanac
Then the user should be navigated to the full details of that entity <fid> on bankersalmanac page

Examples:
|fid|
|2|

Scenario: UBO user login
Meta:@baintegration
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Covers below scenarios
a. 0. User clicks UBO Declaration Document link for an entity where UBOs exists
   1. User clicks UBO Declaration Document link for an entity where UBOs doesnot exists
Meta:@baintegration
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
When the user clicks on UBO Declaration Document
Then the user should be navigated to the ubo section of that entity <fid> on bankersalmanac page

Examples:
|fid|
|721|
|211|