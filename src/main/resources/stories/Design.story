Meta:@design

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

e. Display all head office entity where useInaddress is true
Scenario: KYC user login
Meta: @id login
Given the user is on the ubo login page
When the user login as a kyc user

Scenario: View side panel for legal entity on owners graph
a. 0. User clicks title of legal entity on node (could be owner on graph or root node), side panel opens with more details about the entity
   1. With head office address elements with varying "UseInAddress" flag value true for each element (display element if UseInAddress is true)
   2. With head office address elements with varying "UseInAddress" flag value false for each element (do not display element if UseInAddress is false)
b. Active regulation relationships exist for entity user is viewing, display in entity details summary section sorted alphabetically by legal title
c. If only inactive regulation relationship exists, then display field label but no value
d. 0. If no regulation relationship exists, then display field label but no value
   1. If no stock exchange relationship exists, display field label in summary section but no value
   2. If no stock exchange relationship exists, display field label in identifier section but no value
   3. If no stock exchange relationship exists, display field label but no value
e. If regulation relationship is inactive, then display field label but no value
f. If active stock exchange relationship(s) exist, display legal title of stock exchange sort first by primary = true, then by legal title
g. If inactive stock exchange relationship, then display field label but no value
m.
x. User clicks close icon, side panel hides
y. User clicks someplace else on screen outside of side panel, panel does not close
Given the user is on the ubo login page
When the user opens legal entity <fid>
When the user clicks on the ownership tab
And the user clicks on the owners tab
And the user clicks on the graph button

And the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the owners graph
Then the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked
Then the user should see list of direct subsidairies with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked

Examples:
|fid|nodeTitle|
|815|Banco Popular|