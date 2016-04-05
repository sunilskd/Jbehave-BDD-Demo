Meta:@Owners @kyc

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities

Scenario: KYC user can view direct owners that are legal entities
a. with percentage ownership
b. with percentage null
c. KYC-166 - Respect date accuracy
d. KYC-170 - No validation date
Meta:@directOwners @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution <fid> in the owners page

Examples:
|fid|
|211|
|94016|
|284626|
|91832|

Scenario: KYC user can view direct owners that are legal entities
Meta:@directOwners @static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|VTB Bank (public joint-stock company)|Russian Federation|12.736%|29 Mar 2011|
|'Vitabank' PJSC|Russian Federation|10.967%|21 Aug 2005|
|Sberbank of Russia|Russian Federation|10.967%|19 Nov 2010|
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9%|25 May 2012|
|Central Bank of the Russian Federation|Russian Federation|8.9%|28 Oct 2011|
|Sviaz-Bank|Russian Federation|2.594%|29 Oct 2010|
|Baltic Financial Agency Bank|Russian Federation|2.299%|29 Oct 2010|
|Petersburg Settlement Centre Limited|Russian Federation|0.59%|21 Aug 2005|

Examples:
|fid|
|46637|

Scenario: Verify no data found message when there are no direct owners
Meta:@directOwners @static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the message no data found for the selected institution in the owners page

Examples:
|fid|
|1|
