Epic: UBO
----
.Overall Report

image:.uat.UBOs.stats.png
----

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).

----
image:UBO.png[UBO]
----

UBO user has access to below entity types -
1. Person
2. Legal Entities
3. Other entity types (non-institution, non-person)
4. UBO list

UBO user does not has access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-90 -  UBO user can view list of UBOs
JIRA ID - KYC-253 - Add source to UBO list
JIRA ID - KYC-195 - UBO user can filter UBO list by percent ownership
JIRA ID - KYC-315 - UBO list - dates are not displayed.

Meta:@ubosLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: UBO User can view list of all UBOs
a. 0. UBO user can view all direct and indirect owners that are people, in the ownership path of an enity.
   1. UBOs are ordered by percentage ownership, then alphabetically by personSortKey.
   2. Do not display source when source and extecnded source are not present
   3. UBO User can view multiple UBOs of the same enity
   4. There are no UBOs to display, then display "No known entities"
   5. User selects view all filter, then display entire UBO list.
   6. UBO user can filter UBO list by percent ownership
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Agnew Meyer Robert|Banco BISA SA|1.24|||
|Jose Luis Aranguren Aguirre|Banco BISA SA|0.88|||
|Jorge Eduardo Rengel Sillerico|Banco BISA SA|0.68|||
|Tomás Barrios Santivañez|Banco BISA SA|0.23|||

When the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see message displayed in place of list explaining there are no UBOs
When the user changes the percent filter option to View All in the owners page

Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Agnew Meyer Robert|Banco BISA SA|1.24|||
|Jose Luis Aranguren Aguirre|Banco BISA SA|0.88|||
|Jorge Eduardo Rengel Sillerico|Banco BISA SA|0.68|||
|Tomás Barrios Santivañez|Banco BISA SA|0.23|||

Examples:
|fid|percentFilter|
|104464|10|


Scenario: Covers below scenario
a. 0. UBOs has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
   1. UBOs has source as "source, extended source" when both source and extended source are present
   2. Display source as "source" when only source is present
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Mrs Nada Aoueini|BLOM BANK SAL|5|09 Mar 2016|BLOM BANK SAL, direct from institution|

Examples:
|fid|
|225719|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page