Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-265 interaction between filters and highlights on all graphs

Scenario: User applies filters and highlights on owners graph
a. If user applies percent filter, country highlight drop-down updates to only list country of operations for legal entities currently visible on graph after filter is applied
b. If user applies percent filter, any highlights previously applied (country, UBO or appears multiple) are removed and de-selected
c. If user applies direct relationships only filter, country highlight drop-down updates to only list country of operations for legal entities currently visible on graph after filter is applied
d. If user applies percent filter, any highlights previously applied (country, UBO or appears multiple) are removed and de-selected
e. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible

Scenario: User applies filters and highlights on subs graph
a. If user applies percent filter, country highlight drop-down updates to only list country of operations for legal entities currently visible on graph after filter is applied
b. If user applies percent filter, any highlights previously applied (country, UBO or appears multiple) are removed and de-selected
c. If user applies direct relationships only filter, country highlight drop-down updates to only list country of operations for legal entities currently visible on graph after filter is applied
d. If user applies percent filter, any highlights previously applied (country, UBO or appears multiple) are removed and de-selected
e. If user applies percent or direct filter, appears multiple times count on a legal entity remains the same even if all times the entity appears are no longer visible

Scenario: User applies filters and highlights on full graph
a. If user applies percent filter, country highlight drop-down updates to only list country of operations for legal entities currently visible on graph after filter is applied
b. If user applies percent filter, any highlights previously applied (country, UBO or appears multiple) are removed and de-selected
c. If user applies direct relationships only filter, country highlight drop-down updates to only list country of operations for legal entities currently visible on graph after filter is applied
d. If user applies percent filter, any highlights previously applied (country, UBO or appears multiple) are removed and de-selected
e. If user applies percent or direct filter, appears multiple times count on a legal entity or person remains the same even if all times the entity appears are no longer visible