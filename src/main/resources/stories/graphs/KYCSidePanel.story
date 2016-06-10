Epic: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-147 pop open panel for more entity info on owners graph
JIRA ID - KYC-294 KYC user can view UBO list header in owners list and side panel
JIRA ID - KYC-149 Pop-open panel for more entity info on subsidiary graph
JIRA ID - KYC-353 Percentage ownership is truncating the 2nd decimal value if it is zero.

Meta:@kycsidepanel @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: View side panel for legal entity on owners graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
b. 0. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
   1. If active stock exchange relationship(s) exist, display legal title of stock exchange sort first by primary = true, then by legal title
c. 0. If no regulation relationship exists, then display field label but no value
   1. If no stock exchange relationship exists, display field label but no value
d. 0. If no primary physical address exists for head office, display field label but no value
   1. If inactive stock exchange relationship, then display field label but no value
   2. If only inactive regulation relationship exists, then display field label but no value
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see complete head office address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked in the graphs

Examples:
|fid|nodeTitle|
|1038|BOA|
|58285|Berlin Hyp AG|
|52147|London Stock Exchange|
|LE-6|QA Legal Entity 6|

Scenario: Covers below scenarios
a. 0. If multiple active subsidiary relationships exist and are displayed on list, order by percent ownership first then by legal title
   1. If percent ownership exists for subsidiary relationship, display in list next to subsidiary
   2. If percent ownership is null, do not display a percent ownership next to subsidiary on list
   3. If country of operations exists for subsidiary entity, display next to subsidiary on list
   4. If country of operations does not exist for subsidiary entity, do not display next to subsidiary on list
   5. If active subsidiary relationship exists, display that subsidiary on the directly owns list
   6. User clicks close icon, side panel hides
b. 0. If inactive subsidiary relationship exists, do not display that subsidiary on the directly owns list
c. 0. If subsidiary relationship exists but subsidiary entity is inactive, do not display that subsidiary on the directly owns list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see list of direct subsidiaries with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked in the graphs

Examples:
|fid|nodeTitle|
|146115|Investec Holdings|
|1717|Berliner Volksbank eG|
|200|Public Bank (Hong|

Scenario: Covers below scenarios
a. 0. Do not display UBO list for KYC user or header for the list
   1. User clicks close icon, side panel hides
   2. User clicks someplace else on screen outside of side panel, panel does not close
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the kyc user should not see ubo list in side panel in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the side panel still open in the graphs
When the user clicks on close button on the side panel in the graphs
Then the user should see the side panel closed and should be able to continue in the graphs

Examples:
|fid|nodeTitle|
|LE-A|QA Legal Entity A|

Scenario: Covers Below scenarios
a. 0. display "No Known Entities" if there are no direct subsidiaries
   1. display "No Known Entities" under ubo section for kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see message displayed in place of list explaining there are no directly owned entities in the graphs
Then the user should see message displayed in place of list explaining there are no ultimate beneficial owners in the graphs

Examples:
|fid|nodeTitle|
|LE-34|QA Legal Entity 34|

Scenario: User clicks on another node, side panel should refresh with updated information
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 73 in ownership percentage filter text box in the graphs
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see message displayed in place of list explaining there are no ultimate beneficial owners in the graphs
When the user clicks on the graph node with title <switchNode>, in the graphs
Then the user should see complete head office address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked in the graphs

Examples:
|fid|nodeTitle|switchNode|
|200|Public Bank (Hong|Public Bank Berhad|

Scenario: View side panel for legal entity on owners graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   3. User clicks close icon, side panel hides
   4. User clicks someplace else on screen outside of side panel, panel does not close
   5. If no stock exchange relationship exists, display field label but no value
b. 0. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
   1. If active stock exchange relationship(s) exist, display legal title of stock exchange sort first by primary = true, then by legal title
c. 0. If no regulation relationship exists, then display field label but no value
d. 0. If no primary physical address exists for head office, display field label but no value
   1. If inactive stock exchange relationship, then display field label but no value
   2. If only inactive regulation relationship exists, then display field label but no value
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see complete head office address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the side panel still open in the graphs
When the user clicks on close button on the side panel in the graphs
Then the user should see the side panel closed and should be able to continue in the graphs

Examples:
|fid|nodeTitle|
|1038|BOA|
|58285|Berlin Hyp AG|
|LE-C|QA Legal Entity C|
|LE-6|QA Legal Entity 6|

Scenario: Covers below scenarios
a. 0. If multiple active subsidiary relationships exist and are displayed on list, order by percent ownership first then by legal title
   1. If percent ownership exists for subsidiary relationship, display in list next to subsidiary
   2. If percent ownership is null, do not display a percent ownership next to subsidiary on list
   3. If country of operations exists for subsidiary entity, display next to subsidiary on list
   4. If country of operations does not exist for subsidiary entity, do not display next to subsidiary on list
   5. If active subsidiary relationship exists, display that subsidiary on the directly owns list
   6. User clicks close icon, side panel hides
b. 0. If inactive subsidiary relationship exists, do not display that subsidiary on the directly owns list
c. 0. If subsidiary relationship exists but subsidiary entity is inactive, do not display that subsidiary on the directly owns list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see list of direct subsidiaries with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked in the graphs
When the user clicks on close button on the side panel in the graphs
Then the user should see the side panel closed and should be able to continue in the graphs

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 6|
|1717|Berliner Volksbank eG|
|200|Public Bank (Hong|

Scenario: Do not display UBO list for KYC user or header for the list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the kyc user should not see ubo list in side panel in the graphs

Examples:
|fid|nodeTitle|
|LE-C|QA Legal Entity C|

Scenario: Covers Below scenarios
a. 0. display "No Known Entities" if there are no direct subsidiaries
   1. display "No Known Entities" under ubo section for kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see message displayed in place of list explaining there are no directly owned entities in the graphs
Then the user should see message displayed in place of list explaining there are no ultimate beneficial owners in the graphs

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 34|

Scenario: User clicks on another node, side panel should refresh with updated information
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graphs
Then the user should see complete head office address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked in the graphs
When the user clicks on the graph node with title <switchNode>, in the graphs
Then the user should see complete head office address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked in the graphs

Examples:
|fid|nodeTitle|switchNode|
|112618|Moody Bank Holding|Moody National Bank|