Epic - Ownership

Audit trail will show actions that Accuity has taken to update the ownership information displayed so that a KYC analyst is confident the data we display is up-to-date.

Covers below features:
JIRA ID - KYC-118 - KYC user can view audit trail for ownership information collection

Meta:@footer
Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: KYC user can view footer and can navigate to respective links

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
Then the user should see footer information with links to contact us, help, portfolio, about us, terms and conditions, privacy policy, disclaimer, editorial policy, rbi and relx logos, copy rights label
When the user clicks on Contact Us link in footer section
Then user is taken to a URL http://www.accuity.com/customer-support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL http://www.accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL http://www.accuity.com/about-us/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL http://www.accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL http://www.accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL http://www.accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL http://www.accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.reedbusiness.com/ that opens in a new window


Examples:
|fid|
|3|