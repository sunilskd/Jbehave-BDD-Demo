Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC-104 - KYC user can filter subsidiary graph by percent ownership
b. If user moves slider to percent 1-100, null percent subsidiaries are filtered out and not displayed on the graph, input box automatically updates to reflect percent selected by slider, only subsidiaries that are owned by equal to or greater than selected percent appear on the graph
c. If user moves slider to 0 percent, all subsidiaries appear on graph
h. User applies percent filter that results in no subsidiaries on the graph, display message "No known entities."
Scenario:
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
Then the user should see, by default, percent filter set to 0 for both input box and slider, in the graph
When the user enters percentage as 25 in ownership percentage text box in the subsidiaries graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the subsidiaries graph

And the user should see the list of below subsidiaries in level 1, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 3425.9Australia|
|QA Legal Entity 550.53Korea (Republic of)|
|QA Legal Entity 359.53India|

And the user should see the list of below subsidiaries in level 2, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 149.53UK|
|QA Legal Entity 250.53USA|

And the user should see the list of below subsidiaries in level 3, below the root entity, in the subsidiaries graph
|NODES|
|QA Legal Entity 150.52UK|

Examples:
|fid|
|LE-6|