Epics: Ownership, Subsidiaries, Full Graph

Covers below features:
JIRA ID - KYC-371 - Zoom on owners graph
JIRA ID - KYC-372 - Zoom on subsidiaries graph
JIRA ID - KYC-371 - Zoom on full graph

Meta:@graphzoom
Scenario: Capture below scenarios for owners graph
a. 0. User clicks minus sign next to zoom slider. Slider moves to the left 1 notch (10 notches total on the slider)
   1. User clicks plus sign next to zoom slider. Slider moves to the right 1 notch (10 notches total on the slider)
   2. User clicks "reset" button next to zoom slider. Zoom slider resets to whatever the original position was upon load
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button
When the user selects a country UK from the country highlight list in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the option to zoom graph in/out on the graphs
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to zoom slider on the graphs
Then the user should see the owners graph zoomed out on the graphs
When the user clicks on the reset button next to zoom slider on the graphs
Then the user should see the owners graph reset to whatever the original position was upon load on the graphs
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user should see the owners graph zoomed in on the graphs

Examples:
|fid|
|LE-1|


Scenario: Capture below scenarios for subsidiaries graph
a. 0. User clicks minus sign next to zoom slider. Slider moves to the left 1 notch (10 notches total on the slider)
   1. User clicks plus sign next to zoom slider. Slider moves to the right 1 notch (10 notches total on the slider)
   2. User clicks "reset" button next to zoom slider. Zoom slider resets to whatever the original position was upon load
Given the user is on the ubo login page
When the user login as a kyc user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the subsidiaries tab
And the user clicks on the graph button
When the user enters percentage as 1 in ownership percentage filter text box in the graphs
Then the user should see the option to zoom graph in/out on the graphs
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to percent filter on the graphs
Then the user should see the subsidiaries graph zoomed out on the graphs
When the user clicks on the reset button next to zoom slider on the graphs
Then the user should see the subsidiaries graph reset to whatever the original position was upon load on the graphs
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user should see the subsidiaries graph zoomed in on the graphs

Examples:
|fid|
|LE-6|


Scenario: Capture below scenarios for full graph
a. 0. User clicks minus sign next to zoom slider. Slider moves to the left 1 notch (10 notches total on the slider)
   1. User clicks plus sign next to zoom slider. Slider moves to the right 1 notch (10 notches total on the slider)
   2. User clicks "reset" button next to zoom slider. Zoom slider resets to whatever the original position was upon load
Given the user is on the ubo login page
When the user login as a ubo user
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the group structure tab
And the user clicks on the graph button
And the user enters percentage as 1 in ownership percentage filter text box in the graphs
And the user clicks on the ultimate beneficial owners filter checkbox in the graph
Then the user should see the option to zoom graph in/out on the graphs
When the user clicks on the minus sign next to zoom slider on the graphs
And the user clicks on the minus sign next to zoom slider on the graphs
When the user hovers cursor over i icon next to country highlight on the graphs
Then the user should see the full graph zoomed out on the graphs
When the user clicks on the reset button next to zoom slider on the graphs
Then the user should see the full graph reset to whatever the original position was upon load on the graphs
When the user clicks on the plus sign next to zoom slider on the graphs
And the user clicks on the plus sign next to zoom slider on the graphs
Then the user should see the full graph zoomed in on the graphs

Examples:
|fid|
|LE-6|
