Epic: UBO

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).

Covers below features:
JIRA ID - KYC-50 - UBO user can view direct owners list with people as owners
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities
JIRA ID - KYC-100 - KYC user can filter owners list by percent ownership
JIRA ID - KYC-91 - UBO user can view ownership list with non-entity, non-person owners

Meta:@uboowners @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: UBO user can view direct owners that are legal entities and people as owners
a. Person or institution or non enity owner is active and Ownership relationship is active (Display on direct owners list, sorted in list with other owner types first by percent ownership, then alphabetically by personSortKey)
   Person or institution or non enity owner has percent ownership (Display percent ownership on list, display meter on list)
b. If ownership relationship (with person or institution) does not have validated date, do not display validated date on list next to the record
   Ownership relationship has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
c. If ownership relationship (with non entity owners) does not have validated date, do not display validated date on list next to the record
   If entityReference/description and ownerType are present display owner as "ownerType, entityReference/description"
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the list of direct owners (person or institution or non entity) ordered by percentage ownership then asc by owners name for the selected institution in the owners page

Examples:
|fid|
|12538|
|257433|
|3112|

Scenario: Verify percentage meter bar for direct owners (person or institution or non-entity)
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the percentage meter bar in the direct owners list

Examples:
|fid|
|12538|

Scenario: If owner has null percent ownership, then do not display a percent on list, do not display meter, sort at the bottom of the list with other null percent ownerships
a. legal entity
b. person
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the list of direct owners (person or institution or non entity) ordered by percentage ownership then asc by owners name for the selected institution in the owners page
And the user should not see the percentage meter bar in the direct owners list

Examples:
|fid|
|94016|
|241440|

Scenario: UBO user can view direct owners that are legal entities and people as owners
Meta:@directOwners @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|VTB Bank (public joint-stock company)|Russian Federation|12.736|29 Mar 2011|
|Sberbank of Russia|Russian Federation|10.967|19 Nov 2010|
|'Vitabank' PJSC|Russian Federation|10.967|21 Aug 2005|
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|25 May 2012|
|Central Bank of the Russian Federation|Russian Federation|8.9|28 Oct 2011|
|Sviaz-Bank|Russian Federation|2.594|29 Oct 2010|
|Baltic Financial Agency Bank|Russian Federation|2.299|29 Oct 2010|
|Petersburg Settlement Centre Limited|Russian Federation|0.59|21 Aug 2005|

Examples:
|fid|
|46637|

Scenario: Verify no data found message when there are no direct owners
a. If there are no direct owners display "no results" for now
b. If person or institution ownership relationship is inactive, do not display that person or institution on owners list
c. If non entity owner ownership relationship is inactive, do not display that no entity owners on owners list
Meta:@directOwners @static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see message displayed in place of list explaining there are no direct owners

Examples:
|fid|
|1|
|30010|
|2162|

Scenario: KYC-100 Filter owners list by percent ownership
a. View all is selected by default (displays all direct owners regardless of percent ownership);
   Selecting 10 and above filters out any entity that has null or less than 10 ownership
b. Selecting 25 and above filters out any entity that has null or less than 25 ownership
c. Selecting 50 and above filters out any entity that has null or less than 50 ownership
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see the direct owners ordered by percentage ownership then asc by direct owners name (legal title or people as owners), filtered by selected percent filter, for the selected institution in the owners page

Examples:
|fid|percentFilter|
|12538|10||
|12538|25|
|248469|50|

Scenario: Select filter that results in no person or institution or non entity owners on the list (display no owners, display message no known entitiess)
Meta:@directOwners @static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see message displayed in place of list explaining there are no direct owners

Examples:
|fid|percentFilter|
|12538|50|

Scenario: Select a second filter (first filter is de-selected, list updates to match new filter)
Meta:@directOwners @static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see the percent filter View All de-selected in the owners page

Examples:
|fid|percentFilter|
|12538|10|

Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout