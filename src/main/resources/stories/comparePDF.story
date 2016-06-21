Meta:@comparepdfs

Narrative:
This story covers the steps for comparing actual and expected pdf's.
Below story clicks on save icon on owners summary page and captures actual pdf which is compared with exepected pdf present in pdf/expected folder.

Covers below features:
JIRA ID - KYC-67 - KYC user can save list of owners

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC-67 KYC User can save list of owners
Meta:@kyc
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects the percent filter option <percentFilter> in the owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user clicks on the save as pdf icon
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners page

Examples:
|fid|percentFilter|country|
|LE-6|25|UK|

Scenario: KYC-67 KYC User can save list of owners
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects the percent filter option <percentFilter> in the owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user clicks on the save as pdf icon
Then the UBO user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners page

Examples:
|fid|percentFilter|country|
|LE-6|10|UK|

