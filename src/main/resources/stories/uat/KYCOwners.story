Epic: Ownership

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
A key part of this process is to find out if there are any owners of the bank they will potentially do business which are known to be risky or involved in criminal activities.

KYC user has access to below entity types -
1. Legal Entities
2. Free text ownership

KYC user does not has access to below entity types -
1. Person
2. UBO list
3. Other entity types (non-institution, non-person)

Covers below features:
JIRA ID - KYC-64 - KYC user can view direct owners that are legal entities
JIRA ID - KYC-100 - KYC user can filter owners list by percent ownership
JIRA ID - KYC-115 - KYC user can view ownership free text in owners list
JIRA-ID - KYC-106- KYC user can highlight legal entities by country in direct owners list
JIRA ID - KYC-72 - KYC user can click link to another entity in ownership list
JIRA ID - KYC-172 - Do not display the meter when the percentage ownership is null
JIRA ID - KYC-189 - Direct Owners - Last validated date is incorrect
JIRA ID - KYC-166 - Respect the validation date accuracy
JIRA ID - KYC-170 - If validation date is not present then display record with no validation date
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-244 - In case only ownership free text exists on the owners list, no legal entities on the list then display free text, do not display "No known entities." message.
JIRA ID - KYC-147 - Display only the first summary if there are multiple on the legal entity doc
JIRA ID - KYC-131 - Restrict entity types displayed on direct owners list by UBO user permission
JIRA ID - KYC-140 - Display source on owners list
JIRA ID - KYC-271 - When only extended source is present the source is not displaying.
JIRA ID - KYC-90 - UBO user can view list of UBOs
JIRA ID - KYC-52 - User will see in product message on owners list if they do not have access to UBO data
JIRA ID - KYC-250 - User can click hyperlink "please subscribe" in UBO in product message

Meta:@live @kycownersLive

Scenario: KYC user login
Given the user is on bankers almanac page
When the user login as a kyc user to bankers almanac page

Scenario: Covers below scenarios
a. 0. With percentage ownership; with country of operations; with active legal entity direct owners; with active direct owners relationships validated date and source
   1. Display source as "source, extended source" when both source and extended source are present
   2. Display source as "source" when only source is present
   3. Do not display source when source and extecnded source are not present
   4. Ownership free text exists on legal entity doc (display at bottom of list, do not display a meter for free text)
   5. Ownership free text exists and there are legal entities on owners list (display both, free text at bottom of list)
   6. Do not display UBO section when UBOs do not exist
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see the direct owners summary selected by default in the owners page
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|
|211|


Scenario: KYC user can view direct owners that are legal entities and free text
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|VTB Bank (PJSC)|Russian Federation|12.736|||
|'Vitabank' PJSC|Russian Federation|10.967|||
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|||
|Central Bank of the Russian Federation|Russian Federation|8.9|||
|Sviaz-Bank|Russian Federation|2.594|||
|Baltic Financial Agency Bank|Russian Federation|2.299|||
|Petersburg Settlement Centre Limited|Russian Federation|0.59|||

Then the kyc user should see the free text <directOwnerFreeText> at the bottom of the direct owner list for the selected institution in the owners page
Then the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the owners page
When the user selects the percent filter option <percentFilter> in the owners page
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|VTB Bank (PJSC)|Russian Federation|12.736|||
|'Vitabank' PJSC|Russian Federation|10.967|||
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|||

Then the kyc user should see the free text <directOwnerFreeText> at the bottom of the direct owner list for the selected institution in the owners page
And the user should see the percentage meter bar in the direct owners list

When the user changes the percent filter option to View All in the owners page
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|VTB Bank (PJSC)|Russian Federation|12.736|||
|'Vitabank' PJSC|Russian Federation|10.967|||
|Public Joint-Stock Company 'Baltiyskiy Bank'|Russian Federation|10.9|||
|Central Bank of the Russian Federation|Russian Federation|8.9|||
|Sviaz-Bank|Russian Federation|2.594|||
|Baltic Financial Agency Bank|Russian Federation|2.299|||
|Petersburg Settlement Centre Limited|Russian Federation|0.59|||

Then the kyc user should see the free text <directOwnerFreeText> at the bottom of the direct owner list for the selected institution in the owners page
And the user should see the percentage meter bar in the direct owners list

Examples:
|fid|percentFilter|directOwnerFreeText|
|46637|10|City Property Management Committee, 1.297|

Scenario: User clicks and opens legal title of legal entity that appears in direct owners list in a new window
(user is taken to the direct owners list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
When the user clicks and opens the legal title Central Bank of the Russian Federation in direct owners list in new window in the owners page
Then the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|State of the Russian Federation|Russian Federation|100|01 Feb 2016|Central Bank of the Russian Federation, from institution's website|

Examples:
|fid|
|46637|

Scenario: Covers below scenarios
a. If there are no direct owners display "No known entities" for now
b. If direct owner is inactive do not display the inactive direct owner legal entity
c. If direct owner relationships are inactive do not display the records for inactive direct ownership relationship
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see message displayed in place of list explaining there are no direct owners
And the user should not see the ubo list header and the message that there are no ubos in the owners page

Examples:
|fid|
|136093|

Scenario: Covers below scenarios
a. 0. Legal entities in list have country of operations.
   1. Select a country highlight, legal entities in the owners list that have that country of operations are highlighted
   2. Select a second country (de-selects previous filter, highlight legal entities by new selected country and removes highlight of legal entities by previous country)
   3. List each unique country once, sort countries in highlight list alphabetically
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
When the user selects a country <country> from the country highlight list in the owners page
Then the user should see the direct owners in the owners list that have the selected country of operations highlighted in the owners page
Then the user should see the list of unique country of operations for each direct owners to highlight, sorted alphabetically, in the owners page
When the user selects another country <changeCountry> from the country highlight list in the owners page
Then the user should see the direct owners in the owners list that have the selected country of operations highlighted in the owners page
And the previously selected country <country> should be de-selected in the owners page

Examples:
|fid|country|changeCountry|
|173|Jordan|Lebanon|



Scenario: KYC user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page