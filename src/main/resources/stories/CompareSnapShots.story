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

Scenario: KYC-396 Verify below scenarios:
1.Legal entity in focus returns greater than 1500 triples for subsidiaries and a subsidiary relationship has less than 5 percent, graph displays less than 500 subsidiary nodes, then the rest of the path after the less than 5 percent nodes is truncated and not displayed
2.If legal entity in focus returns 1500 triples or less, displays 500 subsidiary nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
3.If legal entity in focus returns greater than 1500 triples for subsidiaries, has a subsidiary relationship with less than 5 percent, and displays 500 subsidiary nodes, then the rest of the path after the less than 5 percent node is truncated and not displayed, and the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
4.If legal entity in focus displays less than 500 subs nodes, then level truncation does not apply

Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
And the user captures the actual snapshot for truncated graph <nodeTitle>
And the user should see the actual snapshot matching the expected snapshot for truncated graph <nodeTitle>

Examples:
|fid|nodeTitle|
|5100|Nippon Life Insurance Company|
|444|Intesa Sanpaolo SpA|
|90865|PNC Bancorp Inc|
|477|Banco Bradesco SA|

Scenario: KYC-396 Verify if Percent ownership filter works the same for truncated graphs, filtering nodes currently displayed on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
When the user enters percentage as 4 in ownership percentage filter text box in the graphs
Then the user captures the actual snapshot for truncated graph <nodeTitle>
And the user should see the actual snapshot matching the expected snapshot for truncated graph <nodeTitle>

Examples:
|fid|nodeTitle|
|9461|Meiji Yasuda Life Insurance Company|

Scenario: KYC-395 Verify below scenarios
a. 0. If legal entity in focus returns 1500 triples or less, displays 500 owner nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
   1. If valid UBOs exist in database but were all truncated by either condition and are not displayed, UBO in-product message does not appear
1. If legal entity in focus displays less than 500 owner nodes, then level truncation does not apply
2. If valid UBOs exist in database and were not part of a truncated path on the graph, UBO in-product message appears
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user captures the actual snapshot for truncated graph <nodeTitle>
And the user should see the actual snapshot matching the expected snapshot for owners truncated graph <nodeTitle>


Examples:
|fid|nodeTitle|
|415|BancaPopolareValconcaScrl|
|175270|Credit Agricole Caisse D'Epargne Investor Services (CACEIS)|


Scenario: KYC-395 Verify Percent ownership filter works the same for truncated graphs, filtering nodes currently displayed on the graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 5 in ownership percentage filter text box in the graphs
Then the user captures the actual snapshot for truncated graph <nodeTitle>
And the user should see the actual snapshot matching the expected snapshot for owners truncated graph <nodeTitle>


Examples:
|fid|nodeTitle|
|175270|Credit Agricole Caisse D'Epargne Investor Services (CACEIS) Percetage Filter|
