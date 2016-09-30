Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal
Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC user login
Scenario: KYC-455 Covers below scenarios for truncated owners graph for a KYC user.
a. 0. Verify graph truncation notification message when number of nodes are greater than 2500
   1. Percent ownership filter options not affected by truncation.
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the owners graph
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root and highlighted on the graphs

And the user should see the list of owners in level 1, above the root entity, in the graphs
And the user should see the list of owners in level 2, above the root entity, in the graphs
And the user should see the list of owners in level 3, above the root entity, in the graphs
And the user should see the list of owners in level 4, above the root entity, in the graphs
And the user should see the list of owners in level 5, above the root entity, in the graphs
And the user should see the list of owners in level 6, above the root entity, in the graphs
Then the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs
When the user clicks on please subscribe link in the message displayed in the graph
Then the user is taken to subscription page URL http://accuity.lookbookhq.com/bankers-almanac-ubo/video?cmpid=ILC7CBRSK7CBAFPU-2016-0810-GLOB-ba-ubo7CLookBook&sfid=701D0000000dwwH on accuity.com

Examples:
|fid|
|LE-6|
