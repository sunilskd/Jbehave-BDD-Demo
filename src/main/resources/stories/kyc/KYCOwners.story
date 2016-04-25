Epic: Ownership

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
A key part of this process is to find out if there are any owners of the bank they will potentially do business which are known to be risky or involved in criminal activities.

Covers below features:
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities
JIRA ID - KYC-100 - KYC user can filter owners list by percent ownership
JIRA ID - KYC-72 - KYC user can click link to another entity in ownership list
JIRA ID - KYC-172 - Do not display the meter when the percentage ownership is null
JIRA ID - KYC-189 - Direct Owners - Last validated date is incorrect
JIRA ID - KYC-166 - Respect the validation date accuracy
JIRA ID - KYC-170 - If validation date is not present then display record with no validation date

Meta:@owners @kyc @kycowners

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC user can view direct owners that are legal entities
a. With percentage ownership; with country of operations; with active legal entity direct owners; with active direct owners relationships and validated date
b. If accuracy is day, display day, month and year. If accuracy is month, display month and year. If accuracy is year, display only year
c. If country of operations is not present then display records with no country
d. Do not display person or non entity as owners for KYC users
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|
|211|
|284626|
|179281|
|12538|

Scenario: Do not display the meter when the percentage ownership is null
a. If percentage ownership is null then display record with no percentage ownership
b. If validation date is not present then display record with no validation date
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
And the user should not see the percentage meter bar in the direct owners list

Examples:
|fid|
|94016|
|91832|

Scenario: KYC user can view direct owners that are legal entities
Meta:@directOwners @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|VTB Bank (public joint-stock company)|Russian Federation|12.736|29 Mar 2011|
|Sberbank of Russia|Russian Federation|10.967|19 Nov 2010|
|'Vitabank' PJSC|Russian Federation|10.967|21 Aug 2005|
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|25 May 2012|
|Central Bank of the Russian Federation|Russian Federation|8.9|28 Oct 2011|
|Sviaz-Bank|Russian Federation|2.594|29 Oct 2010|
|Baltic Financial Agency Bank|Russian Federation|2.299|29 Oct 2010|
|Petersburg Settlement Centre Limited|Russian Federation|0.59|21 Aug 2005|

When the user selects the percent filter option <percentFilter> in the owners page
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|VTB Bank (public joint-stock company)|Russian Federation|12.736|29 Mar 2011|
|Sberbank of Russia|Russian Federation|10.967|19 Nov 2010|
|'Vitabank' PJSC|Russian Federation|10.967|21 Aug 2005|
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|25 May 2012|
And the user should see the percentage meter bar in the direct owners list

When the user changes the percent filter option to View All in the owners page
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|VTB Bank (public joint-stock company)|Russian Federation|12.736|29 Mar 2011|
|Sberbank of Russia|Russian Federation|10.967|19 Nov 2010|
|'Vitabank' PJSC|Russian Federation|10.967|21 Aug 2005|
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|25 May 2012|
|Central Bank of the Russian Federation|Russian Federation|8.9|28 Oct 2011|
|Sviaz-Bank|Russian Federation|2.594|29 Oct 2010|
|Baltic Financial Agency Bank|Russian Federation|2.299|29 Oct 2010|
|Petersburg Settlement Centre Limited|Russian Federation|0.59|21 Aug 2005|
And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|percentFilter|
|46637|10|

Scenario: User clicks and opens legal title of legal entity that appears in direct owners list in a new window
(user is taken to the direct owners list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@directOwners @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
When the user clicks and opens the legal title Sberbank of Russia in direct owners list in new window in the owners page
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|
|Central Bank of the Russian Federation|Russian Federation|52.32|01 Mar 2013|

Examples:
|fid|
|46637|

Scenario: Verify no data found message when there are no direct owners
a. If there are no direct owners display "No known entities" for now
b. If direct owner is inactive do not display the inactive direct owner legal entity
c. If direct owner relationships are inactive do not display the records for inactive direct ownership relationship
Meta:@directOwners @static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see message displayed in place of list explaining there are no direct owners

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
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the kyc user should see the direct owners ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the owners page

Examples:
|fid|percentFilter|
|211|10||
|1038|25|
|1045|50|

Scenario: Select filter that results in no entities on the list (display no owners, display message no known entitiess)
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
|94016|10|

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
|94016|10|

Scenario: User clicks legal title of legal entity that appears in direct owners list (user is taken to the direct owners list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the legal title HSBC Custody Nominees (Australia) Limited in direct owners list in the owners page
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page

Examples:
|fid|
|211|

Scenario: User clicks and opens legal title of legal entity that appears in direct owners list in a new window
(user is taken to the direct owners list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@directOwners @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks and opens the legal title HSBC Custody Nominees (Australia) Limited in direct owners list in new window in the owners page
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page

Examples:
|fid|
|211|

Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout
