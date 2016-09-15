Epic - Ownership
----
.Overall Report

image:.entitydetails.EntityDetails.stats.png[Entity Details]
----

KYC user is performing due diligence on a potential business partner, so they need to see identifying information about the entity to make sure it is the one they are researching.

Covers below features:
JIRA ID - KYC-117 - KYC user can view entity details
JIRA ID - KYC-129 - KYC user can view regulator on entity details
JIRA ID - KYC-99 - KYC user can view stock exchange info
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-193 - KYC user can view SWIFT BICs on entity details
JIRA ID - KYC-211 - LEIs are not sorted alphabetically in Entity Details Identifier Section
JIRA ID - KYC-204 - Display legal entity website on entity details
JIRA ID - KYC-464 - Abbreviated name of stock exchange not displayed
JIRA ID - KYC-481 - Find head office address for entity details by address function

Meta:@entitydetails @kyc @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

