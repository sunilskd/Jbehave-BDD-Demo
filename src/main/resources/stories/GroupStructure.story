Epic: Group Structure

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list
JIRA ID - KYC-107 - KYC user can highlight legal entities by country in group structure list
JIRA ID - KYC-75 - KYC user can click link to another entity in group structure list

Meta:@groupstructure @kyc @ubo

Scenario: Story covers below scenarios
a. Entity user is viewing is highlighted in the list
b. Entity displayed on list (could be entity user is viewing) has at least one legal entity owner that is active, the ownership relationship is active, and the entity owns greater than 50 percent of the entity user is viewing, then display owning entity indented at a higher level in the list.
c. Entity displayed on list (could be entity user is viewing) has at least one legal entity owner that is active, the ownership relationship is active, there is no entity that owns greater than 50 percent, and the entity has only one owner with null percent ownership, then display owning entity indented at a higher level in the list.
d. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership and has zero owners that have null percent ownership, then that entity is at the top of the list
e. Entity displayed on list (could be entity user is viewing) has no owner that has greater than 50 percent ownership and has more than one owner that has null percent ownership, then that entity is at the top of the list
f. Entity displayed on list (could be entity user is viewing) has no owners, then that entity is at the top of the list
g. Entity displayed on list has an inactive owner (relationship doc is inactive), do not display that owner
h. Entity on the list has a subsidiary it owns more than 50 percent, display that subsidiary entity indented below it in the list
i. Entity on the list has a subsidiary where it has null percent ownership, there is no other owner of that same subsidiary with null percent ownership or greater than 50 percent ownership, display that subsidiary entity in the list
j. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has null percent ownership, then do not display that subsidiary on the list
k. If entity on the list has a subsidiary where it has null percent ownership, but there is another owner of that same subsidiary that has greater than 50 percent ownership, then do not display that subsidiary on the list
l. Multiple entities are at the same level of indentation in the list, then sort by percent ownership descending then alphabetically by legal title
m. If null percent ownership, do not display percent ownership for that relationship
n. If no country of operations for legal entity on list, do not display country of operations
o. If subsidiary relationship document is inactive, do not display the subsidiary entity on list

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios
a. 0. Select a country highlight, legal entities in the group structure that have that country of operations are highlighted
   1. Select a second country (de-selects previous filter, highlight legal entities by new selected country and removes highlight of legal entities by previous country)
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
When the user selects another country <changeCountry> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
And the previously selected country <country> should be de-selected in the group structure page

Examples:
|fid|country|changeCountry|
|444|Italy|USA|
|211|New Zealand|USA|

Scenario: De-select previously selected filter by clicking on it a second time, removes highlight of legal entities in that country
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user selects a country <country> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
When the user de-select previously selected country <country> by clicking on it a second time from the country highlight in the group structure page
Then the user should not see the entities in the group structure that have the selected country of operations highlighted in the group structure page
And the previously selected country <country> should be de-selected in the group structure page

Examples:
|fid|country|
|444|Italy|
|211|Australia|

Scenario: Verify country highlight options are dynamic based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list

Examples:
|fid|
|444|
|211|

Scenario: Verify complete group structure
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab

Then the user should see the ultimate owner as Intesa Sanpaolo SpA for the entity user is viewing in the group structure page

Then the user should see the majority owners for the institution Recovery Ltd in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|CIB Bank Zrt|Hungary|67.69|

Then the user should see the majority owners for the institution Lux Gest Asset Management SA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Intesa Sanpaolo Bank Luxembourg SA|Luxembourg|100|

Then the user should see the majority owners for the institution Societá per La Riscossione dei Tributi SpA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Casse di Risparmio dell'Umbria SpA|Italy|87.85|

Then the user should see the majority owners for the institution Banca IMI Securities Corp in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|IMI Capital Markets USA Corp|USA|100|

And the user should see the indented list of subsidiaries for the institution IMI Investments SA that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|IMI Capital Markets USA Corp|USA|100|
|IMI Finance Luxembourg SA|Luxembourg|100|

And the user should see the indented list of subsidiaries for the institution FIDEURAM - Intesa Sanpaolo Private Banking SpA that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Fideuram Asset Management (Ireland) Ltd|Ireland|100|
|Fideuram Bank (Luxembourg) SA|Luxembourg|100|
|Fideuram Fiduciaria SpA|Italy|100|
|Fideuram Gestions SA (Luxembourg)|Luxembourg|100|
|Financiere Fideuram SA|France|100|
|Sanpaolo Invest (Ireland) Ltd|Ireland|100|
|Sanpaolo Invest SIM SpA|Italy|100|
|Fideuram Investimenti SGR SpA|Italy|99.5|
|MC Gestioni Società di gestione del risparmio per azioni|Italy|91.39|
|Auriga Sistemi-Finanza Quantitativa Srl|Italy|80|

And the user should see the indented list of subsidiaries for the institution IMI Capital Markets USA Corp that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Banca IMI Securities Corp|USA|100|

And the user should see the indented list of subsidiaries for the institution Banca IMI SpA that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|IMI Investments SA|Luxembourg|100|
|Trade Receivebles Investments Vehicle|Luxembourg|100|

When the user clicks on the legal entity Eurizon Capital SA in group structure page

Then the user should see the legal entity Eurizon Capital SA, user is currently viewing, highlighted in the group structure page

Then the user should see the majority owners for the institution Lux Gest Asset Management SA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Intesa Sanpaolo Bank Luxembourg SA|Luxembourg|100|

Then the user should see the majority owners for the institution Auriga Sistemi-Finanza Quantitativa Srl in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|FIDEURAM - Intesa Sanpaolo Private Banking SpA|Italy|100|

Then the user should see the indented list of subsidiaries for the institution IMI Investimenti SpA that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Sanpaolo Imi Fondi Chiusi SGR SpA|Italy|100|

Then the user should see the indented list of subsidiaries for the institution Privredna banka Zagreb dd that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|PBZ Card doo|Croatia|100|
|PBZ Leasing doo|Croatia|100|
|PBZ Nekretnine doo|Croatia|100|
|PBZ Stambena Stedionica dd|Croatia|100|

Examples:
|fid|
|444|

Scenario: Verify complete group structure
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

Scenario: KYC user logout
Meta: @id logout
Given the user is on the ubo login page
When the user logout