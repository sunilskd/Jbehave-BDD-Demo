Meta:@subsidiaries @kyc

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
JIRA ID - KYC-45 - KYC user can view direct subsidiaries

Scenario: KYC user can view direct subsidiaries
a. With percentage ownership; with country of operations; with active legal entity subsidiaries; with active subsidiary relationships
b. If percentage ownership is null then display record with no percentage ownership
c. If country of operations is not present then display records with no country
d. If legal entity subsidiaries are inactive do not display the records for inactive legal entity
e. If subsidiary relationships are inactive do not display the records for inactive subsidiaries relationship
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page
And the user should see the legal title <institutionLegalTitle> of the institution it is looking at in the subsidiaries page

Examples:
|fid|institutionLegalTitle|
|211|Australia and New Zealand Banking Group Limited|
|815|Banco Popular|
|146115|Investec Holdings (Ireland) Ltd|
|200|Public Bank (Hong Kong) Limited|
|1717|Berliner Volksbank eG|

Scenario: KYC user can view direct subsidiaries
Meta:@static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Public Finance Ltd|Hong Kong|100|
|Public Financial Securities Ltd|Hong Kong|100|

Examples:
|fid|
|200|

Scenario: Display message in place of subs list if no subsidiaries for entity user is viewing
a. If there are no subsidiaries display "no results" for now
Meta:@static @dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see message displayed in place of list explaining there are no subsidiaries

Examples:
|fid|
|269306|