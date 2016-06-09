Epic: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-150 Pop-open panel for more entity info on full graph
JIRA ID - KYC-294 KYC user can view UBO list header in owners list and side panel
JIRA ID - KYC-353 Percentage ownership is truncating the 2nd decimal value if it is zero.

Meta:@ubosidepanelfullgraph @ubo

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
   2. If no primary physical address exists for head office, display field label but no value
   3. If inactive stock exchange relationship, then display field label but no value
   4. If only inactive regulation relationship exists, then display field label but no value
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graph
When the user clicks on the graph node with title <switchNode>, in the graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked

Examples:
|fid|switchNode|
|182042|BOA|
|68997|Berlin Hyp AG|
|LE-33|QA Legal Entity 6|

Scenario: Covers below scenarios
a. 0. If multiple active subsidiary relationships exist and are displayed on list, order by percent ownership first then by legal title
   1. If percent ownership exists for subsidiary relationship, display in list next to subsidiary
   2. If percent ownership is null, do not display a percent ownership next to subsidiary on list
   3. If country of operations exists for subsidiary entity, display next to subsidiary on list
   4. If country of operations does not exist for subsidiary entity, do not display next to subsidiary on list
   5. If active subsidiary relationship exists, display that subsidiary on the directly owns list
b. 0. If subsidiary relationship exists but subsidiary entity is inactive, do not display that subsidiary on the directly owns list
c. 0. If inactive subsidiary relationship exists, do not display that subsidiary on the directly owns list
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graph
When the user clicks on the graph node with title <switchNode>, in the graph
Then the user should see list of direct subsidiaries with entity title,country and percentage ownership in directly owns section of side panel for the node <switchNode> user clicked

Examples:
|fid|switchNode|
|LE-33|QA Legal Entity 6|
|LE-43|QA Legal Entity 45|
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
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on the graph node with title <switchNode>, in the graph
Then the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <switchNode> user clicked
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

When the user clicks on <legalEntityTitle> node which appears more than once in the graphs
Then the user should see message displayed as no known entities under directly owns section in side panel of graph page
When the user clicks on close button on the side panel in the owners graph
Then side panel should be closed and user should continue to be on owners graph page

Examples:
|fid|switchNode|legalEntityTitle|
|LE-C|QA Legal Entity A|QA Test Person G|

Scenario: display "No Known Entities" if there are no direct subsidiaries
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on the graph node with title <switchNode>, in the graph
Then the user should see message displayed as no known entities under directly owns section in side panel of graph page

Examples:
|fid|switchNode|
|LE-6|QA Legal Entity 34|

Scenario: display "No Known Entities" under ubo section for kyc user
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
When the user clicks on the graph node with title <switchNode>, in the graph
Then the user should see message displayed as no known entities under ubo section in side panel of graph page

Examples:
|fid|switchNode|
|59616|Australia and New|

Scenario: User clicks on another node, side panel should refresh with updated information
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph
When the user clicks on the graph node with title <switchNode>, in the graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked

Examples:
|fid|nodeTitle|switchNode|
|112618|HomeTown Bank National|Moody National Bank|