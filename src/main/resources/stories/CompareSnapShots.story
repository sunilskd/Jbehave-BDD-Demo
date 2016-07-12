Covers below features:
JIRA ID - KYC-360 - The icon for the root node is always displaying the icon for Bank. It should be based on the legalEntityType.
JIRA ID - KYC-347 - Non person/Non Entity and Free text using wrong icon

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

Scenario: Compare screenshot for full graph for validating below scenarios with UBO user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
And the user captures the actual snapshot for the full graph
Then the user should see the actual snapshot matching the expected snapshot for full graph

Examples:
|fid|legalEntity|
|LE-6|QA Legal Entity 61|

Scenario: Compare screenshot for owners graph for validating below scenarios with UBO user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on <legalEntity> node which appears more than once in the graphs
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
And the user captures the actual snapshot for the owners graph
Then the user should see the actual snapshot matching the expected snapshot for owners graph

Examples:
|fid|legalEntity|
|LE-6|QA Test Person 1|

Scenario: Compare screenshot for Subs graph for validating below scenarios with KYC user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user selects a country UK from the country highlight list in the graphs
And the user captures the actual snapshot for the subsidiaries graph
Then the user should see the actual snapshot matching the expected snapshot for subsidiaries graph

Examples:
|fid|
|LE-6|

Scenario: The icon for the root node is always displaying the icon for Bank. It should be based on the legalEntityType.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
And the user clicks on the legal entity title <nodeTitle> on the side panel in the graphs
Then the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|3|Alphabet Nominees Ltd|