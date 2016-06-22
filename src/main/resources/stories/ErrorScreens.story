Epic: Ownership

Covers below features:
JIRA ID - KYC-226 - Global 500 error message
JIRA ID - KYC-225 - 404 error message

Meta:@errorscreen @kyc

Scenario: Below scenarios are covered
a. 0. User will see 404 error screen when an invalid fid is attempeted to retrieve
   1. Use can navigates to ba.com from 404 screen
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
Then the user should see 404 error screen
When the user clicks on Bankers Almanac Helpdesk link in error screen
Then user is taken to a URL http://www.bankersalmanac.com/addcon/ that opens in a new window

Examples:
|fid|
|abc|

Scenario: Below scenarios are covered
a. 0. User will see 500 error screen when application is down due to any reason
   1. Use can navigates to ba.com from 500 screen
When the application is down due to any reason
Then the user should see 500 error screen
When the user clicks on Bankers Almanac Helpdesk link in error screen
Then user is taken to a URL http://www.bankersalmanac.com/addcon/ that opens in a new window

