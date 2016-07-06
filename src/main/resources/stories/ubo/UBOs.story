Epic: UBO

A KYC analyst has to follow a due diligence process to satisfy legal requirements to prove that any potential business partnerships
will not result in funding illegal activities such as money laundering and terrorist financing. A key part of this process is to prove that there are
no owners, including an ultimate beneficial owner which is a natural person, of the bank they will potentially do business with which are politically exposed
or known to be involved in criminal activities. A UBO user of the application has paid for premium access, which includes the
same access as a KYC user but with additional data about UBOs (people).

----
image:UBO.png[UBO]
----

UBO user has access to below entity types -
1. Person
2. Legal Entities
3. Other entity types (non-institution, non-person)
4. UBO list

UBO user does not has access to below entity types -
1. Free text ownership

Covers below features:
JIRA ID - KYC-90 -  UBO user can view list of UBOs
JIRA ID - KYC-253 - Add source to UBO list
JIRA ID - KYC-195 - UBO user can filter UBO list by percent ownership
JIRA ID - KYC-315 - UBO list - dates are not displayed.

Meta:@owners @ubo @ubos

Scenario: UBO user login
Given the user is on the ubo login page
When the user login as a ubo user

Scenario: UBO User can view list of all UBOs
a. 0. UBO user can view all direct and indirect owners that are people, in the ownership path of an enity.
   1. UBOs are ordered by percentage ownership, then alphabetically by personSortKey.
   2. UBOs has validated date with accuracy attribute of day, month or year (If day, display day, month and year. If month, display only month and year. If year, display only year)
   3. Unique UBO that owns multiple entities should be displayed in the UBO(Example person G)
   4. UBOs has source as "source, extended source" when both source and extended source are present
   5. Display source as "source" when only source is present
   6. Do not display source when source and extecnded source are not present
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|QA Test Person C|QA Legal Entity D|50.52|27 Mar 2015|Legal Entity D owned by Person C|
|QA Test Person G|QA Legal Entity B|50.222|27 Mar 2015|Legal Entity B owned by Person B|
|QA Test Person D|QA Legal Entity C|49.23|27 Mar 2015|Legal Entity C owned by Person D|
|QA Test Person E|QA Legal Entity A|49.23|27 Mar 2015|Legal Entity A owned by Person E, Legal Entity A is also owned by Person A|
|QA Test Person H|QA Legal Entity D|49.23|27 Mar 2015|Legal Entity C owned by Person D|
|QA Test Person A|QA Legal Entity A|45.52|Mar 2015||
|QA Test Person A|QA Legal Entity A|45.52|Mar 2015||
|QA Test Person B|QA Legal Entity B|40.23|27 Mar 2015|Legal Entity B owned by Person B|
|QA Test Person G|QA Legal Entity C|4.93|27 Mar 2015|Legal Entity C owned by Person G|
|QA Test Person G|QA Legal Entity D|4.23|27 Mar 2015|Legal Entity C owned by Person D|

Examples:
|fid|
|LE-A|

Scenario: UBO User can view list of Direct and Indirect UBOs, and not Inactive ownership relationship
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|QA Test Person C|QA Legal Entity D|50.52|27 Mar 2015|Legal Entity D owned by Person C|
|QA Test Person D|QA Legal Entity C|49.23|27 Mar 2015|Legal Entity C owned by Person D|
|QA Test Person H|QA Legal Entity D|49.23|27 Mar 2015|Legal Entity C owned by Person D|
|QA Test Person G|QA Legal Entity C|4.93|27 Mar 2015|Legal Entity C owned by Person G|
|QA Test Person G|QA Legal Entity D|4.23|27 Mar 2015|Legal Entity C owned by Person D|

Examples:
|fid|
|LE-C|

Scenario: UBO User can view multiple UBOs of the same enity
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|QA Test Person G|QA Legal Entity B|50.222|27 Mar 2015|Legal Entity B owned by Person B|
|QA Test Person B|QA Legal Entity B|40.23|27 Mar 2015|Legal Entity B owned by Person B|

Examples:
|fid|
|LE-B|

Scenario: UBO User can view UBOs when percentage ownership is null
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Japan Finance Corporation|Japan Bank For International Cooperation||11 Nov 2011|Japan Bank For International Cooperation|

Examples:
|fid|
|241440|

Scenario: If there are no UBOs exists, display "No known entities"
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see message displayed in place of list explaining there are no UBOs

Examples:
|fid|
|211|

Scenario: UBO User can view list of all UBOs
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Anthony G. Buzbee|HomeTown Bank National Association|3.75|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|G. William Rider|HomeTown Bank National Association|3.41|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|T. A. Waterman,, Jr|HomeTown Bank National Association|2.34|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Jimmy Rasmussen|HomeTown Bank National Association|1.84|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Stacy Dienst|HomeTown Bank National Association|1.02|10 Mar 2016|HomeTown Bank National Association|
|Maurice Estlinbaum|HomeTown Bank National Association|0.76|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Robert L. Moody, Jr|HomeTown Bank National Association|0.52|10 Mar 2016|HomeTown Bank National Association|
|Greg S. Garison|HomeTown Bank National Association|0.43|10 Mar 2016|HomeTown Bank National Association|
|Sidney C. Farmer, III|HomeTown Bank National Association|0.34|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Dorothea Matthews Balentine|HomeTown Bank National Association|0.31|10 Mar 2016|HomeTown Bank National Association|
|Joe Saladino|HomeTown Bank National Association|0.3|10 Mar 2016|HomeTown Bank National Association, Third Party Supplier|
|Kent Ballard|HomeTown Bank National Association|0.29|10 Mar 2016|HomeTown Bank National Association|
|Michael J. Gaido,, Jr|HomeTown Bank National Association|0.26|10 Mar 2016|HomeTown Bank National Association|
|E. Vince Matthews, III|HomeTown Bank National Association|0.26|10 Mar 2016|HomeTown Bank National Association|
|Bob Pagan|HomeTown Bank National Association|0.26|10 Mar 2016|HomeTown Bank National Association|

Examples:
|fid|
|12538|

Scenario: UBO user can filter UBO list by percent ownership
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|QA Test Person C|QA Legal Entity D|50.52|27 Mar 2015|Legal Entity D owned by Person C|
|QA Test Person G|QA Legal Entity B|50.222|27 Mar 2015|Legal Entity B owned by Person B|

Examples:
|fid|percentFilter|
|LE-A|50|

Scenario: Covers below scenarios
a. 0. There are no UBOs to display, then display "No known entities"
   1. User selects view all filter, then display entire UBO list.
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user selects the percent filter option <percentFilter> in the owners page
Then the ubo user should see message displayed in place of list explaining there are no UBOs
When the user changes the percent filter option to View All in the owners page
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Anthony G. Buzbee|HomeTown Bank National Association|3.75|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|G. William Rider|HomeTown Bank National Association|3.41|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|T. A. Waterman,, Jr|HomeTown Bank National Association|2.34|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Jimmy Rasmussen|HomeTown Bank National Association|1.84|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Stacy Dienst|HomeTown Bank National Association|1.02|10 Mar 2016|HomeTown Bank National Association|
|Maurice Estlinbaum|HomeTown Bank National Association|0.76|10 Mar 2016|HomeTown Bank National Association, Direct From Institution|
|Robert L. Moody, Jr|HomeTown Bank National Association|0.52|10 Mar 2016|HomeTown Bank National Association|
|Greg S. Garison|HomeTown Bank National Association|0.43|10 Mar 2016|HomeTown Bank National Association|
|Sidney C. Farmer, III|HomeTown Bank National Association|0.34|10 Mar 2016|HomeTown Bank National Association, From Institution's Website|
|Dorothea Matthews Balentine|HomeTown Bank National Association|0.31|10 Mar 2016|HomeTown Bank National Association|
|Joe Saladino|HomeTown Bank National Association|0.3|10 Mar 2016|HomeTown Bank National Association, Third Party Supplier|
|Kent Ballard|HomeTown Bank National Association|0.29|10 Mar 2016|HomeTown Bank National Association|
|Michael J. Gaido,, Jr|HomeTown Bank National Association|0.26|10 Mar 2016|HomeTown Bank National Association|
|E. Vince Matthews, III|HomeTown Bank National Association|0.26|10 Mar 2016|HomeTown Bank National Association|
|Bob Pagan|HomeTown Bank National Association|0.26|10 Mar 2016|HomeTown Bank National Association|

Examples:
|fid|percentFilter|
|12538|10|

Scenario: UBO user can view UBO, of an entity owned by only one owner
Meta:@static
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
Then the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page
|UBO NAME|UBO ENITY|PERCENTAGE OWNED|LAST VALIDATED DATE|SOURCE|
|Ruth de la Cour - Vontobel|Vontobel Holding AG|5.5|10 Mar 2016|Vontobel Holding AG|

Examples:
|fid|
|11262|

Scenario: UBO user logout
Given the user is on the ubo login page
When the user logout