Epic: Owners

Test this feature like this
Covers features below -
JIRA ID - 117 - KYC user can view entity details
JIRA ID - 193 - KYC user can view SWIFT/BICs on entity details


Scenario: KYC user can view entity details
a. KYC-117 with head office address
b. KYC-117 without head office address (display field label, no value)
c. KYC-117 with head office address elements with varying "UseInAddress" flag values for each element (do not display element if UseInAddress is false)
d. KYC-117 with GIIN
e. KYC-117 without GIIN (display field label, no value)
f. KYC-117 with LEI
g. KYC-117 without LEI (display field label, no value)
h. KYC-117 with multiple LEIs
i. KYC-117 with FATCA status value
j. KYC-117 without FATCA status value (display field label, no value)
k. KYC-193 with active SWIFT/BIC(s)
l. KYC-193 with inactive SWIFT/BIC(s)(do not display)
m. KYC-193 with no SWIFT/BIC(s)


Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the Summary, Identifiers and SWIFT/BIC sections with corresponding information on the entity details page for legal entity [fid]
And LEIs are sorted by issuer name alphabetically (ascending)
And SWIFT/BICs are sorted by length (short to long), then by alpha-numeric (ascending)