Epic: Group Structure
----
.Overall Report

image:.uat.GroupStructure.stats.png
----

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships will not result in funding illegal activities such as money laundering and terrorist financing.
The group structure allows an analyst to see "sibling" entities of the bank they are researching, so they can know if the bank is related in any way to another entity known for risky activities.

Covers below features:
JIRA ID - KYC-41 - KYC user can view group structure list
JIRA ID - KYC-107 - KYC user can highlight legal entities by country in group structure list
JIRA ID - KYC-75 - KYC user can click link to another entity in group structure list
JIRA ID - KYC-167 - Do not display ownership for inactive legal entity

Meta:@groupstructureLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

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
p. Select a country highlight, legal entities in the group structure that have that country of operations are highlighted
q. Select a second country (de-selects previous filter, highlight legal entities by new selected country and removes highlight of legal entities by previous country)

When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
Then the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list
When the user selects a country <country> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
When the user selects another country <changeCountry> from the country highlight list in the group structure page
Then the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page
And the previously selected country <country> should be de-selected in the group structure page

Then the user should see the ultimate owner as Intesa Sanpaolo SpA for the entity user is viewing in the group structure page

Then the user should see the majority owners for the institution Recovery Ltd in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|CIB Bank Zrt|Hungary|67.6905|

Then the user should see the majority owners for the institution Lux Gest Asset Management SA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Intesa Sanpaolo Bank Luxembourg SA|Luxembourg|99.5675|

Then the user should see the majority owners for the institution Infogroup ScpA in the group structure page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Banca CR Firenze SpA|Italy|89.74|

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
|Sanpaolo Invest SIM SpA|Italy|100|
|Fideuram Investimenti SGR SpA|Italy|99.5|
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
|Intesa Sanpaolo Bank Luxembourg SA|Luxembourg|99.5675|

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
|Intesa Sanpaolo banka dd Bosna i Hercegovina|Bosnia-Herzegovina|94.95|

Examples:
|fid|country|changeCountry|
|444|Italy|USA|

Scenario: When the user manipulates URL to navigate to an FID for an inactive legal entity. User should see inactive institution page with message "No ownership information available"
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
When the user manipulates URL to navigate to 286840
Then the user should see the inactive institution page with message "No ownership information available"

Examples:
|fid|
|1038|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page
