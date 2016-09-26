Meta:@comparepdfsLive @live

Narrative:
This story covers the steps for comparing actual and expected pdf's.
Below story clicks on save icon on owners summary page and captures actual pdf which is compared with exepected pdf present in pdf/expected folder.

Covers below features:
JIRA ID - KYC-67 - KYC user can save list of owners
JIRA ID - KYC-358 - Display loading icon while generating saved pdf for lists
JIRA ID - KYC-36 - KYC user can save non-truncated owners graph
JIRA ID - KYC-81 - KYC user can save non-truncated full graph
JIRA ID - KYC-400 - KYC user can save truncated subsidiary graph

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: UBO User can save list of owners
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners page <nodeTitle>

Examples:
|fid|country|nodeTitle|
|12538|USA|HomeTown Bank National Association|

Scenario: UBO User can save list of subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiaries page <nodeTitle>

Examples:
|fid|country|nodeTitle|
|1038|USA|BOA|

Scenario: UBo User can save list of group structure
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user selects a country <country> from the country highlight list in the group structure page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure page <nodeTitle>

Examples:
|fid|country|nodeTitle|
|1038|USA|BOA|

Scenario: UBO User can save truncated graph of group structure
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user selects a country Brazil from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
And the user clicks on <legalEntity> node which appears more than once in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure graph page <nodeTitle>

Examples:
|fid|legalEntity|nodeTitle|
|217510|BPCE|BPCE|

Scenario: UBO User can save truncated graph of owners
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user selects a country USA from the country highlight list in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners graph page <nodeTitle>

Examples:
|fid|nodeTitle|
|1038|BOA|

Scenario: KYC-400 User can save truncated graph of subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user enters percentage as 55 in ownership percentage filter text box in the graphs
And the user selects a country Australia from the country highlight list in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiarie graph page <nodeTitle>

Examples:
|fid|nodeTitle|
|211|Australia and New Zealand Banking Group Limited|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page