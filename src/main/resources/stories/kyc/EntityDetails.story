Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
JIRA ID - KYC-117- KYC user can view entity details

Scenario: KYC user can view entity details
a. with head office address
b. without head office address (display field label, no value)
c. with head office address elements with varying "UseInAddress" flag values for each element (do not display element if UseInAddress is false)
d. with GIIN
e. without GIIN (display field label, no value)
f. with LEI
g. without LEI (display field label, no value)
h. with multiple LEIs
i. with FATCA status value
j. without FATCA status value (display field label, no value)



Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the Summary and Identifiers sections with corresponding information on the entity details page for legal entity [fid]
And LEIs are sorted by issuer name alphabetically (ascending)



