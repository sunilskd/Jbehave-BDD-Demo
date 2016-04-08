Meta:@owners @kyc

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities

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