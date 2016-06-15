Meta:@captureexpectedsnapshots

Scenario: Capture entity details snapshots
Meta:@captureentitydetails @kyc
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the expected snapshot for the entity details page

Examples:
|fid|
|58285|

Scenario: Capture subsidiaries snapshot
Meta:@capturesubsidiaries @kyc
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
Meta:@captureowners @ubo
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user captures the expected snapshot for the owners page

Examples:
|fid|country|
|12538|USA|

Scenario: Capture group structure snapshot for UBO User
Meta:@capturegroupstructure @kyc
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
And the user captures the expected snapshot for the group structure page

Examples:
|fid|country|
|211|Australia|

Scenario: Capture expected screenshot for full graph for validating below scenarios with UBO user
 a. 0. KYC-151 Display icon for legal entity that is a bank.
    1. KYC-152 Display icon for legal entity is not a bank.
    2. KYC-153 Display icon for person.
    3. KYC-154 Display icon for non-person,non-institution owner on graph.
Meta:@capturegroupstructure @ubo
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user captures the expected snapshot for the full graph page

Examples:
|fid|legalEntity|
|LE-6|QA Legal Entity 61|


Scenario: Capture expected screenshot for owners graph for validating below scenarios with UBO user
 a. 0. KYC-151 Display icon for legal entity that is a bank.
    1. KYC-152 Display icon for legal entity is not a bank.
    2. KYC-153 Display icon for person.
    3. KYC-154 Display icon for non-person,non-institution owner on graph.
Meta:@captureowners @ubo
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user captures the expected snapshot for the owners graph page

Examples:
|fid|legalEntity|
|LE-6|QA Legal Entity 61|


Scenario: Capture expected screenshot for subsidiaries graph for validating below scenarios with KYC user
 a. 0. KYC-151 Display icon for legal entity that is a bank.
    1. KYC-152 Display icon for legal entity is not a bank.
    2. KYC-153 Display icon for person.
    3. KYC-154 Display icon for non-person,non-institution owner on graph.
Meta:@captureowners @kyc
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user selects a country UK from the country highlight list in the graphs
Then the user captures the expected snapshot for the subsidiaries graph page

Examples:
|fid|
|LE-6|




