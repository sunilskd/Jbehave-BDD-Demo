Meta:@comparepdfs

Narrative:
This story covers the steps for comparing actual and expected pdf's.
Below story clicks on save icon on owners summary page and captures actual pdf which is compared with exepected pdf present in pdf/expected folder.

Covers below features:
JIRA ID - KYC-67 - KYC user can save list of owners
JIRA ID - KYC-358 - Display loading icon while generating saved pdf for lists
JIRA ID - KYC-36 - KYC user can save non-truncated owners graph
JIRA ID - KYC-81 - KYC user can save non-truncated full graph
JIRA ID - KYC-71 - KYC user can save non-truncated subsidiary graph

Scenario: KYC User can save list of owners
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners page

Examples:
|fid|country|
|12538|USA|

Scenario: KYC User can save list of subsidiaries
Meta:@kyc
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiaries page

Examples:
|fid|country|
|1038|USA|

Scenario: KYC User can save list of group structure
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user selects a country <country> from the country highlight list in the group structure page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure page

Examples:
|fid|country|
|1038|USA|

Scenario: KYC User can save graph of group structure
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user selects a country France from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
And the user clicks on <legalEntity> node which appears more than once in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure graph page

Examples:
|fid|legalEntity|
|334181|BPCE|

Scenario: KYC User can save graph of owners
Meta:@ubo
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user selects a country USA from the country highlight list in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners graph page

Examples:
|fid|
|1038|

Scenario: KYC User can save graph of subsidiaries
Meta:@ubo
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user enters percentage as 55 in ownership percentage filter text box in the graphs
And the user selects a country Australia from the country highlight list in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiarie graph page

Examples:
|fid|
|211|