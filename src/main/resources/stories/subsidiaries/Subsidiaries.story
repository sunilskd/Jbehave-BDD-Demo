Epic: Subsidiaries
----
.Overall Report

image:.subsidiaries.Subsidiaries.stats.png[Subsidiaries]
----

A KYC analyst is researching an entity they will potentially do business with, they will review the subsidiaries owned by the entity they are researching.

Covers below features:
JIRA ID - KYC-45 - KYC user can view direct subsidiaries
JIRA-ID - KYC-102 - KYC user can filter subsidiaries list by percent ownership
JIRA ID - KYC-133 - User can navigate through tabs on office page
JIRA ID - KYC-188 - Display relationship validated date on subsidiary list
JIRA ID - KYC-167 - Do not display ownership for inactive legal entity

Meta:@subsidiaries @kyc @ubo

Scenario: KYC user login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: Covers below scenarios
a. With percentage ownership; with country of operations; with validated date; with active legal entity subsidiaries; with active subsidiary relationships
b. If percentage ownership is null then display record with no percentage ownership
c. 0. If country of operations is not present then display records with no country
   1. If validated date is not present then display records with no validated date
d. If subsidiaries are inactive do not display the inactive subsidiaries legal entity
e. If subsidiary relationships are inactive do not display the records for inactive subsidiaries relationship
f. If accuracy is day, display day, month and year. If accuracy is month, display month and year. If accuracy is year, display only year
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the subsidiaries summary selected by default in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page

Examples:
|fid|
|211|
|815|
|146115|
|200|
|1717|
|112618|

Scenario: KYC user can view direct subsidiaries
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|VALIDATED DATE|
|Bank of Baroda (Botswana) Limited|Botswana|100|24 Nov 2001|
|Bank of Baroda (Ghana) Ltd|Ghana|100|07 May 2010|
|Bank of Baroda (Guyana) Incorporated|Guyana|100|01 Dec 2001|
|Bank of Baroda (NewZealand) Ltd|New Zealand|100|04 Feb 2011|
|Bank of Baroda (Tanzania) Ltd|Tanzania|100|10 Apr 2005|
|Bank of Baroda (Trinidad and Tobago) Limited|Trinidad & Tobago|100|07 May 2010|
|BOB Capital Market Ltd|India|100|01 Jun 2002|
|BOB Cards Ltd|India|100|20 Mar 2005|
|Nainital Bank Ltd|India|98.57|13 Mar 2015|
|Bank of Baroda (Kenya) Ltd|Kenya|86.7|26 Jun 2005|
|Bank of Baroda (Uganda) Limited|Uganda|80|23 Nov 2003|
|Baroda Pioneer Asset Management Co Ltd|India|49|07 May 2010|
|India International Bank (Malaysia) Bhd|Malaysia|40|14 Dec 2012|
|Baroda Gujarat Gramin Bank|India|35|07 May 2010|
|Baroda Rajasthan Kshetriya Gramin Bank|India|35|07 May 2010|
|Baroda Uttar Pradesh Gramin Bank|India|35|19 Jul 2013|
|UTI Asset Management Co Pvt Ltd|India|25|07 May 2010|
|UTI Trustee Co Pvt Ltd|India|25|07 May 2010|
|Indo-Zambia Bank Limited|Zambia|20|26 Oct 2002|
|Small Industries Development Bank of India (SIDBI)|India|4.4|28 Feb 2014|

When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|VALIDATED DATE|
|Bank of Baroda (Botswana) Limited|Botswana|100|24 Nov 2001|
|Bank of Baroda (Ghana) Ltd|Ghana|100|07 May 2010|
|Bank of Baroda (Guyana) Incorporated|Guyana|100|01 Dec 2001|
|Bank of Baroda (NewZealand) Ltd|New Zealand|100|04 Feb 2011|
|Bank of Baroda (Tanzania) Ltd|Tanzania|100|10 Apr 2005|
|Bank of Baroda (Trinidad and Tobago) Limited|Trinidad & Tobago|100|07 May 2010|
|BOB Capital Market Ltd|India|100|01 Jun 2002|
|BOB Cards Ltd|India|100|20 Mar 2005|
|Nainital Bank Ltd|India|98.57|13 Mar 2015|
|Bank of Baroda (Kenya) Ltd|Kenya|86.7|26 Jun 2005|
|Bank of Baroda (Uganda) Limited|Uganda|80|23 Nov 2003|

When the user changes the percent filter option to View All in the subsidiaries page
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|VALIDATED DATE|
|Bank of Baroda (Botswana) Limited|Botswana|100|24 Nov 2001|
|Bank of Baroda (Ghana) Ltd|Ghana|100|07 May 2010|
|Bank of Baroda (Guyana) Incorporated|Guyana|100|01 Dec 2001|
|Bank of Baroda (NewZealand) Ltd|New Zealand|100|04 Feb 2011|
|Bank of Baroda (Tanzania) Ltd|Tanzania|100|10 Apr 2005|
|Bank of Baroda (Trinidad and Tobago) Limited|Trinidad & Tobago|100|07 May 2010|
|BOB Capital Market Ltd|India|100|01 Jun 2002|
|BOB Cards Ltd|India|100|20 Mar 2005|
|Nainital Bank Ltd|India|98.57|13 Mar 2015|
|Bank of Baroda (Kenya) Ltd|Kenya|86.7|26 Jun 2005|
|Bank of Baroda (Uganda) Limited|Uganda|80|23 Nov 2003|
|Baroda Pioneer Asset Management Co Ltd|India|49|07 May 2010|
|India International Bank (Malaysia) Bhd|Malaysia|40|14 Dec 2012|
|Baroda Gujarat Gramin Bank|India|35|07 May 2010|
|Baroda Rajasthan Kshetriya Gramin Bank|India|35|07 May 2010|
|Baroda Uttar Pradesh Gramin Bank|India|35|19 Jul 2013|
|UTI Asset Management Co Pvt Ltd|India|25|07 May 2010|
|UTI Trustee Co Pvt Ltd|India|25|07 May 2010|
|Indo-Zambia Bank Limited|Zambia|20|26 Oct 2002|
|Small Industries Development Bank of India (SIDBI)|India|4.4|28 Feb 2014|

Examples:
|fid|percentFilter|
|1045|50|

Scenario: User clicks and opens legal title of legal entity that appears in subsidiaries list in a new window
(user is taken to the subsidiaries list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@directOwners @static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user clicks and opens the legal title BAMS Solutions Inc in subsidiaries list in new window in the subsidiaries page
Then the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
|LEGAL TITLE|COUNTRY|PERCENTAGE OWNED|VALIDATED DATE|
|Acceptance Alliance LLC|USA||09 Apr 2010|
|Banc of America Merchant Services LLC|USA||09 Apr 2010|

Examples:
|fid|
|1038|

Scenario: If there are no subsidiaries display "No known entities" for now;
Meta:@static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see message displayed in place of list explaining there are no subsidiaries
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see message displayed in place of list explaining there are no subsidiaries

Examples:
|fid|percentFilter|
|269306|10|

Scenario: Select filter that results in no entities on the list (display no subsidiaries, display message no known entities)
Meta:@static @dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see message displayed in place of list explaining there are no subsidiaries

Examples:
|fid|percentFilter|
|173|25|

Scenario: Covers below scenarios
a. 0. View all is selected by default (displays all direct subsidiaries regardless of percent ownership)
   1. Selecting 10 and above filters out any entities owned by less than 10 or have null ownership
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

Examples:
|fid|percentFilter|
|1045|10|
|1045|25|
|1045|50|

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

Scenario: User clicks and opens legal title of legal entity that appears in subsidiaries list in a new window
(user is taken to the subsidiaries list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user clicks and opens the legal title BAMS Solutions Inc in subsidiaries list in new window in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page

Examples:
|fid|
|1038|

Scenario: User clicks legal title of legal entity that appears in subsidiaries list
(user is taken to the subsidiaries list of that new legal entity, verify that page refreshes to be in the context of the new legal entity)
Meta:@dynamic
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the legal title BAMS Solutions Inc in subsidiaries list in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page

Examples:
|fid|
|1038|

Scenario: Covers below scenarios
a. 0. Legal entities in list have country of operations.
   1. List each unique country once, sort countries in highlight list alphabetically
   2. Select a country highlight, legal entities in the subsidiaries list that have that country of operations are highlighted
b. 0. De-select previously selected filter by clicking on it a second time, removes highlight of legal entities in that country
   1. Select a second country (de-selects previous filter, highlight legal entities by new selected country and removes highlight of legal entities by previous country)
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user selects a country <country> from the country highlight list in the subsidiaries page
Then the user should see the direct subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
Then the user should see the list of unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries page
When the user selects another country <changeCountry> from the country highlight list in the subsidiaries page
Then the user should see the direct subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page
And the previously selected country <country> should be de-selected in the subsidiaries page

Examples:
|fid|country|changeCountry|
|211|Australia|USA|
|815|Colombia|Chile|

Scenario: De-select previously selected filter by clicking on it a second time, removes highlight of legal entities in that country
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user selects a country <country> from the country highlight list in the subsidiaries page
Then the user should see the direct subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page
When the user de-select previously selected country <country> by clicking on it a second time from the country highlight in the subsidiaries page
Then the user should not see the subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page

Examples:
|fid|country|
|211|Australia|
|146115|Ireland|

Scenario: User applies a  filter by percent ownership, countries available in highlight list dynamically updated to only list country of operations of legal entities currently visible on list after filter
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page
Then the user should see the list of unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries page

Examples:
|fid|percentFilter|
|211|50|

Scenario: User applies a filter by percent ownership that results in no legal entities in list or no legal entities that have a country of operations, then no countries populate the available highlight options
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user selects the percent filter option <percentFilter> in the subsidiaries page
Then the user should not see any country in country highlights list in the subsidiaries page

Examples:
|fid|percentFilter|
|173|50|

Scenario: When the user manipulates URL to navigate to an FID for an inactive legal entity. User should see inactive institution page with message "No ownership information available"
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
When the user manipulates URL to navigate to 286840
Then the user should see the inactive institution page with message "No ownership information available"

Examples:
|fid|
|1038|

Scenario: KYC user logout
Given the user is on the ubo login page
When the user logout