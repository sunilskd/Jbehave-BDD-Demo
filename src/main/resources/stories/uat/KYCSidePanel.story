Epic: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-147 - Pop open panel for more entity info on owners graph
JIRA ID - KYC-294 - KYC user can view UBO list header in owners list and side panel
JIRA ID - KYC-149 - Pop-open panel for more entity info on subsidiary graph
JIRA ID - KYC-353 - Percentage ownership is truncating the 2nd decimal value if it is zero.
JIRA ID - KYC-16 - KYC user can click link to another entity in owners graph
JIRA ID - KYC-273 - User can click link to another entity in full graph
JIRA ID - KYC-73 - KYC user can click link to another entity in subsidiary graph
JIRA ID - KYC-272 - User can view website in side panel for legal entity on a graph

Meta:@kycsidepanelLive @live

Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page

Scenario: View side panel for legal entity on owners graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   3. Entity With website, display hyperlink in details section of side panel
   4. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
   5. If no regulation relationship exists, then display field label but no value
   6. If no stock exchange relationship exists, display field label but no value
   7  If inactive stock exchange relationship, then display field label but no value
   8. If multiple active subsidiary relationships exist and are displayed on list, order by percent ownership first then by legal title
   9. If percent ownership exists for subsidiary relationship, display in list next to subsidiary
   10. If percent ownership is null, do not display a percent ownership next to subsidiary on list
   11. If country of operations exists for subsidiary entity, display next to subsidiary on list
   12. If country of operations does not exist for subsidiary entity, do not display next to subsidiary on list
   13. If active subsidiary relationship exists, display that subsidiary on the directly owns list
   14. Do not display UBO list for KYC user or header for the list
   15.  User clicks on another node, side panel should refresh with updated information
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
Then the user should see complete head office address, regulators , stock exchanges and website in details section of side panel for the node user clicked in the graphs
Then the user should see list of direct subsidiaries with entity title, country and percentage ownership in directly owns section of side panel for the node user clicked in the graphs
Then the kyc user should not see ubo list in side panel in the graphs
When the user clicks on the tile of the another legal entity <switchNode> (including the entity of interest) in the graphs
Then the user should see complete head office address, regulators , stock exchanges and website in details section of side panel for the node user clicked in the graphs

Examples:
|fid|nodeTitle|switchNode|
|1038|Bank of America National Association|BANA Holding Corporation|

Scenario: User is taken to the owners graph when clicks legal entity's title link in the side panel
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user clicks on direct relationship only filter checkbox in the graphs
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
And the user clicks on the legal entity title <nodeTitle> on the side panel in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>
Then the user should see the legal entity <legalEntity>, user is currently viewing, as the root and highlighted on the graphs

Examples:
|fid|nodeTitle|legalEntity|
|182119|Bank of America National Association|Bank of America National Association|

Scenario: View side panel for legal entity on subsidiary graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   3. Entity With website, display hyperlink in details section of side panel
   4. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
   5. If no regulation relationship exists, then display field label but no value
   6. If no stock exchange relationship exists, display field label but no value
   7  If inactive stock exchange relationship, then display field label but no value
   8. If multiple active subsidiary relationships exist and are displayed on list, order by percent ownership first then by legal title
   9. If percent ownership exists for subsidiary relationship, display in list next to subsidiary
   10. If percent ownership is null, do not display a percent ownership next to subsidiary on list
   11. If country of operations exists for subsidiary entity, display next to subsidiary on list
   12. If country of operations does not exist for subsidiary entity, do not display next to subsidiary on list
   13. If active subsidiary relationship exists, display that subsidiary on the directly owns list
   14. Do not display UBO list for KYC user or header for the list
   15.  User clicks on another node, side panel should refresh with updated information
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
And the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs
Then the user should see complete head office address, regulators , stock exchanges and website in details section of side panel for the node user clicked in the graphs
Then the user should see list of direct subsidiaries with entity title, country and percentage ownership in directly owns section of side panel for the node user clicked in the graphs
Then the kyc user should not see ubo list in side panel in the graphs
When the user clicks on the tile of the another legal entity <switchNode> (including the entity of interest) in the graphs
Then the user should see complete head office address, regulators , stock exchanges and website in details section of side panel for the node user clicked in the graphs

Examples:
|fid|nodeTitle|switchNode|
|1038|Bank of America National Association|BANA Holding Corporation|

Scenario: KYC user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page