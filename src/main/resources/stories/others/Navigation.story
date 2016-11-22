Epic - Ownership
----
.Overall Report

image:.others.Navigation.stats.png[Navigation]
----

Covers below features:
JIRA ID - KYC-573 - User will go to similar data view when navigating between ownership tabs

Meta:@navigation

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Verify navigation to and from summary or list
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the direct owners summary selected by default in the owners page
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
When the user clicks on the subsidiaries tab
Then the user should see the subsidiaries summary selected by default in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
When the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
When the user clicks on the owners tab
Then the user should see the direct owners summary selected by default in the owners page
When the user clicks on the subsidiaries tab
Then the user should see the subsidiaries summary selected by default in the subsidiaries page

Examples:
|fid|country|
|211|New Zealand|

Scenario: Verify navigation to and from graph
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
When the user clicks on the subsidiaries tab
Then the user should see the subsidiaries graph
When the user clicks on the group structure tab
Then the user should see the full graph
When the user clicks on the owners tab
Then the user should see the owners graph
When the user clicks on the subsidiaries tab
Then the user should see the subsidiaries graph

Examples:
|fid|
|LE-6|

Scenario: Verify navigation from entity details page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
And the user clicks on the ownership tab
When the user selects a country <country> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
When the user clicks on the graph button
Then the user should see the full graph
When the user clicks on the entity details tab
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page

Examples:
|fid|country|
|211|New Zealand|