Epic- Ownership

KYC user is performing due dilligence on a potential business partner, so they need to see identifying information about the entity to make sure it is the one they are researching.
Covers below features:
JIRA ID - KYC-117 - KYC user can view entity details

Meta:@entitydetails @kyc

Scenario: KYC user can view entity details
a. with head office address elements with varying "UseInAddress" flag values for each element (display element if UseInAddress is true) (display head office address in summary section)
   with LEI (with multiple LEIs (sort by LEI issuer name alphabetically (ascending) in identifiers section)
   with GIIN (display in identifiers section)
   with head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
b. with FATCA status value (display in identifiers section)
c. KYC users should see Indetifiers labels even when there are no values for the identifiers
    If no GIIN, display field label in identifiers section but no value
    If no LEI, display field label in identifiers section but no value
    If no FATCA status, display field label in identifiers section but no value
d. If no primary physical address exists for head office, display field label in summary section but no value
e. Do not display head office when it is inactive
f. Display all head office entity where useInaddress is true
Meta:@dynamic
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin, lei and fatca status for the selected institution in the entity details page

Examples:
|fid|
|1038|
|815|
|269306|
|277123|
|82474|
|15773|

Scenario: KYC user can view entity details
Meta:@static
Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title <legalTitle> and bankers almanac id <bankersAlmanacId> in entity details page
Then the user should see the summary with head office address <headOfficeAddress> respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin <giin> and fatca status <fatcaStatus> for the selected institution in the entity details page
And the user should see the identifiers with below leis in the entity details page
|LEIS|
|The Global Markets Entity Identifier (GMEI) B4TYDEB6GKMZO031MB27|
|S and P Identification Number (SPID) 105940|
|Global Intermediary Identification Number K613SZ.99999.SL.840|

Examples:
|fid|legalTitle|bankersAlmanacId|headOfficeAddress|giin|fatcaStatus|
|815|Banco Popular|Bankersalmanac.com ID: 815|Calle 17, No 7- 43 Piso 3, Calle 17, Bogotá, Distrito Capital de Santa Fe de Bogota, Colombia|10ZQZE.99999.SL.170|Participating FFI|