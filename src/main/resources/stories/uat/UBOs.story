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
   4. User selects view all filter, then display entire UBO list.
   5. UBO user can filter UBO list by percent ownership
   6. UBOs has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
   7. UBOs has source as "source, extended source" when both source and extended source are present
   8. Display source as "source" when only source is present
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Roberto Rojas|Banco Union SA|1.4071|||
|Agnew Meyer|Banco BISA SA|1.24|||
|Jose Luis Aranguren Aguirre|Banco BISA SA|0.88|||
|Jorge Eduardo Rengel Sillerico|Banco BISA SA|0.68|||
|Tomás Barrios Santivañez|Banco BISA SA|0.23|||
|Jorge Guillermo Valdez|Banco Union SA|0.023|||
|Ronald Justiniano Landivar|Banco Union SA|0.0043|11 Nov 2016|Banco Union SA, direct from institution|
|Juan Guillen Caballero|Banco Union SA|0.0028|11 Nov 2016|Banco Union SA, direct from institution|
|Osvaldo Gutirrrez Jimenez|Banco Union SA|0.0028|11 Nov 2016|Banco Union SA, direct from institution|
|Robin Gabriel Barragan Ibarguen|Banco Union SA|0.0027|11 Nov 2016|Banco Union SA, direct from institution|
|Edgar Pena Gutierrez|Banco Union SA|0.0027|11 Nov 2016|Banco Union SA, direct from institution|
|Jose Carlos Garrett Zamora|Banco Union SA|0.0021|11 Nov 2016|Banco Union SA, direct from institution|
|Roger Rivera lopez|Banco Union SA|0.0012|11 Nov 2016|Banco Union SA, direct from institution|
|Hugo Spechar Gonzales|Banco Union SA|0.0011|11 Nov 2016|Banco Union SA, direct from institution|
|Jorge Bendeck Telchi|Banco Union SA|0.0009|11 Nov 2016|Banco Union SA, direct from institution|
|Miriam Zenteno|Banco Union SA|0.0009|11 Nov 2016|Banco Union SA, direct from institution|
|Alvaro Rodrigo Pinilla Romero|Banco Union SA|0.0008|11 Nov 2016|Banco Union SA, direct from institution|
|Mario Gil Sosa|Banco Union SA|0.0005|11 Nov 2016|Banco Union SA, direct from institution|
|Pedro Antonio Yovhio Ferreira|Banco Union SA|0.0004|11 Nov 2016|Banco Union SA, direct from institution|
|Fanny Zamora Garret|Banco Union SA|0.0003|11 Nov 2016|Banco Union SA, direct from institution|
|Roberto Abrahan Telchi Asbun|Banco Union SA|0.0003|11 Nov 2016|Banco Union SA, direct from institution|
|Felix Velasco Guaman|Banco Union SA|0.0002|11 Nov 2016|Banco Union SA, direct from institution|
|Carlos Alberto Antelo Justiniano|Banco Union SA|0.0001|11 Nov 2016|Banco Union SA, direct from institution|
|Marcelo Arduz Tomianovich|Banco Union SA|0.0001|11 Nov 2016|Banco Union SA, direct from institution|
|Rene Valdivia Borda|Banco Union SA|0.0001|11 Nov 2016|Banco Union SA, direct from institution|
|Ernesto Arduz Tomianovich|Banco Union SA|0|11 Nov 2016|Banco Union SA, direct from institution|
|Ricardo Yamil Baddour Dabdoub|Banco Union SA|0|11 Nov 2016|Banco Union SA, direct from institution|
|Javier Alfonso Santiago Gimenez Dominguez|Banco Union SA|0|11 Nov 2016|Banco Union SA, direct from institution|
|Alfredo Tomelic Sanchez|Banco Union SA|0|11 Nov 2016|Banco Union SA, direct from institution|

Examples:
|fid|percentFilter|
|104464|10|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page