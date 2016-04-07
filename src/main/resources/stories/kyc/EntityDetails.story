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
k. with active SWIFT/BIC(s)
l. with inactive SWIFT/BIC(s) (do not display)
m. with no SWIFT/BIC(s)
n. KYC-99 - with active stock exchange relationship
o. KYC-99 - with inactive stock exchange relationship
p. KYC-99 - with no stock exchange relationship (display field label, no value)
q. KYC-99 - with stock exchange relationship but no stock exchange abbreviated name
r. KYC-99 - no ticker symbol
s. KYC-99 - with ticker symbol
t. KYC-99 - with multiple stock exchanges, one ticker symbol per stock exchange
u. KYC-129 - with regulator
v. KYC-129- with multiple regulators
w. KYC-129 - without regulator

Given the kyc user is on the ubo home page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the Summary, Identifiers, and SWIFT/BIC sections with corresponding information on the entity details page for legal entity [fid]
And Regulators are sorted by legal title alphabetically (ascending)
And LEIs are sorted by issuer name alphabetically (ascending)
And SWIFT/BICs are sorted by length (short to long), then by alpha-numeric (ascending)
And Stock Exchanges in the Summary section are sorted first by primary flag, then alphabetically (ascending) by stock exchange name
And Stock Exchanges with their corresponding ticker symbol in the Identifiers Section are sorted first by primary stock exchange, then alphabetically (asc) by abbreviated stock exchange name, then alphabetically (asc) by ticker symbol

