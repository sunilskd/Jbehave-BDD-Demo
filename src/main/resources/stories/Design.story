Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: UBO user can view footer and can navigate to respective links from subsidiaries graph page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the copyright notice: © Reed Business Information Limited (year)
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
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-rbi in footers section
Then user is taken to a URL http://www.reedbusiness.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from entity details page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the copyright notice: © Reed Business Information Limited (year)
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
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-rbi in footers section
Then user is taken to a URL http://www.reedbusiness.com/ that opens in a new window

Examples:
|fid|
|211|