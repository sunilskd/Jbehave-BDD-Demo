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

Scenario: KYC user can view direct owners that are legal entities
a.
b.If no legal entities in list have country of operations, then no countries are available as highlight option
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
When the user selects a country <country> from the country highlight list in the owners page
Then the user should see the direct owners in the owners list that have the selected country of operations highlighted in the owners page
Then the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page
Then the user should see the list of unique country of operations for each direct owners to highlight, sorted alphabetically, in the owners page
Then the user should not see the direct owners in the owners list that have the selected country of operations highlighted in the owners page
When the user de-select previously selected country by clicking on it a second time from the country highlight
Then the use should not see any direct owners lists highlighted in the owners page
When the user selects another country <country> from the country highlight list in the owners page
Then the user should see the direct owners in the owners list that have the selected country of operations highlighted in the owners page
And the previously selected country should be de-selected

Examples:
|fid|country|
|211|Australia|
|179281||
