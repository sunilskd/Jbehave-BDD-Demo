.Overall Report

image:.uat.EntityDetails.stats.png
----

JIRA ID - KYC-484 - Display zip code for addresses in entity details

Meta:@entityDetailsLive @live

Scenario: UBO user login
Given the user is on bankers almanac page
When the user login as a ubo user to bankers almanac page

Scenario: Covers below scenarios
a. 0. Display all head office entity where useInaddress is true
   1. With LEI (with multiple LEIs (sort by LEI issuer name alphabetically (ascending) ignoring "The" in identifiers section)
   2. With GIIN (display in identifiers section)
   4. If active SWIFT BICs have assigned institution that is the entity user is viewing, then display SWIFT BICs on entity details sorted first by length (short to long) then by alpha-numeric
   5. Entity With website, display hyperlink in summary section
   6. Displaye zip code in registered office address position as afterArea
b. 0. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
   1. Displaye zip code in head office address position as beforeCity
c. 0. If active stock exchange relationship(s) exist, display legal title of stock exchange and abbreviated name in summary section sort first by primary = true, then by legal title
   1. If active stock exchange relationship(s) exist, display abbreviated name of stock exchange and ticker symbol for that stock exchange relationship in identifiers section, sort first by primary = true, then by abbreviated stock exchange name
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin, lei, sorted alphabetically by issuer name, and fatca status for the selected institution in the entity details page
And the user should see the list of swift bics sorted first by length (short to long) then by alpha-numerically in the entity details page
And the user should see the list of stock exchanges first by primary,then alphabetically by stock exchange name in the entity details page
And the user should see the list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name in the entity details page
And the user should see regulators information, sorted by alphabetically in the entity details page
And the user should see website information in the summary section of entity details page
Then the user should not see the registered office address and label on entity details page

Examples:
|fid|
|1038|
|58285|
|4236|

Scenario: Covers below scenarios
a. 0. With FATCA status value (display in identifiers section)
   1. If inactive SWIFT BIC has assigned institution that is the entity user is viewing, then do not display
   2. With registered office address elements with varying "UseInAddress" flag values for each element (display element if UseInAddress is true) (display head office address in summary section)
   3. Do not displaye zip code in registered office address when zip code and position are null
   4. Do not displaye zip code in headoffice office address when zip code and position are null
b. 0. If abbreviated name does not exist for stock exchange, then display all other available stock exchange info but not abbreviated name in summary or identifiers section
   1. If no ticker symbol exists, display all other available info but no ticker symbol in identifiers section
   2. With registered office address elements with varying "UseInAddress" flag value true for each element
When the user opens legal entity <fid>
When the user clicks on the entity details tab
Then the user should see the headers with institution legal title and bankers almanac id in entity details page
Then the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page
And the user should see the identifiers with giin, lei, sorted alphabetically by issuer name, and fatca status for the selected institution in the entity details page
And the user should see the list of swift bics sorted first by length (short to long) then by alpha-numerically in the entity details page
And the user should see the list of stock exchanges first by primary,then alphabetically by stock exchange name in the entity details page
And the user should see the list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name in the entity details page
And the user should see regulators information, sorted by alphabetically in the entity details page
And the user should see website information in the summary section of entity details page
Then the user should see the registered office address(address line 1 line2 line3 line 4,city,area,subarea,country) respecting the useInAddres flag in summary section

Examples:
|fid|
|815|
|15586|

Scenario: When the user manipulates URL to navigate to an FID for an inactive legal entity. User should see inactive institution page with message "No ownership information available"
When the user opens legal entity <fid>
And the user clicks on the entity details tab
When the user manipulates URL to navigate to 286840
Then the user should see the inactive institution page with message "No ownership information available"

Examples:
|fid|
|1038|

Scenario: UBO user logout
Given the user is on bankers almanac page
When the user logout from banker almanac page