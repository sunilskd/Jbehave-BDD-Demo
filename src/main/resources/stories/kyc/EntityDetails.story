Epic: Ownership

KYC user is performing due dilligence on a potential business partner, so they need to see identifying information about the entity to make sure it is the one they are researching.
Covers below features:
Meta:@entitydetails @kyc

Scenario: KYC user can view entity details
a. with head office address elements with varying "UseInAddress" flag values for each element (do not display element if UseInAddress is false) (display head office address in summary section)
b. If no primary physical address exists for head office, display field label in summary section but no value
c. with GIIN (display in identifiers section)
d. If no GIIN, display field label in identifiers section but no value
e. with LEI (display in identifiers section)
f. If no LEI, display field label in identifiers section but no value
g. with multiple LEIs (sort by LEI issuer name alphabetically (ascending) in identifiers section)
h. with FATCA status value (display in identifiers section)
i. If no FATCA status, display field label in identifiers section but no value

Meta:@dynamicentitydeails
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see head office address with address line1 line2 line3 line 4 city subarea country zip <fid> And user should see giin value

Examples:
|fid|
|186456|

Scenario: KYC user can view lei and Factcs status for an entity details
a. with LEI
b. with FATCA status value
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see lei and Factcs status

Examples:
|fid|
|815|

Scenario: KYC user can view multiple leis for an entity details
a. with multiple LEIs
b. LEIs are sorted by issuer name alphabetically (ascending)
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see multiple leis associated to the entity

Examples:
|fid|
|815|

Scenario: KYC user can view entity details
Meta:@static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see below head office address giin facta status
|HEAD OFFICE ADDRESS|GIIN|FACTA STATUS|
|Calle 17, No 7- 43 Piso 3, Calle 17, Bogotá, Distrito Capital de Santa Fe de Bogota, Colombia|10ZQZE.99999.SL.170|Participating FFI|

Examples:
|fid|
|815|

Scenario: Head office address should not be displayed for KYC user to view when there is no address associated to the entity or UseInAddress is false
a. without head office address (display field label, no value)
b. with head office address elements with varying "UseInAddress" flag values for each element (do not display element if UseInAddress is false)
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should not see head office address

Examples:
|fid|
|815|

Scenario: KYC users should see Indetifiers labels even when there are no values for the identifiers
a. without GIIN (display field label, no value)
b. without FATCA status value (display field label, no value)
c. without LEI (display field label, no value)
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should not see only identifier lables and not values

Examples:
|fid|
|269306|