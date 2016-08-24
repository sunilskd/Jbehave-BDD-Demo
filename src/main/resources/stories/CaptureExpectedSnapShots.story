Meta:@captureexpectedsnapshots

Scenario: Capture entity details snapshots
Meta:@captureentitydetails @kyc
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the expected snapshot for the <nodeTitle> entity details page

Examples:
|fid|nodeTitle|
|58285|Berlin Hyp AG|

Scenario: Capture subsidiaries snapshot
Meta:@capturesubsidiaries @kyc
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects the percent filter option <percentFilter> in the subsidiaries page
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user captures the expected snapshot for the <nodeTitle> subsidiaries page

Examples:
|fid|percentFilter|country|nodeTitle|
|211|50|Australia|Australia and New Zealand Banking Group Limited|

Scenario: Capture owners snapshot for UBO User
Meta:@captureowners @ubo
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user captures the expected snapshot for the <nodeTitle> owners page

Examples:
|fid|country|nodeTitle|
|12538|USA|HomeTown Bank National Association|

Scenario: Capture group structure snapshot for UBO User
Meta:@capturegroupstructure @kyc
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
And the user captures the expected snapshot for the <nodeTitle> group structure page

Examples:
|fid|country|nodeTitle|
|211|Australia|Australia and New Zealand Banking Group Limited|

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
Then the user captures the expected snapshot for the <nodeTitle> full graph

Examples:
|fid|legalEntity|nodeTitle|
|LE-6|QA Legal Entity 61|QA Legal Entity 6|

Scenario: Capture expected screenshot for owners graph for validating below scenarios with UBO user
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
Then the user captures the expected snapshot for the <nodeTitle> owners graph

Examples:
|fid|legalEntity|nodeTitle|
|LE-6|QA Test Person 1|QA Legal Entity 6|

Scenario: Capture expected screenshot for subsidiaries graph for validating below scenarios with UBO user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Meta:@capturesubsidiariesgraph @kyc
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user selects a country UK from the country highlight list in the graphs
Then the user captures the expected snapshot for the <nodeTitle> subsidiaries graph

Examples:
|fid|legalEntity|nodeTitle|
|LE-6|QA Legal Entity 61|QA Legal Entity 6|

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
Then the user captures the expected snapshot for the zoomed out <nodeTitle> owners graph
When the user clicks on the reset button next to zoom slider on the graphs
Then the user captures the expected snapshot for the reset <nodeTitle> owners graph
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed in <nodeTitle> owners graph

Examples:
|fid|nodeTitle|
|LE-1|QA Legal Entity 1|

Scenario: Capture subsidiaries graph zoom in/out/reset
Meta:@captureSubsidiariesGraphWithZoom
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to percent filter on the graphs
Then the user captures the expected snapshot for the zoomed out <nodeTitle> subsidiaries graph
When the user clicks on the reset button next to zoom slider on the graphs
Then the user captures the expected snapshot for the reset <nodeTitle> subsidiaries graph
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed in <nodeTitle> subsidiaries graph

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 6|

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
Then the user captures the expected snapshot for the zoomed out <nodeTitle> full graph
When the user clicks on the reset button next to zoom slider on the graphs
Then the user captures the expected snapshot for the reset <nodeTitle> full graph
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user captures the expected snapshot for the zoomed in <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 6|

Scenario: KYC-360 - The icon for the root node is always displaying the icon for Bank. It should be based on the legalEntityType.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
And the user clicks on the legal entity title <nodeTitle> on the side panel in the graphs
Then the user captures the expected snapshot for the <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|3|Alphabet Nominees Ltd|

Scenario: KYC-396 Verify below scenarios:
1.Legal entity in focus returns greater than 1500 triples for subsidiaries and a subsidiary relationship has less than 5 percent, graph displays less than 500 subsidiary nodes, then the rest of the path after the less than 5 percent nodes is truncated and not displayed
2.If legal entity in focus returns 1500 triples or less, displays 500 subsidiary nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
3.If legal entity in focus returns greater than 1500 triples for subsidiaries, has a subsidiary relationship with less than 5 percent, and displays 500 subsidiary nodes, then the rest of the path after the less than 5 percent node is truncated and not displayed, and the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
4.If legal entity in focus displays less than 500 subs nodes, then level truncation does not apply
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
And the user captures the expected snapshot for the <nodeTitle> subsidiaries graph

Examples:
|fid|nodeTitle|
|5100|Nippon Life Insurance Company|
|444|Intesa Sanpaolo SpA|
|90865|PNC Bancorp Inc|
|477|Banco Bradesco SA|

Scenario: KYC-396 Verify if Percent ownership filter works the same for truncated graphs, filtering nodes currently displayed on the graph
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
When the user enters percentage as 4 in ownership percentage filter text box in the graphs
Then the user captures the expected snapshot for the <nodeTitle> subsidiaries graph

Examples:
|fid|imageName|
|9461|Meiji Yasuda Life Insurance Company|

Scenario: KYC-397(Full Graph) Verify Percent ownership filter works the same for truncated graphs, filtering nodes currently displayed on the graph
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
When the user enters percentage as 5 in ownership percentage filter text box in the graphs
Then the user captures the expected snapshot for the <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|3670|Oesterreichische Kontrollbank AG|

Scenario: KYC-397(Full Graph) Verify below scenario for Full Graph If legal entity in focus displays less than 500 owner nodes, then level truncation does not apply
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user captures the expected snapshot for the <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 6|

Scenario: KYC-397(Full Graph) Verify below scenario:
1.Legal entity in focus returns greater than 1500 triples for subsidiaries and a subsidiary relationship has less than 5 percent, graph displays less than 500 subsidiary nodes, then the rest of the path after the less than 5 percent nodes is truncated and not displayed
2.If legal entity in focus returns 1500 triples or less, displays 500 subsidiary nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
3.If legal entity in focus returns greater than 1500 triples for subsidiaries, has a subsidiary relationship with less than 5 percent, and displays 500 subsidiary nodes, then the rest of the path after the less than 5 percent node is truncated and not displayed, and the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
4.If legal entity in focus displays less than 500 subs nodes, then level truncation does not apply
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user captures the expected snapshot for the <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|5100|Nippon Life Insurance Company|
|444|Intesa Sanpaolo SpA|
|90865|PNC Bancorp Inc|
|477|Banco Bradesco SA|

Scenario: KYC-395 Verify below scenarios
a. 0. If legal entity in focus returns 1500 triples or less, displays 500 owner nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
   1. If valid UBOs exist in database but were all truncated by either condition and are not displayed, UBO in-product message does not appear
b. 0. If legal entity in focus displays less than 500 owner nodes, then level truncation does not apply
   1. If valid UBOs exist in database and were not part of a truncated path on the graph, UBO in-product message appears
Meta:@skip
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user captures the expected snapshot for the <nodeTitle> owners graph

Examples:
|fid|nodeTitle|
|415|Banca Popolare Valconca Scrl|
|175270|Credit Agricole Caisse D'Epargne Investor Services (CACEIS)|

Scenario: Covers below scenarios
a. KYC-397(Full Graph) Verify If valid UBOs exist in database and were not part of a truncated path on the graph, UBO in-product message appears
b. KYC-397(Full Graph) Verify If legal entity in focus returns 1500 triples or less, displays 500 owner nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
Meta:@skip
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
And the user captures the expected snapshot for the <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|30087|The Fukuoka Chuo Bank Ltd|


Scenario: KYC-456 Capture expected screenshot for subsidiaries graph for validating below scenarios:
 a. 0. Multiple nodes and 5% truncation message displayed for graphs having more than 125 triples.
    1. Multiple nodes and 5 % truncation message displayed for graphs having circular relationship, Show more link is not displayed on the circular node.
 b. 0. Truncation message appearing and for multiple similar node, then only display path beyond the first left most occurance and do not display path beyond other appearances, Show more link displayed at other occurances of multiple node
    1. Null percent ownership do NOT trigger truncation. They are treated like 100% in this case.
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user enters percentage as 4 in ownership percentage filter text box in the graphs
And the user resize graph to translate(12444.729354203917,13.682508330066156) scale(0.42400000000000004)
Then the user captures the expected snapshot for the <nodeTitle> subsidiaries graph

Examples:
|fid|nodeTitle|
|808|Banco BTG Pactual SA TruncatedGraph|
|444|Intesa Sanpaolo SpA TruncatedGraph|

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout