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
a. with head office address elements with varying "UseInAddress" flag values for each element (display element if UseInAddress is true) (display head office address in summary section)
   with LEI (with multiple LEIs (sort by LEI issuer name alphabetically (ascending) ignoring "The" in identifiers section)
   with GIIN (display in identifiers section)
   with head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
   If active SWIFT BICs have assigned institution that is the entity user is viewing, then display SWIFT BICs on entity details sorted first by length (short to long) then by alpha-numeric
b. with FATCA status value (display in identifiers section)
   If inactive SWIFT BIC has assigned institution that is the entity user is viewing, then do not display
c. KYC users should see Indetifiers labels even when there are no values for the identifiers
    If no GIIN, display field label in identifiers section but no value
    If no LEI, display field label in identifiers section but no value
    If no FATCA status, display field label in identifiers section but no value
    If no active SWIFT BICs have assigned institution that is the entity user is viewing, display the field label but no value
d. If no primary physical address exists for head office, display field label in summary section but no value
e. Display all head office entity where useInaddress is true
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin, lei, sorted alphabetically by issuer name, and fatca status for the selected institution in the entity details page
And the user should see the list of swift bics sorted first by length (short to long) then by alpha-numerically in the entity details page

Examples:
|fid|
|1038|
