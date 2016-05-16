Meta:@captureexpectedsnapshots

Scenario: Capture entity details snapshots
Meta:@captureentitydetails
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the expected snapshot for the entity details page

Examples:
|fid|
|58285|

Scenario: Capture subsidiaries snapshot
Meta:@capturesubsidiaries
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects the percent filter option <percentFilter> in the subsidiaries page
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user captures the expected snapshot for the subsidiaries page

Examples:
|fid|percentFilter|country|
|211|50|Australia|

Scenario: Capture owners snapshot for UBO User
Meta:@captureowners
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects a country <country> from the country highlight list in the owners page
And the user captures the expected snapshot for the owners page

Examples:
|fid|country|
|12538|USA|

Scenario: Capture group structure snapshot for UBO User
Meta:@capturegroupstructure
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
And the user captures the expected snapshot for the group structure page

Examples:
|fid|country|
|1038|USA|