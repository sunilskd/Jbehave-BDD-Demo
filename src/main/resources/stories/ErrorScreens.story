Epic: Ownership
----
.Overall Report

image:.ErrorScreens.stats.png
----

Covers below features:
JIRA ID - KYC-226 - Global 500 error message
JIRA ID - KYC-225 - 404 error message
JIRA ID - KYC-124 - KYC user can see a message if they didn't authenticate succesfully
JIRA ID - KYC-384 - Display page title "Access Denied" for the 401 error message

Meta:@errorscreen @kyc

Scenario: Below scenarios are covered
a. 0. User will see 404 error screen when an invalid fid is attempeted to retrieve
   1. Use can navigates to ba.com from 404 screen
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
Then the user should see 404 page not found error page
When the user clicks on Bankers Almanac Helpdesk link in error screen
Then user is taken to a URL http://www.bankersalmanac.com/addcon/ that opens in a new window

Examples:
|fid|
|abc|

Scenario: Below scenarios are covered
a. 0. User will see 500 error screen when application is down due to any reason
   1. Use can navigates to ba.com from 500 screen
When the application is down due to any reason
Then the user should see 500 unexpected server error page
When the user clicks on Bankers Almanac Helpdesk link in error screen
Then user is taken to a URL http://www.bankersalmanac.com/addcon/ that opens in a new window

Scenario: Show message "You are not authorized for this product" when user tries to log in and is not successfully authenticated on new module, valid session could not be created.
When user tries to log in and is not successfully authenticated on new module
Then the user should see 401 access denied error page

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout