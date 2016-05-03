Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
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
g. 0. If no regulators, display field label in summary section but no value
   1. If no stock exchange relationship exisits, display field label in summary section but no value
   2. If no stock exchange relationship exisits, display field label in identifier section but no value
h. 0. If regulator is inactive, display field label in summary section but no value
i. 0. with stock exchange info first by primary and then alphabetically by stock exchange name in summary section
   1. with stock symbol and ticker symbol seperated by colon , first by primary and then alphabetically by stock exchange name in identifier section
j. 0. If relationship type is not stock exchange, display field label in summary section but no value
   1. If relationship type is not stock exchange, display field label in identifier section but no value
k. 0. If stock exchange status is inactive, display field label in summary section but no value
l. 0. If stock exchange status is inactive, display field label in identifier section but no value
   1. If stock symbol does not exists but ticker symbol exists
   2. if stock symbol exists but ticker symbol does not exists
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

Examples:
|fid|
|1038|
|815|
|4236|