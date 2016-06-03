Epic: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-147 pop open panel for more entity info on owners graph

Meta:@sidepanel @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: View side panel for legal entity on owners graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   3. User clicks close icon, side panel hides
b. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
c. 0. If no regulation relationship exists, then display field label but no value
   1. If no stock exchange relationship exists, display field label in summary section but no value
   2. If no stock exchange relationship exists, display field label in identifier section but no value
   3. If no stock exchange relationship exists, display field label but no value
d. If active stock exchange relationship(s) exist, display legal title of stock exchange sort first by primary = true, then by legal title
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the owners graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked

Examples:
|fid|nodeTitle|
|815|Banco Popular|
|58285|Berlin Hyp AG|
|52147|London Stock Exchange|
|4236|Sparkasse Wetzlar|

Scenario: View side panel for legal entity on owners graph

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

And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the owners graph
Then the user should see list of direct subsidairies with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked

Examples:
|fid|nodeTitle|
|146115|Investec Holdings|
|1717|Berliner Volksbank eG|
|200|Public Bank (Hong Kong) Limited|

Scenario: View side panel for legal entity on owners graph
d. If no primary physical address exists for head office, display field label but no value
x. If inactive stock exchange relationship, then display field label but no value
c. If only inactive regulation relationship exists, then display field label but no value

r. If no valid subsidiary relationships exist, display directly owns header and display message "No known entities." in place of list
y. User clicks someplace else on screen outside of side panel, panel does not close
w. Do not display UBO list for KYC user or header for the list