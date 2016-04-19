Epic: Subsidiaries

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.

Covers below features:
JIRA ID - KYC-45 - KYC user can view direct subsidiaries
JIRA-ID - KYC-102 - KYC user can filter subsidiaries list by percent ownership

Meta:@subsidiaries @kyc

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: KYC user can view direct subsidiaries
a. With percentage ownership; with country of operations; with active legal entity subsidiaries; with active subsidiary relationships
b. If percentage ownership is null then display record with no percentage ownership
c. If country of operations is not present then display records with no country
d. If subsidiaries are inactive do not display the inactive subsidiaries legal entity
e. If subsidiary relationships are inactive do not display the records for inactive subsidiaries relationship
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
And the user should see the legal title <institutionLegalTitle> of the institution it is looking at in the subsidiaries page

Examples:
|fid|institutionLegalTitle|
|211|Australia and New Zealand Banking Group Limited|
|815|Banco Popular|
|146115|Investec Holdings (Ireland) Ltd|
|200|Public Bank (Hong Kong) Limited|
|1717|Berliner Volksbank eG|

Scenario: KYC user can view direct subsidiaries
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Bank of Baroda (Botswana) Limited|Botswana|100|
|Bank of Baroda (Ghana) Ltd|Ghana|100|
|Bank of Baroda (Guyana) Incorporated|Guyana|100|
|Bank of Baroda (NewZealand) Ltd|New Zealand|100|
|Bank of Baroda (Tanzania) Ltd|Tanzania|100|
|Bank of Baroda (Trinidad and Tobago) Limited|Trinidad & Tobago|100|
|BOB Capital Market Ltd|India|100|
|BOB Cards Ltd|India|100|
|Nainital Bank Ltd|India|98.57|
|Bank of Baroda (Kenya) Ltd|Kenya|86.7|
|Bank of Baroda (Uganda) Limited|Uganda|80|
|Baroda Pioneer Asset Management Co Ltd|India|49|
|India International Bank (Malaysia) Bhd|Malaysia|40|
|Baroda Gujarat Gramin Bank|India|35|
|Baroda Rajasthan Kshetriya Gramin Bank|India|35|
|Baroda Uttar Pradesh Gramin Bank|India|35|
|UTI Asset Management Co Pvt Ltd|India|25|
|UTI Trustee Co Pvt Ltd|India|25|
|Indo-Zambia Bank Limited|Zambia|20|
|Small Industries Development Bank of India (SIDBI)|India|4.4|

When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Bank of Baroda (Botswana) Limited|Botswana|100|
|Bank of Baroda (Ghana) Ltd|Ghana|100|
|Bank of Baroda (Guyana) Incorporated|Guyana|100|
|Bank of Baroda (NewZealand) Ltd|New Zealand|100|
|Bank of Baroda (Tanzania) Ltd|Tanzania|100|
|Bank of Baroda (Trinidad and Tobago) Limited|Trinidad & Tobago|100|
|BOB Capital Market Ltd|India|100|
|BOB Cards Ltd|India|100|
|Nainital Bank Ltd|India|98.57|
|Bank of Baroda (Kenya) Ltd|Kenya|86.7|
|Bank of Baroda (Uganda) Limited|Uganda|80|

When the user changes the percent filter option to View All in the subsidiaries page
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|
|Bank of Baroda (Botswana) Limited|Botswana|100|
|Bank of Baroda (Ghana) Ltd|Ghana|100|
|Bank of Baroda (Guyana) Incorporated|Guyana|100|
|Bank of Baroda (NewZealand) Ltd|New Zealand|100|
|Bank of Baroda (Tanzania) Ltd|Tanzania|100|
|Bank of Baroda (Trinidad and Tobago) Limited|Trinidad & Tobago|100|
|BOB Capital Market Ltd|India|100|
|BOB Cards Ltd|India|100|
|Nainital Bank Ltd|India|98.57|
|Bank of Baroda (Kenya) Ltd|Kenya|86.7|
|Bank of Baroda (Uganda) Limited|Uganda|80|
|Baroda Pioneer Asset Management Co Ltd|India|49|
|India International Bank (Malaysia) Bhd|Malaysia|40|
|Baroda Gujarat Gramin Bank|India|35|
|Baroda Rajasthan Kshetriya Gramin Bank|India|35|
|Baroda Uttar Pradesh Gramin Bank|India|35|
|UTI Asset Management Co Pvt Ltd|India|25|
|UTI Trustee Co Pvt Ltd|India|25|
|Indo-Zambia Bank Limited|Zambia|20|
|Small Industries Development Bank of India (SIDBI)|India|4.4|

Examples:
|fid|percentFilter|
|1045|50|

Scenario: Display message in place of subs list if no subsidiaries for entity user is viewing
a. If there are no subsidiaries display "No known entities" for now;
Meta:@static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see message displayed in place of list explaining there are no subsidiaries
And the user should not see the legal title of the institution it is looking at in the subsidiaries page
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see message displayed in place of list explaining there are no subsidiaries
And the user should not see the legal title of the institution it is looking at in the subsidiaries page

Examples:
|fid|institutionLegalTitle|percentFilter|
|269306|First American Insurance Services Inc|10|

Scenario: Select filter that results in no entities on the list (display no subsidiaries, display message no known entities)
Meta:@static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see message displayed in place of list explaining there are no subsidiaries
And the user should not see the legal title of the institution it is looking at in the subsidiaries page

Examples:
|fid|percentFilter|
|173|25|

Scenario: KYC-102 Filter list of subsidiaries by percent ownership
a. View all is selected by default (displays all direct subsidiaries regardless of percent ownership)
   Selecting 10 and above filters out any entities owned by less than 10 or have null ownership
b. Selecting 25 and above filters out any entities owned by less than 25 or have null ownership
c. Selecting 50 and above filters out any entities owned by less than 50 or have null ownership
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the subsidiaries page
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the subsidiaries page
And the user should see the legal title <institutionLegalTitle> of the institution it is looking at in the subsidiaries page

Examples:
|fid|percentFilter|institutionLegalTitle|
|1045|10|Bank of Baroda|
|1045|25|Bank of Baroda|
|1045|50|Bank of Baroda|

Scenario: Select a second filter (first filter is de-selected, list updates to match new filter)
Meta:@dynamic @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the subsidiaries page
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see the percent filter View All de-selected in the subsidiaries page

Examples:
|fid|percentFilter|
|1038|10|

Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout