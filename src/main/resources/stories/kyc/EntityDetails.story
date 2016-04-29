Epic - Ownership

KYC user is performing due diligence on a potential business partner, so they need to see identifying information about the entity to make sure it is the one they are researching.
Covers below features:
JIRA ID - KYC-117 - KYC user can view entity details
JIRA ID - KYC-99 - KYC user can view stock exchange info
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-193 - KYC user can view SWIFT BICs on entity details
JIRA ID - KYC-129 - KYC user can view regulator in bank details

Meta:@entitydetails @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC user can view entity details
a. 0. with head office address elements with varying "UseInAddress" flag values for each element (display element if UseInAddress is true) (display head office address in summary section)
   1. with LEI (with multiple LEIs (sort by LEI issuer name alphabetically (ascending) ignoring "The" in identifiers section)
   2. with GIIN (display in identifiers section)
   3. with head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   4. If active SWIFT BICs have assigned institution that is the entity user is viewing, then display SWIFT BICs on entity details sorted first by length (short to long) then by alpha-numeric
b. 0. with FATCA status value (display in identifiers section)
   1. If inactive SWIFT BIC has assigned institution that is the entity user is viewing, then do not display
c. 0. KYC users should see Indetifiers labels even when there are no values for the identifiers
   1. If no GIIN, display field label in identifiers section but no value
   2. If no LEI, display field label in identifiers section but no value
   3. If no FATCA status, display field label in identifiers section but no value
   4. If no active SWIFT BICs have assigned institution that is the entity user is viewing, display the field label but no value
d. If no primary physical address exists for head office, display field label in summary section but no value
e. Display all head office entity where useInaddress is true
f. 0. with regulators information, sorted by alphabetically
   1. If no regulators, display field label in summary section but no value
   2. If regulator is inactive, display field label in summary section but no value
g. 0. with stock exchange info first by primary and then alphabetically by stock exchange name in summary section
   1. If no stock exchange relationship exisits, display field label in summary section but no value
   2. If relationship type is not stock exchange, display field label in summary section but no value
   3. If stock exchange status is inactive, display field label in summary section but no value
h. 0. with stock symbol and ticker symbol seperated by colon , first by primary and then alphabetically by stock exchange name in identifier section
   1. If no stock exchange relationship exisits, display field label in identifier section but no value
   2. If relationship type is not stock exchange, display field label in identifier section but no value
   3. If stock exchange status is inactive, display field label in identifier section but no value
   4. If stock symbol does not exists but ticker symbol exists
   5. if stock symbol exists but ticker symbol does not exists
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin, lei, sorted alphabetically by issuer name, and fatca status for the selected institution in the entity details page
And the user should see the list of swift bics sorted first by length (short to long) then by alpha-numerically in the entity details page
And the user should see the list of stock exchanges first by primary,then alphabetically by stock exchange name
And the user should see the list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name
And the user should see regulators information, sorted by alphabetically

Examples:
|fid|
|1038|
|815|
|269306|
|277123|
|498|
|58285|
|52147|
|4236|
|3581|
|2836|
|15586

Scenario: KYC user can view entity details
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title <legalTitle> and bankers almanac id <bankersAlmanacId> in entity details page
Then the user should see the summary with head office address <headOfficeAddress> respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin <giin> and fatca status <fatcaStatus> for the selected institution in the entity details page
And the user should see the identifiers with below leis, sorted alphabetically by issuer name, in the entity details page
|LEIS|
|Global Intermediary Identification Number K613SZ.99999.SL.840|
|The Global Markets Entity Identifier (GMEI) B4TYDEB6GKMZO031MB27|
|S and P Identification Number (SPID) 105940|

Examples:
|fid|legalTitle|bankersAlmanacId|headOfficeAddress|giin|fatcaStatus|
|1038|BOA|Bankersalmanac.com ID: 1038|100 N Tryon St,Ste 170,Charlotte,North Carolina,USA|K613SZ.99999.SL.840||

Scenario: KYC user can view active swift bic list in entity details
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the swift bic list sorted first by length (short to long) then by alpha-numerically in the entity details page
|SWIFT BICS|
|BPOPCOBB|
|BPOPCOBBADZ|
|BPOPCOBBAXM|
|BPOPCOBBBAQ|
|BPOPCOBBBGA|
|BPOPCOBBBO1|
|BPOPCOBBBO2|
|BPOPCOBBBO3|
|BPOPCOBBCL1|
|BPOPCOBBCTG|
|BPOPCOBBIBE|
|BPOPCOBBMD1|
|BPOPCOBBMZ1|

Examples:
|fid|
|815|

Scenario: KYC-99 display stock exchange info in summary section and identifiers section on entity details
a. If active stock exchange relationship(s) exist, display legal title of stock exchange and abbreviated name in summary section sort first by primary = true, then by legal title
b. If active stock exchange relationship(s) exist, display abbreviated name of stock exchange and ticker symbol for that stock exchange relationship in identifiers section, sort first by primary = true, then by abbreviated stock exchange name
c. If inactive stock exchange relationship, then do not display
d. If no stock exchange relationship exists, then display field labels in summary section and identifiers section but no values
e. If abbreviated name does not exist for stock exchange, then display all other available stock exchange info but not abbreviated name in summary or identifiers section
f. If no ticker symbol exists, display all other available info but no ticker symbol in identifiers section


Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout



