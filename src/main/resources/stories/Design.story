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

Scenario: Verify group structure
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the ultimate owner as Government of the Republic of India for the entity user is viewing in the group structure page
Then the user should see the legal entity Bank of Baroda, user is currently viewing, highlighted in the group structure page

Then the user should see the majority owners for the institution Bank SBI Botswana ltd. in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|State Bank of India|India|62.313|

Then the user should see the majority owners for the institution SBICAP (Singapore) Ltd in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|SBI Capital Markets Ltd|India|100|

Then the user should see the majority owners for the institution SBI Funds Management (International) Private Ltd in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|SBI Funds Management Pvt Ltd|India|63|

And the user should see the indented list of subsidiaries for the institution SBI Capital Markets Ltd that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|SBICAP (Singapore) Ltd|India||
|SBICAP (UK) Ltd|UK||
|SBICAP Securities Ltd|India||
|SBICAP Trustee Company Ltd|India||
|SBICAPS Ventures LTD|India||

And the user should see the indented list of subsidiaries for the institution Union Bank of India that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Union Bank of India (UK) Limited|UK|100|

And the user should see the indented list of subsidiaries for the institution SBI Funds Management Pvt Ltd that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|SBI Funds Management (International) Private Ltd|Mauritius||

Examples:
|fid|
|1045|
