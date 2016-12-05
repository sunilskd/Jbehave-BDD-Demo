Epic: Ownership

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
A key part of this process is to find out if there are any owners of the bank they will potentially do business which are known to be risky or involved in criminal activities. The graphs provides information about owners in a visual way so that it is easier to follow relationship paths.

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not have access to below entity types -
1. Person (UBOs)
2. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-112 - KYC user can view free text ownership on owners graphs
JIRA ID - KYC-37 - KYC user can filter owners graphs by percent ownership
JIRA ID - KYC-34 - KYC user can view owners graphs
JIRA ID - KYC-138 - Owners graphs - Direct-Indirect filter
JIRA ID - KYC-105 - KYC user can highlight legal entities by country in ownership graphs
JIRA ID - KYC-114 - UBO user can view non-person, non-entity owners on owners graphs
JIRA ID - KYC-254 - Side panel for free text ownership on owners graphs
JIRA ID - KYC-33 - KYC user can see visual indicator for entity that appears multiple times in the ownership graphs
JIRA ID - KYC-229 - UBO user can highlight UBOs on graphs
JIRA ID - KYC-330 - Remove links for person,non-entity or non-person in graphs
JIRA ID - KYC-155 - User will see in product message on owners graph if they do not have access to UBO data
JIRA ID - KYC-250 - User can click hyperlink "please subscribe" in UBO in product message
JIRA ID - KYC-392 - % filter input box is not resetting to 100% when user enters more than 100% in % input box in graph page.
JIRA ID - KYC-386 - User can click "more" link from truncated graph to open another graph
JIRA ID - KYC-455 - new truncation logic owners graph
JIRA ID - KYC-571 - Grey out UBO highlight field label when the highlight is unavailable
JIRA ID - KYC-480 - Percent filter should not filter out null percent relationships

Meta:@kycownersgraphsLive @live

Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page

Scenario: KYC user views owners graph
a. 0. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity as owner on graph above the entity it owns.
   1. Ownership relationship has percent ownership, display percent on owner's node on graph
   2. Ownership relationship has null percent ownership, do not display percent ownership on owner node on graph
   3. Free text ownership exists for entity user is viewing, display that free text in a node as a direct owner of the root node
   4. Free text ownership does not exist for entity user is viewing, do not display free text as owner on owners graph
   10. User will see in product message on owners graph if they do not have access to UBO data and UBOs exisits fot the entity user is viewing.
   11. "No country highlight" is default selection in country highlight drop-down
   12. List country of operations for legal entities that appear on the graph in highlight drop-down, each unique country appearing once, sort countries alphabetically by country name
   13. Select a country highlight, legal entities in the owners graph that have that country of operations are highlighted (including root node of graph if applicable)
   14. If user selects a second country in highlight drop-down, highlight legal entities by new selected country and remove highlight of legal entities by previous country)
   15. Select "No country highlight", removes country highlight of legal entities
   16. By default, percent filter is set to 0 for both input box and slider, all owners are displayed in the graph
   17. If user enters a number between 1-100 in input box, slider position automatically updates to match percent entered, only owners that are owned by equal to or greater than selected percent appear on the graph
   18. User selects "Direct Relationships Only", then graph updates to only show direct owners (level 1 of graph)
   19. By default UBO highlight checkbox is available on owners graph, but is disabled for KYC user and not selectable
   20. Display the free text when the % filters are applied
   21. Verify Country highlight drop-down only lists country of operations for legal entities displayed on the graph, not entities that were truncated and not displayed
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity Banco Indusval SA, user is currently viewing, as the root and highlighted on the graphs
When the user resize graph to translate(1003.9459234383133,436.36120867136754) scale(0.27509397800157526)
Then the user should see the list of owners in level 1, above the root entity, in the graphs
Then the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5
And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
Then the user should see the ultimate beneficial owners filter checkbox and the label disabled/grayed in the graph
When the user clicks on <legalEntity> node which appears more than once in the graphs
Then the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs
Then the user should see no country highlight selected by default in country highlight drop-down in the graphs
When the user selects a country UK from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|Generation Investment Management Ll|

When the user selects another country Belgium from the country highlight list in the graphs
Then the user should see the below entities that have the selected country of operations highlighted in the graphs
|NODES|
|The Bank of New York Mellon SA/NV 10|

When the user de-selects the selected country by selecting No country highlight from the country highlight list in the graphs
Then the user should not see the entities highlighted in the graphs

Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs
When the user enters percentage as 68 in ownership percentage filter text box in the graphs
Then the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs
|COUNTRIES|
|No country highlight|
|Brazil (1)|

Then the user should not see any nodes in level 2, above the root entity, in the graphs
When the user clicks on direct relationship only filter checkbox in the graphs
Then the user should see the list of owners in level 1, above the root entity, in the graphs
Then the user should not see any nodes in level 2, above the root entity, in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://accuity.lookbookhq.com/bankers-almanac-ubo/video?cmpid=ILC%7CBRSK%7CBAFPU-2016-0810-GLOB-ba-ubo%7CLookBook&sfid=701D0000000dwwH on accuity.com

Examples:
|fid|legalEntity|
|732|MSL Inc|


Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page