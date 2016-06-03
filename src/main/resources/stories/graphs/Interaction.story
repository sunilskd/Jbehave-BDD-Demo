Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-262 interaction between appears multiple highlight, country highlight and UBO highlight

Scenario: User applies highlights on owners graph
a. If user applied UBO highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches UBO highlight takes style of UBO highlight
b. If user applied both UBO highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of UBO highlight
c. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
d. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight

Scenario: User applies highlights on full graph
a. If user applied UBO highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches UBO highlight takes style of UBO highlight
b. If user applied both UBO highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of UBO highlight
c. If user applied country highlight then applies appears multiple highlight, then any tile that matches both takes style of appears multiple highlight, any tile that only matches country highlight takes style of country highlight
d. If user applied both country highlight and appears multiple highlight then removes appears multiple highlight, then any tile that previously matched both takes style of country highlight