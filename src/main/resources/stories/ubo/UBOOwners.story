Epic: UBO

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
JIRA ID - KYC-90 -  UBO user can view list of UBOs

Meta:@owners @ubo @uboowners

Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Covers below scenarios
a. 0. Person or institution or other entity type owner is active and Ownership relationship is active (Display on direct owners list, sorted in list with other owner types first by percent ownership, then alphabetically by personSortKey)
   1. Person or institution or other entity type owner has percent ownership (Display percent ownership on list, display meter on list)
   2. If only ownerType is present display owner as "ownerType"
   3. Display source as "source, extended source" when both source and extended source are present
   4. Display source as "source" when only source is present
b. 0. If ownership relationship (with person or institution) does not have validated date, do not display validated date on list next to the record
   1. Ownership relationship has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
   2. Do not display source when source and extecnded source are not present
c. 0. If ownership relationship (with non-institution, non-person entity type owners) does not have validated date, do not display validated date on list next to the record
   1. If entityReference/description and ownerType are present display owner as "ownerType, entityReference/description"
d. If entityReference/description and ownerType are not present do not display owner name and display percent ownership and validated date in the direct owners list
e. If ownerType is not present display owner as "entityReference/description"
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the direct owners summary selected by default in the owners page
Then the ubo user should see the list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by owners name for the selected institution in the owners page
Then the ubo user should not see the free text at the bottom of the direct owner list for the selected institution in the owners page

Examples:
|fid|
|12538|
|257433|
|3112|
|28691|
|11262|

Scenario: Verify percentage meter bar for direct owners (person or institution or other entity type)
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
Then the ubo user should see the list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by owners name for the selected institution in the owners page
And the user should not see the percentage meter bar in the direct owners list

Examples:
|fid|
|94016|
|241440|

Scenario: UBO user can view direct owners that are legal entities and people as owners.
Meta:@directOwners @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Others||42.3|10 Mar 2016|HomeTown Bank National Association|
|Moody Bank Holding Company Inc|USA|25.38|Mar 2016|HomeTown Bank National Association|
|Directors, Directors and Officers of the Bank||16.76|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Anthony G. Buzbee||3.75|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|G. William Rider||3.41|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|T. A. Waterman,, Jr||2.34|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Jimmy Rasmussen||1.84|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Stacy Dienst||1.02|10 Mar 2016|HomeTown Bank National Association|
|Maurice Estlinbaum||0.76|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Robert L. Moody, Jr||0.52|10 Mar 2016|HomeTown Bank National Association|
|Greg S. Garison||0.43|10 Mar 2016|HomeTown Bank National Association|
|Sidney C. Farmer, III||0.34|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Dorothea Matthews Balentine||0.31|10 Mar 2016|HomeTown Bank National Association|
|Joe Saladino||0.3|10 Mar 2016|HomeTown Bank National Association, Third Party Supplier|
|Kent Ballard||0.29|10 Mar 2016|HomeTown Bank National Association|
|Michael J. Gaido,, Jr||0.26|10 Mar 2016|HomeTown Bank National Association|
|E. Vince Matthews, III||0.26|10 Mar 2016|HomeTown Bank National Association|
|Bob Pagan||0.26|10 Mar 2016|HomeTown Bank National Association|

When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see the below list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Others||42.3|10 Mar 2016|HomeTown Bank National Association|
|Moody Bank Holding Company Inc|USA|25.38|Mar 2016|HomeTown Bank National Association|

And the user should see the percentage meter bar in the direct owners list
When the user changes the percent filter option to View All in the owners page
Then the ubo user should see the below list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Others||42.3|10 Mar 2016|HomeTown Bank National Association|
|Moody Bank Holding Company Inc|USA|25.38|Mar 2016|HomeTown Bank National Association|
|Directors, Directors and Officers of the Bank||16.76|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Anthony G. Buzbee||3.75|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|G. William Rider||3.41|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|T. A. Waterman,, Jr||2.34|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Jimmy Rasmussen||1.84|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Stacy Dienst||1.02|10 Mar 2016|HomeTown Bank National Association|
|Maurice Estlinbaum||0.76|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Robert L. Moody, Jr||0.52|10 Mar 2016|HomeTown Bank National Association|
|Greg S. Garison||0.43|10 Mar 2016|HomeTown Bank National Association|
|Sidney C. Farmer, III||0.34|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Dorothea Matthews Balentine||0.31|10 Mar 2016|HomeTown Bank National Association|
|Joe Saladino||0.3|10 Mar 2016|HomeTown Bank National Association, Third Party Supplier|
|Kent Ballard||0.29|10 Mar 2016|HomeTown Bank National Association|
|Michael J. Gaido,, Jr||0.26|10 Mar 2016|HomeTown Bank National Association|
|E. Vince Matthews, III||0.26|10 Mar 2016|HomeTown Bank National Association|
|Bob Pagan||0.26|10 Mar 2016|HomeTown Bank National Association|

And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|percentFilter|
|12538|25|

Scenario: User clicks and opens legal title of legal entity that appears in direct owners list in a new window
(user is taken to the direct owners list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@directOwners @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
When the user clicks and opens the legal title Moody Bank Holding Company Inc in direct owners list in new window in the owners page
Then the ubo user should see the below list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Moody Bancshares Inc|USA||09 Feb 2001|wzskezdtlyvbyro, Third Party Supplier|

Examples:
|fid|
|12538|

Scenario: Covers below scenarios
a. If there are no direct owners display "no results" for now
b. If person or institution ownership relationship is inactive, do not display that person or institution on owners list
c. If non entity or person owner ownership relationship is inactive, do not display those other entity type owners on owners list
Meta:@directOwners @static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see message displayed in place of list explaining there are no direct owners

Examples:
|fid|
|1|
|30010|
|2162|

Scenario: Covers below scenarios
a. 0. View all is selected by default (displays all direct owners regardless of percent ownership);
   1. Selecting 10 and above filters out any entity that has null or less than 10 ownership
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

Scenario: Select filter that results in no person or institution or non entity owners on the list (display no owners, display message no known entities)
Meta:@directOwners @static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the user should see message displayed in place of list explaining there are no direct owners

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
Then the user should see the percent filter View All de-selected in the owners page

Examples:
|fid|percentFilter|
|12538|10|

Scenario: UBO User can view list of all UBOs
a. 0. UBO user can view all direct and indirect owners that are people, in the ownership path of an enity.
   1. UBOs are ordered by percentage ownership, then alphabetically by personSortKey.
   2. UBOs has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
   3. Unique UBO that owns multiple entities should be displayed in the UBO(Example person G)
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|QA Test Person C|QA Legal Entity D|50.52|27 Mar 2015|
|QA Test Person G|QA Legal Entity B|50.222|27 Mar 2015|
|QA Test Person D|QA Legal Entity C|49.23|27 Mar 2015|
|QA Test Person E|QA Legal Entity A|49.23|27 Mar 2015|
|QA Test Person H|QA Legal Entity D|49.23|27 Mar 2015|
|QA Test Person A|QA Legal Entity A|45.52|Mar 2015|
|QA Test Person B|QA Legal Entity B|40.23|27 Mar 2015|
|QA Test Person G|QA Legal Entity C|4.93|27 Mar 2015|
|QA Test Person G|QA Legal Entity D|4.23|27 Mar 2015|

Examples:
|fid|
|LE-A|

Scenario: UBO User can view list of Direct and Indirect UBOs, and not Inactive ownership relationship
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|QA Test Person C|QA Legal Entity D|50.52|27 Mar 2015|
|QA Test Person D|QA Legal Entity C|49.23|27 Mar 2015|
|QA Test Person H|QA Legal Entity D|49.23|27 Mar 2015|
|QA Test Person G|QA Legal Entity C|4.93|27 Mar 2015|
|QA Test Person G|QA Legal Entity D|4.23|27 Mar 2015|

Examples:
|fid|
|LE-C|

Scenario: UBO User can view multiple UBOs of the same enity
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|QA Test Person G|QA Legal Entity B|50.222|27 Mar 2015|
|QA Test Person B|QA Legal Entity B|40.23|27 Mar 2015|

Examples:
|fid|
|LE-B|

Scenario: UBO User can view UBOs when % ownership is null
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|Japan Finance Corporation|Japan Bank For International Cooperation||11 Nov 2011|

Examples:
|fid|
|241440|

Scenario: If there are no UBOs exists, display "No known entities"
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see message displayed in place of list explaining there are no UBOs

Examples:
|fid|
|211|

Scenario: UBO User can view list of all UBOs
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|Anthony G. Buzbee|HomeTown Bank National Association|3.75|10 Mar 2016|
|G. William Rider|HomeTown Bank National Association|3.41|10 Mar 2016|
|T. A. Waterman,, Jr|HomeTown Bank National Association|2.34|10 Mar 2016|
|Jimmy Rasmussen|HomeTown Bank National Association|1.84|10 Mar 2016|
|Stacy Dienst|HomeTown Bank National Association|1.02|10 Mar 2016|
|Maurice Estlinbaum|HomeTown Bank National Association|0.76|10 Mar 2016|
|Robert L. Moody, Jr|HomeTown Bank National Association|0.52|10 Mar 2016|
|Greg S. Garison|HomeTown Bank National Association|0.43|10 Mar 2016|
|Sidney C. Farmer, III|HomeTown Bank National Association|0.34|10 Mar 2016|
|Dorothea Matthews Balentine|HomeTown Bank National Association|0.31|10 Mar 2016|
|Joe Saladino|HomeTown Bank National Association|0.3|10 Mar 2016|
|Kent Ballard|HomeTown Bank National Association|0.29|10 Mar 2016|
|Michael J. Gaido,, Jr|HomeTown Bank National Association|0.26|10 Mar 2016|
|E. Vince Matthews, III|HomeTown Bank National Association|0.26|10 Mar 2016|
|Bob Pagan|HomeTown Bank National Association|0.26|10 Mar 2016|

Examples:
|fid|
|12538|

Scenario: UBO user logout
Given the user is on the ubo login page
When the user logout