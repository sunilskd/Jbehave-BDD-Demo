Epic: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-147 pop open panel for more entity info on owners graph
JIRA ID - KYC-294 KYC user can view UBO list header in owners list and side panel
JIRA ID - KYC-338 No Known Entities" should be displayed when there are no direct subs or UBOs

Meta:@ubosidepanel @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

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
And the user clicks on the direct relationships only filter in the owners graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked

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
b. 0. If subsidiary relationship exists but subsidiary entity is inactive, do not display that subsidiary on the directly owns list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the direct relationships only filter in the owners graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see list of direct subsidairies with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked

Examples:
|fid|nodeTitle|
|146115|Investec Holdings|
|200|Public Bank (Hong|

Scenario: If inactive subsidiary relationship exists, do not display that subsidiary on the directly owns list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the direct relationships only filter in the owners graph
And the user clicks on the graph node with title <switchNode>, user is currently viewing in the graph
Then the user should see list of direct subsidairies with entity title,country and percentage ownership in directly owns section of side panel for the node <switchNode> user clicked

Examples:
|fid|switchNode|
|13408|Berliner Volksbank eG|

Scenario: Covers below scenarios
A. 0. If active relationship to person owner exists for legal entity user selected or any entity in its path of ownership, display that person in the UBO list and display the legal title of the entity it directly owns
   1. If inactive relationship to person owner exists for legal entity user selected or any entity in its path of ownership, do not display that person in the UBO list
   2. If multiple people appear in the UBO list, sort by percent ownership first then by name
   3. If UBO relationship has percent ownership, display next to person on UBO list
   4. User clicks close icon, side panel hides
   5. User clicks someplace else on screen outside of side panel, panel does not close
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <nodeTitle> user clicked
|UBO NAME|ENTITY|PERCENTAGE OWNERSHIP|
|QA Test Person C|QA Legal Entity D|50.52|
|QA Test Person G|QA Legal Entity B|50.222|
|QA Test Person D|QA Legal Entity C|49.23|
|QA Test Person E|QA Legal Entity A|49.23|
|QA Test Person H|QA Legal Entity D|49.23|
|QA Test Person A|QA Legal Entity A|45.52|
|QA Test Person A|QA Legal Entity A|45.52|
|QA Test Person B|QA Legal Entity B|40.23|
|QA Test Person G|QA Legal Entity C|4.93|
|QA Test Person G|QA Legal Entity D|4.23|

When the user clicks on the graph page
Then the side panel should still exists on the graph
When the user clicks on close button on the side panel in the owners graph
Then side panel should be closed and user should continue to be on owners graph page

Examples:
|fid|nodeTitle|
|LE-A|QA Legal Entity A|

Scenario: If UBO relationship has null percent ownership, do not display percent next to person on UBO list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <nodeTitle> user clicked
|UBO NAME|ENTITY|PERCENTAGE OWNERSHIP|
|Japan Finance Corporation|Japan Bank For International Cooperation||

Examples:
|fid|nodeTitle|
|241440|Japan Bank For|

Scenario: display "No Known Entities" if there are no direct subsidiaries
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see message displayed as no known entities under direclty owns section in side panel of graph page

Examples:
|fid|nodeTitle|
|LE-34|QA Legal Entity 34|

Scenario: display "No Known Entities" under ubo section for kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see message displayed as no known entities under ubo section in side panel of graph page

Examples:
|fid|nodeTitle|
|211|Australia and New|

Scenario: User clicks on another node, side panel should refresh with updated information
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 73 in ownership percentage filter text box in the graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see message displayed as no known entities under ubo section in side panel of graph page
When the user clicks on the graph node with title <switchNode>, in the owners graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked

Examples:
|fid|nodeTitle|switchNode|
|200|Public Bank (Hong|Public Bank Berhad|

Scenario: View side panel for legal entity on subsidiaries graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   3. User clicks close icon, side panel hides
   4. User clicks someplace else on screen outside of side panel, panel does not close
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
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on direct relationship checkbox on graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked
When the user clicks on the graph page
Then the side panel should still exists on the graph
When the user clicks on close button on the side panel in the owners graph
Then side panel should be closed and user should continue to be on owners graph page

Examples:
|fid|nodeTitle|
|1038|BOA|
|58285|Berlin Hyp AG|
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
When the user clicks on direct relationship checkbox on graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see list of direct subsidairies with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 6|
|1717|Berliner Volksbank eG|
|200|Public Bank (Hong|

Scenario: Covers below scenarios
A. 0. If active relationship to person owner exists for legal entity user selected or any entity in its path of ownership, display that person in the UBO list and display the legal title of the entity it directly owns
   1. If inactive relationship to person owner exists for legal entity user selected or any entity in its path of ownership, do not display that person in the UBO list
   2. If multiple people appear in the UBO list, sort by percent ownership first then by name
   3. If UBO relationship has percent ownership, display next to person on UBO list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <nodeTitle> user clicked
|UBO NAME|ENTITY|PERCENTAGE OWNERSHIP|
|QA Test Person C|QA Legal Entity D|50.52|
|QA Test Person H|QA Legal Entity D|49.23|
|QA Test Person G|QA Legal Entity D|4.23|

Examples:
|fid|nodeTitle|
|LE-D|QA Legal Entity D|

Scenario: display "No Known Entities" if there are no direct subsidiaries
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on direct relationship checkbox on graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see message displayed as no known entities under direclty owns section in side panel of graph page

Examples:
|fid|nodeTitle|
|LE-6|QA Legal Entity 34|

Scenario: Covers below scenarios
a. 0. Display "No Known Entities" under ubo section for kyc user
   1. User clicks on another node, side panel should refresh with updated information
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on direct relationship checkbox on graph
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
Then the user should see message displayed as no known entities under ubo section in side panel of graph page
When the user clicks on the graph node with title <switchNode>, in the owners graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked

Examples:
|fid|nodeTitle|switchNode|
|112618|Moody Bank Holding|Moody National Bank|