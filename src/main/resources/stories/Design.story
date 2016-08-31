Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Covers below scenarios
a. If there are no direct owners display "no results" for now
b. If person or institution ownership relationship is inactive, do not display that person or institution on owners list
c. If non entity or person owner ownership relationship is inactive, do not display those other entity type owners on owners list
Meta:@directOwners @static @dynamic
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the user should see message displayed in place of list explaining there are no direct owners
And the ubo user should see message displayed in place of list explaining there are no UBOs
Then the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the owners page

Examples:
|fid|
|1|