Epic - Ownership
----
.Overall Report

image:.others.HeaderAndFooter.stats.png[Header And Footer]
----

Footer displays all the links requred to navigate to view information related to RBI,RELX,Accuity. Also the footer has logs and copyrights information.

Covers below features:
JIRA ID - KYC-160 - KYC user can view footer information
JIRA ID - KYC-414 - User can click link to print help
JIRA ID - KYC-424 - Rebranding
JIRA ID - KYC-436 - change name of app on browser tab to "Bankers Almanac Ownership Module"

Meta:@headerandfooter
Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: UBO user can view footer and can navigate to respective links from group structure summary page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the ownership tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
When the user clicks on the group structure tab
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from owners summary page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the ownership tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
When the user clicks on the owners tab
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from subsidiaries summary page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the ownership tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
When the user clicks on the subsidiaries tab
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from group structure graph page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the ownership tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
When the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from owners graph page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the ownership tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
When the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from subsidiaries graph page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the ownership tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
When the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: UBO user can view footer and can navigate to respective links from entity details page

Meta:@footer @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
Then the user should see name of the app on browser tab as Bankers Almanac Ownership Module
When the user clicks on the entity details tab
Then the user should see the bankers almanac logo in top left corner
And the user should see the ownership module next to bankers almanac logo in top left corner
When the user clicks on the Print Help link in the header section
Then user should see the instructions to print from web browser open in new tab
Then the user should see the copyright notice: © Reed Business Information Limited (year)
When the user clicks on Contact Us link in footer section
Then user is taken to a URL https://accuity.com/support/ that opens in a new window
When the user clicks on Help link in footer section
Then user is taken to a URL http://www.bankersalmanac.com/addcon/help/default.aspx that opens in a new window
When the user clicks on Portfolio link in footer section
Then user is taken to a URL https://accuity.com/ that opens in a new window
When the user clicks on About Us link in footer section
Then user is taken to a URL https://accuity.com/about-accuity/ that opens in a new window
When the user clicks on Terms & Conditions link in footer section
Then user is taken to a URL https://accuity.com/terms-and-conditions/ that opens in a new window
When the user clicks on Privacy Policy link in footer section
Then user is taken to a URL https://accuity.com/privacy-policy/ that opens in a new window
When the user clicks on Disclaimer link in footer section
Then user is taken to a URL https://accuity.com/disclaimer/ that opens in a new window
When the user clicks on Editorial Policy link in footer section
Then user is taken to a URL https://accuity.com/editorial-policy/ that opens in a new window
When the user clicks on the logo logo-relx in footers section
Then user is taken to a URL http://www.relx.com/Pages/Home.aspx that opens in a new window
When the user clicks on the logo logo-accuity in footers section
Then user is taken to a URL https://accuity.com/ that opens in a new window

Examples:
|fid|
|211|

Scenario: Verify print help page instruction
Given the user is on the ubo print help page
Then user should see the instructions to print from web browser

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout