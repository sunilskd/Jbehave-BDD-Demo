Meta:@comparesnapshots

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Compare entity details snapshots
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the actual snapshot for the entity details page
Then the user should see the actual snapshot matching the expected snapshot for entity details page

Examples:
|fid|
|58285|

Scenario: Compare subsidiaries snapshot
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects the percent filter option <percentFilter> in the subsidiaries page
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user captures the actual snapshot for the subsidiaries page
Then the user should see the actual snapshot matching the expected snapshot for subsidiaries page

Examples:
|fid|percentFilter|country|
|211|50|Australia|

Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Compare owners snapshot
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user captures the actual snapshot for the owners page
Then the user should see the actual snapshot matching the expected snapshot for owners page

Examples:
|fid|country|
|12538|USA|

Scenario: Compare group structure snapshot
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
And the user captures the actual snapshot for the group structure page
Then the user should see the actual snapshot matching the expected snapshot for group structure page

Examples:
|fid|country|
|211|Australia|