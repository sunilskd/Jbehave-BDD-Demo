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
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the entity details tab
When the user captures the snapshot for th entity details page
Then the user should see the actual snapshot should match the expected snapshot

Examples:
|fid|
|1038|