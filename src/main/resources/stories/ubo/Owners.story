Epic: UBO

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).
Covers below features:
JIRA ID - KYC-50 - UBO user can view direct owners list with people as owners
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities



Scenario: UBO user can view direct owners that are legal entities and people as owners
a. With percentage ownership; with country of operations; with active legal entity direct owners; with active direct owners relationships; with active person direct owner;
   with person ownership relationship ; ordered by percentage ownership then asc by legal title and validated date
   If accuracy is day, display day, month and year. If accuracy is month, display month and year. If accuracy is year, display only year for both legal entities and people as owners
b. If country of operations is not present then display records with no country for both legal entities and people as owners
    KYC-170 - If validation date is not present then display record with no validation date for both legal entities and people as owners
Meta:@directOwners @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the list of direct owners ordered by percentage ownership then asc by direct owners name (legal title or people as owners) for the selected institution in the owners page
And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|
|12538|
|71650|
|30010|
|1078|

Scenario: KYC-172 - Do not display the meter when the percentage ownership is null; KYC-189;
a. If person has null percent ownership, then do not display a percent on list, do not display meter, sort at the bottom of the list with other null percent ownerships
Meta:@directOwners @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the list of direct owners ordered by percentage ownership then asc by direct owners name (legal title or people as owners) for the selected institution in the owners page
And the user should not see the percentage meter bar in the direct owners list

Examples:
|fid|
|94016|
|91832|

Scenario: UBO user can view direct owners that are legal entities and people as owners
Meta:@directOwners @static
Given the kyc user is on the ubo home page
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
b. If legal entity direct owner are inactive do not display the records for inactive legal entity
c. If direct owner relationships are inactive do not display the records for inactive direct ownership relationship
d. If person is inactive , do not display the records for inactive person on owners list
e. If person ownership relationship is inactive, do not display that person on owners list
Meta:@directOwners @static @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see message displayed in place of list explaining there are no direct owners

Examples:
|fid|
|1|
|140612|
|46089|

Scenario: KYC-100 Filter owners list by percent ownership
a. View all is selected by default (displays all direct owners regardless of percent ownership);
   Selecting 10 and above filters out any entity that has null or less than 10 ownership
b. Selecting 25 and above filters out any entity that has null or less than 25 ownership
c. Selecting 50 and above filters out any entity that has null or less than 50 ownership
Meta:@directOwners @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see the direct owners ordered by percentage ownership then asc by direct owners name (legal title or people as owners), filtered by selected percent filter, for the selected institution in the owners page


Examples:
|fid|percentFilter|
|147015|10||
|147015|25|
|147015|50|

Scenario: Select filter that results in no person owners on the list (display no owners, display message no known entitiess)
Meta:@directOwners @static @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see message displayed in place of list explaining there are no direct owners

Examples:
|fid|percentFilter|
|147015|10|

Scenario: Select a second filter (first filter is de-selected, list updates to match new filter)
Meta:@directOwners @static @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see the percent filter View All de-selected in the owners page

Examples:
|fid|percentFilter|
|147015|10|