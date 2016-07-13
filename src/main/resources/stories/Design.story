Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user
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
Then the user should see the owners graph
And the user captures the expected snapshot for the owners page <nodeTitle>

Examples:
|fid|nodeTitle|
|1038|BOA1038|



