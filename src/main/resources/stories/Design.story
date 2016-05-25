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

Scenario: Covers below scenarios
a. An entity on the graph (could be entity user is viewing) has owner that is a legal entity which is active, display that entity on the owners graph above the entity it owns.
b. Owner has percent ownership, display percent on owner's node on graph
c. Owner has null percent ownership, do not display percent ownership on owner node on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity 6, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 8, above the root entity, in the owners graph
|OWNERS|
|QA Legal Entity 5730.99|

When the user clicks on the direct relationships only filter in the owners graph

Examples:
|fid|
|LE-6|