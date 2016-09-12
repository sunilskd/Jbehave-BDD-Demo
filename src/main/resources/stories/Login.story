.Overall Report

image:.login.stats.png
----

Meta:@login

Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout
