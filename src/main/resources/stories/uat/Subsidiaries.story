Epic: Subsidiaries
----
.Overall Report

image:.uat.Subsidiaries.stats.png
----

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.

Covers below features:
JIRA ID - KYC-45 - KYC user can view direct subsidiaries
JIRA-ID - KYC-102 - KYC user can filter subsidiaries list by percent ownership
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-188 - Display relationship validated date on subsidiary list

Meta:@subsidiariesLive @live

Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page

Scenario: Covers below scenarios
a. 0. With percentage ownership; with country of operations; with validated date; with active legal entity subsidiaries; with active subsidiary relationships
   1. If validated date is not present then display records with no validated date
   2. If accuracy is day, display day, month and year. If accuracy is month, display month and year. If accuracy is year, display only year
   3. Legal entities in list have country of operations.
   4. List each unique country once, sort countries in highlight list alphabetically
   5. Select a country highlight, legal entities in the subsidiaries list that have that country of operations are highlighted
b. If percentage ownership is null then display record with no percentage ownership
c. 0. If country of operations is not present then display records with no country
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the subsidiaries summary selected by default in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
When the user selects a country <country> from the country highlight list in the subsidiaries page
Then the user should see the direct subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page

Examples:
|fid|country|
|211|Australia|
|815|Chile|
|146115|Ireland|

Scenario: User clicks and opens legal title of legal entity that appears in subsidiaries list in a new window
(user is taken to the subsidiaries list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Select a second filter (first filter is de-selected, list updates to match new filter)
View all is selected by default (displays all direct subsidiaries regardless of percent ownership)
   1. Selecting 10 and above filters out any entities owned by less than 10 or have null ownership
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the subsidiaries page
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see the percent filter View All de-selected in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the subsidiaries page
When the user clicks and opens the legal title BAMS Solutions Inc in subsidiaries list in new window in the subsidiaries page
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|VALIDATED DATE|
|Acceptance Alliance LLC|USA|||
|Banc of America Merchant Services LLC|USA|||

Examples:
|fid|percentFilter|
|1038|10|

Scenario: If there are no subsidiaries display "No known entities" for now;
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see message displayed in place of list explaining there are no subsidiaries
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see message displayed in place of list explaining there are no subsidiaries

Examples:
|fid|percentFilter|
|269306|10|

Scenario: KYC user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page