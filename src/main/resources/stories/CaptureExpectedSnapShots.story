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
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Meta:@capturefullgraph @ubo
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user captures the expected snapshot for the full graph

Examples:
|fid|legalEntity|
|LE-6|QA Legal Entity 61|

Scenario: Capture expected screenshot for owners graph for validating below scenarios with KYC user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Meta:@captureownersgraph @kyc
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user captures the expected snapshot for the owners graph

Examples:
|fid|legalEntity|
|LE-6|QA Legal Entity 61|

Scenario: Capture expected screenshot for subsidiaries graph for validating below scenarios with KYC user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Meta:@capturesubsidiariesgraph @kyc
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
When the user selects a country UK from the country highlight list in the graphs
Then the user captures the expected snapshot for the subsidiaries graph

Examples:
|fid|legalEntity|
|LE-6|QA Legal Entity 61|

Scenario: Capture owners graph zoom in/out/reset
Meta:@captureOwnersGraphWithZoom
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed out owners graph
When the user clicks on the reset button next to zoom slider on the graphs
Then the user captures the expected snapshot for the reset owners graph
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed in owners graph

Examples:
|fid|
|LE-1|

Scenario: Capture subsidiaries graph zoom in/out/reset
Meta:@captureSubsidiariesGraphWithZoom
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to percent filter on the graphs
Then the user captures the expected snapshot for the zoomed out subsidiaries graph
When the user clicks on the reset button next to zoom slider on the graphs
Then the user captures the expected snapshot for the reset subsidiaries graph
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed in subsidiaries graph

Examples:
|fid|
|LE-6|

Scenario: Capture full graph zoom in/out/reset
Meta:@captureFullGraphWithZoom
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user enters percentage as 1 in ownership percentage filter text box in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to country highlight on the graphs
Then the user captures the expected snapshot for the zoomed out full graph
When the user clicks on the reset button next to zoom slider on the graphs
Then the user captures the expected snapshot for the reset full graph
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed in full graph

Examples:
|fid|
|LE-6|
