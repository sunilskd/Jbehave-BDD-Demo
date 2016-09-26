Epic: UBO
----
.Overall Report

image:.uat.UBOOwners.stats.png
----

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).

UBO user has access to below entity types -
1. Person
2. Legal Entities
3. Other entity types (non-institution, non-person)
4. UBO list

UBO user does not has access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-50 - UBO user can view direct owners list with people as owners
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities
JIRA ID - KYC-100 - KYC user can filter owners list by percent ownership
JIRA ID - KYC-91 - UBO user can view ownership list with non-entity, non-person owners
JIRA ID - KYC-72 - KYC user can click link to another entity in ownership list
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-131 - Restrict entity types displayed on direct owners list by UBO user permission

Meta:@uboownersLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: Covers below scenarios
a. 0. Person or institution or other entity type owner is active and Ownership relationship is active (Display on direct owners list, sorted in list with other owner types first by percent ownership, then alphabetically by personSortKey)
   1. Person or institution or other entity type owner has percent ownership (Display percent ownership on list, display meter on list)
   2. If only ownerType is present display owner as "ownerType"
   3. Display source as "source, extended source" when both source and extended source are present
   4. Display source as "source" when only source is present
   5. Do not display source when source and extecnded source are not present
b. 0. If ownership relationship (with non-institution, non-person entity type owners) does not have validated date, do not display validated date on list next to the record
   1. If entityReference/description and ownerType are present display owner as "ownerType, entityReference/description"
   2. Ownership relationship has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
c. 0. If entityReference/description and ownerType are not present do not display owner name and display percent ownership and validated date in the direct owners list
d. 0. If ownerType is not present display owner as "entityReference/description"
   1. If ownership relationship (with person or institution) does not have validated date, do not display validated date on list next to the record
   2. Verify percentage meter bar for direct owners (person or institution or other entity type)
e. 0. UBO user can view direct owners that has people as owners.
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the direct owners summary selected by default in the owners page
Then the ubo user should see the list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by owners name for the selected institution in the owners page
Then the ubo user should not see the free text at the bottom of the direct owner list for the selected institution in the owners page
Then the user should see the percentage meter bar in the direct owners list

Examples:
|fid|
|12538|
|3112|
|28691|
|11262|
|242960|

Scenario: Covers below scenarios
a. 0. User clicks and opens legal title of legal entity that appears in direct owners list in a new window
      (user is taken to the direct owners list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
   1. Select a second filter (first filter is de-selected, list updates to match new filter)
   2. View all is selected by default (displays all direct owners regardless of percent ownership);
   3. Selecting 10 and above filters out any entity that has null or less than 10 ownership
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the user should see the percent filter View All de-selected in the owners page
When the user clicks and opens the legal title Moody Bank Holding Company Inc in direct owners list in new window in the owners page
Then the ubo user should see the below list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Moody Bancshares Inc|USA||||

Examples:
|fid|percentFilter|
|12538|10|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page