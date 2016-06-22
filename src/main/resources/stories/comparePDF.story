Meta:@comparepdfs

Narrative:
This story covers the steps for comparing actual and expected pdf's.
Below story clicks on save icon on owners summary page and captures actual pdf which is compared with exepected pdf present in pdf/expected folder.

Covers below features:
JIRA ID - KYC-67 - KYC user can save list of owners

Scenario: KYC User can save list of owners
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects a country <country> from the country highlight list in the owners page
And the user clicks on the save as pdf icon
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners page

Examples:
|fid|country|
|222566|Austria|

Scenario: KYC User can save list of subsidiaries
Meta:@kyc
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user clicks on the save as pdf icon
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiaries page

Examples:
|fid|country|
|1038|UK|

Scenario: KYC User can save list of group structure
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user selects a country <country> from the country highlight list in the group structure page
And the user clicks on the save as pdf icon
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure page

Examples:
|fid|country|
|1038|USA|



