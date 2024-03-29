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
Then the user should be able to save the file <fid> including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the owners page

Examples:
|fid|country|
|12538|USA|

Scenario: UBO User can save list of subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file <fid> including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiaries page

Examples:
|fid|country|
|1038|USA|

Scenario: UBo User can save list of group structure
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user selects a country <country> from the country highlight list in the group structure page
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file <fid> including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure page

Examples:
|fid|country|
|1038|USA|

Scenario: UBO User can save truncated graph of group structure
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user selects a country Brazil from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
And the user clicks on <legalEntity> node which appears more than once in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file <fid> (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the group structure graph page

Examples:
|fid|legalEntity|
|217510|BPCE|

Scenario: UBO User can save truncated graph of owners
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user selects a country USA from the country highlight list in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file <fid> (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the owners graph page

Examples:
|fid|
|1038|

Scenario: KYC-400 User can save truncated graph of subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user enters percentage as 55 in ownership percentage filter text box in the graphs
And the user selects a country Australia from the country highlight list in the graphs
And the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)
Then the user should be able to save the file <fid> (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the subsidiaries graph page

Examples:
|fid|
|211|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page