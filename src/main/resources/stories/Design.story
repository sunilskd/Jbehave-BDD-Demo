Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC-396 Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Cayman Islands|
|France|
|Hong Kong|
|Ireland|
|Japan|
|Luxembourg|
|Panama|
|Singapore|
|UK|

When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Japan|

Examples:
|fid|nodeTitle|
|9461|The Miyazaki Bank Ltd|