Epic: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-147 pop open panel for more entity info on owners graph
JIRA ID - KYC-294 KYC user can view UBO list header in owners list and side panel
JIRA ID - KYC-338 No Known Entities" should be displayed when there are no direct subs or UBOs
JIRA ID - KYC-353 Percentage ownership is truncating the 2nd decimal value if it is zero.
JIRA ID - KYC-16 KYC user can click link to another entity in owners graph
JIRA ID - KYC-273 User can click link to another entity in full graph
JIRA ID - KYC-73 KYC user can click link to another entity in subsidiary graph
JIRA ID - KYC-330 Remove links for person,non-entity or non-person in graphs.
JIRA ID - KYC-272 - User can view website in side panel for legal entity on a graph

Meta:@ubosidepanelLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: View side panel for legal entity on owners graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   3. Entity With website, display hyperlink in details section of side panel
   4. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
   5. If active stock exchange relationship(s) exist, display legal title of stock exchange sort first by primary = true, then by legal title
b. 0. If no regulation relationship exists, then display field label but no value
   1. If no stock exchange relationship exists, display field label but no value
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
Then the user should see complete head office address, regulators , stock exchanges and website in details section of side panel for the node user clicked in the graphs

Examples:
|fid|nodeTitle|
|58285|Berlin Hyp AG|
|52147|London Stock Exchange Plc|

Scenario: Covers below scenarios
a. 0. If multiple active subsidiary relationships exist and are displayed on list, order by percent ownership first then by legal title
   1. If percent ownership exists for subsidiary relationship, display in list next to subsidiary
   2. If percent ownership is null, do not display a percent ownership next to subsidiary on list
   3. If country of operations exists for subsidiary entity, display next to subsidiary on list
   4. If country of operations does not exist for subsidiary entity, do not display next to subsidiary on list
   5. If active subsidiary relationship exists, display that subsidiary on the directly owns list
   6. User clicks close icon, side panel hides
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
Then the user should see list of direct subsidiaries with entity title, country and percentage ownership in directly owns section of side panel for the node user clicked in the graphs

Examples:
|fid|nodeTitle|
|146115|Investec Holdings (Ireland) Ltd|

Scenario: Covers below scenarios
A. 0. If active relationship to person owner exists for legal entity user selected or any entity in its path of ownership, display that person in the UBO list and display the legal title of the entity it directly owns
   1. If inactive relationship to person owner exists for legal entity user selected or any entity in its path of ownership, do not display that person in the UBO list
   2. If multiple people appear in the UBO list, sort by percent ownership first then by name
   3. If UBO relationship has percent ownership, display next to person on UBO list
   4. User clicks close icon, side panel hides
   5. User clicks someplace else on screen outside of side panel, panel does not close
   6. display "No Known Entities" if there are no direct subsidiaries
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
Then the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <nodeTitle> user clicked in the graphs
|UBO NAME|ENTITY|PERCENTAGE OWNERSHIP|
|Agnew Meyer Robert|Banco BISA SA|1.24|
|Jose Luis Aranguren Aguirre|Banco BISA SA|0.88|
|Jorge Eduardo Rengel Sillerico|Banco BISA SA|0.68|
|Tomás Barrios Santivañez|Banco BISA SA|0.23|

Then the user should see message displayed in side panel in place of list explaining there are no directly owned entities in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the side panel still open in the graphs
When the user clicks on close button on the side panel in the graphs
Then the user should see the side panel closed and should be able to continue in the graphs

Examples:
|fid|nodeTitle|
|104464|SAFI Union SA|


Scenario: User clicks on another node, side panel should refresh with updated information
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user enters percentage as 73 in ownership percentage filter text box in the graphs
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
Then the user should see message displayed in side panel in place of list explaining there are no ultimate beneficial owners in the graphs
When the user clicks on the legal entity title <nodeTitle> on the side panel in the graphs
When the user clicks on the tile of the another legal entity <switchNode> (including the entity of interest) in the graphs
Then the user should see list of direct subsidiaries with entity title, country and percentage ownership in directly owns section of side panel for the node user clicked in the graphs

Examples:
|fid|switchNodenodeTitle|nodeTitle|
|200|Public Bank (Hong Kong) Limited|Public Bank Berhad|

Scenario: User can click on the website in sidepanel
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
When the user clicks on <website> link in the entity details section of side panel
Then user is taken to a URL http://www.bip.b.br/ that opens in a new window

Examples:
|fid|nodeTitle|website|
|732|Banco Indusval SA|http://www.bip.b.br|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page