Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs
And the user should see the list of below owners in level 2, above the root entity, in the graphs
And the user should see the list of below subsidiaries in level 2, below the root entity, in the graphs
And the user should see the list of below owners in level 3, above the root entity, in the graphs
And the user should see the list of below subsidiaries in level 3, below the root entity, in the graphs
And the user should see the list of below owners in level 4, above the root entity, in the graphs
And the user should see the list of below subsidiaries in level 4, below the root entity, in the graphs
And the user should see the list of below owners in level 5, above the root entity, in the graphs
And the user should see the list of below owners in level 6, above the root entity, in the graphs
And the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://www.accuity.com/Util/login.aspx?ReturnUrl=%2ffinancial-counterparty-kyc%2fubo%2f on accuity.com

Examples:
|fid|
|LE-6|