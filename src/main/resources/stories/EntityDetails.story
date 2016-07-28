Epic - Ownership

KYC user is performing due diligence on a potential business partner, so they need to see identifying information about the entity to make sure it is the one they are researching.

Covers below features:
JIRA ID - KYC-117 - KYC user can view entity details
JIRA ID - KYC-129 - KYC user can view regulator on entity details
JIRA ID - KYC-99 - KYC user can view stock exchange info
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-193 - KYC user can view SWIFT BICs on entity details
JIRA ID - KYC-211 - LEIs are not sorted alphabetically in Entity Details Identifier Section
JIRA ID - KYC-204 - Display legal entity website on entity details

Meta:@entitydetails @kyc @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios
a. 0. With head office address elements with varying "UseInAddress" flag values for each element (display element if UseInAddress is true) (display head office address in summary section)
   1. With LEI (with multiple LEIs (sort by LEI issuer name alphabetically (ascending) ignoring "The" in identifiers section)
   2. With GIIN (display in identifiers section)
   3. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   4. If active SWIFT BICs have assigned institution that is the entity user is viewing, then display SWIFT BICs on entity details sorted first by length (short to long) then by alpha-numeric
   5. Entity With website, display hyperlink in summary section
b. 0. With FATCA status value (display in identifiers section)
   1. If inactive SWIFT BIC has assigned institution that is the entity user is viewing, then do not display
c. 0. KYC users should see Indetifiers labels even when there are no values for the identifiers
   1. If no GIIN, display field label in identifiers section but no value
   2. If no LEI, display field label in identifiers section but no value
   3. If no FATCA status, display field label in identifiers section but no value
   4. If no active SWIFT BICs have assigned institution that is the entity user is viewing, display the field label but no value
   5. If website is null, display field label in summary section but no value
d. If no primary physical address exists for head office, display field label in summary section but no value
e. Display all head office entity where useInaddress is true
f. 0. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
g. 0. If no active regulation relationship exists, then display field label but no value
   1. If no stock exchange relationship exisits, display field label in summary section but no value
   2. If no stock exchange relationship exisits, display field label in identifier section but no value
h. If regulation relationship is inactive, then display field label but no value
i. 0. If active stock exchange relationship(s) exist, display legal title of stock exchange and abbreviated name in summary section sort first by primary = true, then by legal title
   1. If active stock exchange relationship(s) exist, display abbreviated name of stock exchange and ticker symbol for that stock exchange relationship in identifiers section, sort first by primary = true, then by abbreviated stock exchange name
j. If inactive stock exchange relationship, then display field label but no value
k. 0. If abbreviated name does not exist for stock exchange, then display all other available stock exchange info but not abbreviated name in summary or identifiers section
   1. If no ticker symbol exists, display all other available info but no ticker symbol in identifiers section
l. If stock exchange relationship is active and stock exchange legal entity is inactive, then display field label but no value
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin, lei, sorted alphabetically by issuer name, and fatca status for the selected institution in the entity details page
And the user should see the list of swift bics sorted first by length (short to long) then by alpha-numerically in the entity details page
And the user should see the list of stock exchanges first by primary,then alphabetically by stock exchange name in the entity details page
And the user should see the list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name in the entity details page
And the user should see regulators information, sorted by alphabetically in the entity details page
And the user should see website information in the summary section of entity details page

Examples:
|fid|
|1038|
|815|
|269306|
|277123|
|498|
|58285|
|52147|
|17062|
|4236|
|519|
|15586|
|1857|

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
|Global Intermediary Identification Number NISWJ7.00001.ME.276|
|WM Datenservice General Entity Identifier (GEI) 529900C4RSSBWXBSY931|

And the user should see the below list of stock exchanges first by primary,then alphabetically by stock exchange name in the entity details page
|STOCK EXCHANGES|
|Börse Berlin AG PRIMARY|
|Deutsche Börse AG|

And the user should see the below list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name in the entity details page
|STOCK SYMBOL|
|THJC|
|KJHJ|

And the user should see regulators information, sorted alphabetically in the entity details page
|REGULATORS|
|BOA|
|Bundesanstalt für Finanzdienstleistungsaufsicht|

When the user clicks on <website> link in the entity details section
Then user is taken to a URL http://www.berlinhyp.de/ that opens in a new window

Examples:
|fid|legalTitle|bankersAlmanacId|headOfficeAddress|giin|fatcaStatus|website|
|58285|Berlin Hyp AG|Bankersalmanac.com ID: 58285|Budapester Strasse 1,Berlin,Germany|NISWJ7.00001.ME.276||http://www.berlinhyp.de|

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

Scenario: If multiple websites are present, then display one website, whichever is found first
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see website information in the summary section of entity details page

Examples:
|fid|
|732|

Scenario: KYC-215 Covers below scenario
a. With registered office address elements with varying "UseInAddress" flag value false for each element (do not display subarea if UseInAddress is false)
b. With registered office address elements with varying "UseInAddress" flag value false for each element (do not display area if UseInAddress is false)
c. With registered office address elements with varying "UseInAddress" flag value false for each element (do not display subarea and area if UseInAddress is false)
d. With registered office address elements with varying "UseInAddress" flag values for each element (display element if UseInAddress is true) (display head office address in summary section)
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the entity details tab
Then the user should see the registered office address(address line 1 line2 line3 line 4,city,area,subarea,country) respecting the useInAddres flag in summary section

Examples:
|fid|
|16|
|3314|
|15106|
|62579|

Scenario: KYC-215 Verify below scenarios
a. Do not display registered office if the address is not functioning as registered office (address/function != registered office)
b. Do not display registered office if it is not the primary location (location/primary=false)
Given the user is on the ubo login page
When the user opens legal entity <fid>
And the user clicks on the entity details tab
Then the user should not see the registered office address and label on entity details page

Examples:
|fid|
|1038|
|31376|

Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout

