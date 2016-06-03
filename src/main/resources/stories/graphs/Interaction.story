Epic: Ownership, Subsidiaries, Full Graph

This story is to cover the expected functionality when user applies multiple highlights or filters since they react to each other in various ways.

Covers below features:
JIRA ID - KYC-266 interaction between percent filter and direct/indirect filter on all graphs

Scenario: User applies percent filter and direct relationships only filter on owners graph
a. If user applies "direct relationships only" filter to graph, percent filter resets to 0
b. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect

Scenario: User applies percent filter and direct relationships only filter on subs graph
a. If user applies "direct relationships only" filter to graph, percent filter resets to 0
b. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect


Scenario: User applies percent filter and direct relationships only filter on full graph
a. If user applies "direct relationships only" filter to graph, percent filter resets to 0
b. If user selects a percent filter after applying "direct relationships only" filter, graph filters out any entities that don't have equal to or greater than the selected percent and the direct filter remains in effect
