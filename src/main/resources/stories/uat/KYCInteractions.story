Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 - Interaction between percent filter and direct/indirect filter on all graphs
JIRA ID - KYC 265 - Interaction between filters and highlights on all graphs

Meta:@kycinteractionsLive @kyclive

Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page

Scenario: KYC user views full graph
a. 0. If user applies "direct relationships only" filter to graph, percent filter resets to 0
   1. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
   2. User applies direct relationships only filter and percent filter
   3. User unchecks "direct relationships only" filter, percent filter resets to 0
   4. Country highlights drop down updates when percent filter applied
   5. Country highlights drop down updates when direct relationships only filter applied
   6. Country highlights drop down updates when direct relationships only filter and percent filter are applied
   7. If user applies percent or direct filter, any highlights previously applied (country,appears multiple) are removed and de-selected
   8. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible
   9. User selects country highlight ,Count of tiles currently visible that match that country is displayed
   10. User selects country highlight and If a filter is applied, only tiles still visible after the filter count
   11. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
   12. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight

When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity The Fukuoka Chuo Bank Ltd, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of subsidiaries in level 1, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 4, below the root entity, in the graphs
And the user should see the list of subsidiaries in level 5, below the root entity, in the graphs
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5
Then the user should see the ultimate beneficial owners filter checkbox disabled in the graph
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Cayman Islands (4)|
|Japan (77)|

When the user selects a country Cayman Islands from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Hiroshima Finance (Cayman) Limited|
|Hiroshima Preferred Capital Cayman Limited|
|Hiroshima Finance (Cayman) Limited|
|Hiroshima Preferred Capital Cayman Limited|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs

Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user selects a country Japan from the country highlight list in the graphs
When the user enters percentage as 9 in ownership percentage filter text box in the graphs
Then the user should not see the entities highlighted in the graphs
Then the user should see the list of owners in level 1, above the root entity, in the graphs
Then the user should see the list of owners in level 2, above the root entity, in the graphs
Then the user should not see any nodes in level 3, above the root entity, in the graphs
Then the user should not see any nodes in level 1, below the root entity, in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Japan (3)|

When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs
Then the user should not see any nodes in level 2, above the root entity, in the graphs
Then the user should not see any nodes in level 2, below the root entity, in the graphs
Then the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
And the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Japan (13)|

When the user enters percentage as 100 in ownership percentage filter text box in the graphs
Then the user should see the owners for the legal entity The Fukuoka Chuo Bank in the graphs
Then the user should not see the entities highlighted in the graphs
When the user unchecks direct relationship only filter checkbox in the graphs
Then the user should see, percent filter is reset to 0 for both input box and slider, in the graphs

When the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs
Then user is taken to the respective graph page of that legal entity <nodeTitle>

Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
And the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Japan (29)|

And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://accuity.lookbookhq.com/bankers-almanac-ubo/video?cmpid=ILC%7CBRSK%7CBAFPU-2016-0810-GLOB-ba-ubo%7CLookBook&sfid=701D0000000dwwH on accuity.com

Examples:
|fid|legalEntity|countValue|nodeTitle|
|30087|Japan Trustee Services|Appears: 3|The Howa Bank Ltd|

Scenario: KYC user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page