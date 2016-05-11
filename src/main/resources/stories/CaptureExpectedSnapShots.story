Meta:@captureexpectedsnapshots

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Capture entity details snapshots
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the expected snapshot for the entity details page

Examples:
|fid|
|58285|

Scenario: Capture subsidiaries snapshot
Scenario: User applies a filter by percent ownership that results in no legal entities in list or no legal entities that have a country of operations, then no countries populate the available highlight options
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects the percent filter option <percentFilter> in the subsidiaries page
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user captures the expected snapshot for the subsidiaries page

Examples:
|fid|percentFilter|country|
|211|50|Australia|

Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout

Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Capture owners snapshot for UBO User
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects a country <country> from the country highlight list in the owners page
And the user captures the expected snapshot for the owners page

Examples:
|fid|country|
|12538|USA|