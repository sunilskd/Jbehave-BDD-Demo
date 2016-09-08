.Overall Report

image:.CompareSnapShots.stats.png
----

Covers below features:
JIRA ID - KYC-360 - The icon for the root node is always displaying the icon for Bank. It should be based on the legalEntityType.
JIRA ID - KYC-347 - Non person/Non Entity and Free text using wrong icon
JIRA ID - KYC-456 - New truncation logic for subs graph
JIRA ID - KYC-455 - new truncation logic owners graph
JIRA ID - KYC-457 - new truncation logic full graph

Meta:@comparesnapshots
Scenario: Compare entity details snapshots
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the entity details tab
And the user captures the actual snapshot for the <nodeTitle> entity details page
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> entity details page

Examples:
|fid|nodeTitle|
|58285|Berlin Hyp AG|

Scenario: Compare subsidiaries snapshot
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user selects the percent filter option <percentFilter> in the subsidiaries page
And the user selects a country <country> from the country highlight list in the subsidiaries page
And the user captures the actual snapshot for the <nodeTitle> subsidiaries page
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> subsidiaries page

Examples:
|fid|percentFilter|country|nodeTitle|
|211|50|Australia|Australia and New Zealand Banking Group Limited|

Scenario: Compare owners snapshot
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on display audit information link in owners page
And the user selects a country <country> from the country highlight list in the owners page
And the user captures the actual snapshot for the <nodeTitle> owners page
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> owners page

Examples:
|fid|country|nodeTitle|
|12538|USA|HomeTown Bank National Association|

Scenario: Compare group structure snapshot
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
And the user captures the actual snapshot for the <nodeTitle> group structure page
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> group structure page

Examples:
|fid|country|nodeTitle|
|211|Australia|Australia and New Zealand Banking Group Limited|

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
And the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

Examples:
|fid|legalEntity|nodeTitle|
|LE-6|QA Legal Entity 61|QA Legal Entity 6|

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
And the user captures the actual snapshot for the <nodeTitle> owners graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> owners graph

Examples:
|fid|legalEntity|nodeTitle|
|LE-6|QA Test Person 1|QA Legal Entity 6|

Scenario: Compare screenshot for Subs graph for validating below scenarios with KYC user
 a. 0. Display icon for legal entity that is a bank.
    1. Display icon for legal entity is not a bank.
    2. Display icon for person.
    3. Display icon for non-person,non-institution owner on graph.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user selects a country UK from the country highlight list in the graphs
And the user captures the actual snapshot for the <nodeTitle> subsidiaries graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> subsidiaries graph

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 6|

Scenario: The icon for the root node is always displaying the icon for Bank. It should be based on the legalEntityType.
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
And the user clicks on the legal entity title <nodeTitle> on the side panel in the graphs
And the user captures the actual snapshot for the <nodeTitle> full graph
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
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see the subsidiaries graph
When the user captures the actual snapshot for the <nodeTitle> subsidiaries graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> subsidiaries graph

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
And the user captures the actual snapshot for the <nodeTitle> subsidiaries graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> subsidiaries graph

Examples:
|fid|nodeTitle|
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
When the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

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
When the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

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
When the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|5100|Nippon Life Insurance Company|
|444|Intesa Sanpaolo SpA|
|90865|PNC Bancorp Inc|
|477|Banco Bradesco SA|

Scenario: KYC-395 Verify below scenarios
a. 0. If legal entity in focus returns 1500 triples or less, displays 500 owner nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
   1. If valid UBOs exist in database but were all truncated by either condition and are not displayed, UBO in-product message does not appear
1. If legal entity in focus displays less than 500 owner nodes, then level truncation does not apply
2. If valid UBOs exist in database and were not part of a truncated path on the graph, UBO in-product message appears
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user captures the actual snapshot for the <nodeTitle> owners graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> owners graph

Examples:
|fid|nodeTitle|
|415|BancaPopolareValconcaScrl|
|175270|Credit Agricole Caisse D'Epargne Investor Services (CACEIS)|

Scenario: Covers below scenarios
a. KYC-397(Full Graph) Verify If valid UBOs exist in database and were not part of a truncated path on the graph, UBO in-product message appears
b. KYC-397(Full Graph) Verify If legal entity in focus returns 1500 triples or less, displays 500 owner nodes, then the level where the 500th node exists is completed and anything in the next level is truncated and not displayed
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the full graph
When the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|30087|The Fukuoka Chuo Bank Ltd|


Scenario: KYC-456 Covers below scenarios:
 a. 0. If the legal entity in focus has triple >125, Notification message "This graph is too large to display in full. To make this information viewable in your browser, we have removed relationships that appear multiple times or have less than 5% ownership. Click the “show more” link on tiles to view hidden segments in a new graph."
    1. When triples are >125 & legal entity repeats itselfs in the path(Circular relationship), path is truncated at the second occurance and show more link is not displayed
 b. When triples are >125 & an entity appears more than once, then only display path beyond the first left most occurance and do not display path beyond other appearances
 c. Verify if the legal entity in focus has triple count greater than 125 and node count is greater than 2500, Notification message "This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the “show more” link on tiles to view hidden segments in a new graph." is displayed.
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
And the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user enters percentage as 4 in ownership percentage filter text box in the graphs
And the user resize graph to translate(12444.729354203917,13.682508330066156) scale(0.42400000000000004)
And the user captures the actual snapshot for the <nodeTitle> subsidiaries graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> subsidiaries graph


Examples:
|fid|nodeTitle|
|808|Banco BTG Pactual SA|
|444|Intesa Sanpaolo SpA|
|7127|JPMorgan Chase & Co|

Scenario: KYC-455 Covers below scenarios for truncated owners graph for KYC user.
a. 0. When triples are >125, then nodes with less than 5% are displayed but not the nodes potentially be after that node.
   1. When triples are >125 & an entity appears more than once, then only display path beyond the first left most occurance and do not display path beyond other appearances
   2. When triples are >125 & an entity appears more than once & first occurance has less than 5% ownership, then truncate the graph and display the path of second appearances
   3. Null percent ownership do NOT trigger truncation. They are treated like 100% in this case
   4. Display notification message "This graph is too large to display in full. To make this information viewable in your browser, we have removed relationships that appear multiple times or have less than 5% ownership. Click the “show more” link on tiles to view hidden segments in a new graph."
   5. UBO highlight is disabled for UBO and KYC user
   6. "Appears count" on tiles only reflects appearances on the graph after truncation
   7. KYC user will see in-product UBO message (KYC-470 bug)
   8. Free text truncated as owned is <5%(Entity - FMR LLC)
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user resize graph to translate(919.205780180313,466.8843658462901) scale(0.14500000000000005)
When the user captures the actual snapshot for the <nodeTitle> owners graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> owners graph

Examples:
|fid|nodeTitle|
|149414|Landmark Directors Limited KYC|

Scenario: KYC-457 Covers below scenarios for truncated full graph for UBO user.
a. 0. When triples are >125, then nodes with less than 5% are displayed but not the nodes potentially be after that node.
   1. When triples are >125 & an entity appears more than once, then only display path beyond the first left most occurance and do not display path beyond other appearances
   2. When triples are >125 & an entity appears more than once & first occurance has less than 5% ownership, then truncate the graph and display the path of second appearances
   3. Null percent ownership do NOT trigger truncation. They are treated like 100% in this case
   4. Display notification message "This graph is too large to display in full. To make this information viewable in your browser, we have removed relationships that appear multiple times or have less than 5% ownership. Click the “show more” link on tiles to view hidden segments in a new graph."
   5. UBO highlight is enabled for UBO user
   6. Verify circular relationship
Given the user is on the ubo login page
When the user login as a ubo user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the graph button
And the user resize graph to translate(4558.5,288.89999626422735) scale(0.1)
When the user clicks on the ultimate beneficial owners filter checkbox in the graph
When the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|217510|BPCE UBO|

Scenario: KYC-457 Covers below scenarios for truncated full graph for KYC user.
a. 0. When triples are <125, and nodes are >2500 then nodes containg 2500th node level will be displayed and remainig will levels will be truncated.
   1. Verify graph truncation notification message when number of nodes are greater than 2500
   2. Null percent ownership do NOT trigger truncation. They are treated like 100% in this case
   3. Display notification message "This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the “show more” link on tiles to view hidden segments in a new graph."
   4. "Appears count" on tiles only reflects appearances on the graph after truncation
Given the user is on the ubo login page
When the user login as a kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the graph button
And the user resize graph to translate(11384.441979011302,559.0051525281191) scale(0.1)
When the user captures the actual snapshot for the <nodeTitle> full graph
Then the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph

Examples:
|fid|nodeTitle|
|250786|Generali European Real Estate|

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout