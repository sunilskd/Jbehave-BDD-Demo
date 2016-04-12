Epic: Ownership

KYC user is performing due dilligence on a potential business partner, so they need to see identifying information about the entity to make sure it is the one they are researching.
Covers below features:
JIRA ID - KYC-117- KYC user can view entity details

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



Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the Summary and Identifiers sections with corresponding information on the entity details page for legal entity [fid]
And LEIs are sorted by issuer name alphabetically (ascending)



