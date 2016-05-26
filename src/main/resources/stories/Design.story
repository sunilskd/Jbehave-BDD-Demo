Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: Covers below scenarios
a. 0. Entity user is viewing has owners that are type person and the relationship is active, display those owners on the graph
   1. Person owner has percent ownership, display percent on owner's node on graph
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
Then the user should see the legal entity QA Legal Entity A, user is currently viewing, as the root in the owners graph

And the user should see the list of below owners in level 1, above the root entity, in the owners graph
|NODES|
|QA Test Person E49.23|
|QA Legal Entity B50.52|
|QA Test Person A45.52|
|QA Legal Entity C50.52|

And the user should see the list of below owners in level 2, above the root entity, in the owners graph
|NODES|
|QA Test Person B40.23|
|QA Test Person G50.222|
|QA Legal Entity D50.52|
|QA Test Person D49.23|
|QA Test Person G4.93|

And the user should see the list of below owners in level 3, above the root entity, in the owners graph
|NODES|
|QA Test Person H49.23|
|QA Test Person G4.23|
|QA Test Person C50.52|

Examples:
|fid|
|LE-A|