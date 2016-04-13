Epic: UBO

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).
Covers below features:
JIRA ID - KYC-50 - UBO user can view direct owners list with people as owners
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities


Scenario: UBO user can view direct owners list with people as owners
a. Person is active and Ownership relationship is active (Display on direct owners list, sorted in list with other owner types
first by percent ownership, then alphabetically by personSortKey)
b. If person is inactive or ownership relationship is inactive, do not display that person on owners list
c. Person has percent ownership (Display percent ownership on list, display meter on list)
d. If person has null percent ownership, then do not display a percent on list, do not display meter, sort at the bottom of the list
with other null percent ownerships
e. If ownership relationship does not have validated date, do not display validated date on list next to the record
f. Ownership relationship has validated date with accuracy attribute of day, month or year (If day, display day, month and year.
If month, display only month and year. If year, display only year)



Scenario: KYC user can view direct owners that are legal entities
a. With percentage ownership; with country of operations; with active legal entity direct owners; with active direct owners relationships and validated date
b. KYC-166 - If accuracy is day, display day, month and year. If accuracy is month, display month and year. If accuracy is year, display only year
c. If country of operations is not present then display records with no country
Meta:@directOwners @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution <fid> in the owners page
And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|
|211|
|284626|
|179281|

Scenario: KYC-172 - Do not display the meter when the percentage ownership is null; KYC-189;
a. If percentage ownership is null then display record with no percentage ownership
b. KYC-170 - If validation date is not present then display record with no validation date
Meta:@directOwners @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution <fid> in the owners page
And the user should see not see the percentage meter bar in the direct owners list

Examples:
|fid|
|94016|
|91832|

Scenario: KYC user can view direct owners that are legal entities
Meta:@directOwners @static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
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
Meta:@directOwners @static @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see message displayed in place of list explaining there are no direct owners

Examples:
|fid|
|1|
|140612|
|46089|