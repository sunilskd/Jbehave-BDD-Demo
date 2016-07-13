package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class GraphsSteps {

    private final PageObject pageObject;

    public GraphsSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the graph button")
    public void clickOnGraphButton(){
        pageObject.graphsPage().clickOnGraphButton();
    }

    @Then("the user should see the legal entity $rootEntity, user is currently viewing, as the root and highlighted in the graphs")
    public void verifyRootNodeInTheGraphs(@Named("rootEntity") String rootEntity){
        pageObject.graphsPage().verifyRootNodeInTheGraphs(rootEntity);
    }

    @Then("the user should see the list of below subsidiaries in level $level, below the root entity, in the graphs $subsidiariesExamTable")
    public void verifySubsInTheGraphs(String level, ExamplesTable subsidiariesExamTable){
        pageObject.graphsPage().verifyGraphNodes(Integer.toString(Integer.parseInt(level)*180), subsidiariesExamTable);
    }

    @Then("the user should see the list of below owners in level $level, above the root entity, in the graphs $ownersExamTable")
    public void verifyOwnersInTheGraphs(String level, ExamplesTable ownersExamTable){
        pageObject.graphsPage().verifyGraphNodes(Integer.toString(0 - (Integer.parseInt(level)*180)), ownersExamTable);
    }

    @Then("the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs")
    public void verifyVisualIndicatorNotDisplayedForSubsidiaries(){
        pageObject.graphsPage().verifyVisualIndicatorNotDisplayedForSubsidiaries();
    }

    @Then("the user should see message displayed in place of graph explaining there are no entities in the graphs")
    public void verifyNoEntitiesMsg() {
        pageObject.graphsPage().verifyNoEntitiesMsg();
    }

    @Then("the user should see the below entities that have the selected country of operations highlighted in the graphs $highlightedEntitiesExamTable")
    public void verifyEntitiesAreHighlightedForSelectedCountry(ExamplesTable highlightedEntitiesExamTable){
        pageObject.graphsPage().verifyEntitiesAreHighlightedForSelectedCountry(highlightedEntitiesExamTable);
    }

    @Then("the user should not see the entities highlighted in the graphs")
    public void verifyNoCountryHighlightedNodes() {
        pageObject.graphsPage().verifyNoCountryHighlightedNodes();
    }

    @Then("the user should not see any nodes in level $level, below the root entity, in the graphs")
    public void verifyStopTravelingPath(String level){
        pageObject.graphsPage().verifyStopTravelingPath(Integer.toString((Integer.parseInt(level) * 180)));
    }

    @Then("the user should see the below subsidiaries for the legal entity $legalEntity in the graphs $subsidiariesExamTable")
    public void verifySubsidiariesOfAnEntity(String legalEntity, ExamplesTable subsidiariesExamTable){
        pageObject.graphsPage().verifySubsidiariesOfAnEntity(legalEntity, subsidiariesExamTable);
    }

    @Then("the user should not see any nodes in level $level, above the root entity, in the owners graph")
    public void verifyStopTravelingOwnersPath(String level){
        pageObject.graphsPage().verifyStopTravelingPath(Integer.toString(600 - (Integer.parseInt(level) * 180)));
    }

    @Then("the user should not see any nodes in level $level, above the root entity, in the graphs")
    public void verifyStopTravelingOwnersFullGraphPath(String level){
        pageObject.graphsPage().verifyStopTravelingPath(Integer.toString(0 - (Integer.parseInt(level) * 180)));
    }

    @Then("the user should see the multiple appearance bar for <legalEntity> indicating the number of times, <countValue> ,it appears in the graphs")
    public void verifyingCountForMultipleDisplayedNodes(@Named("legalEntity")String legalEntity, @Named("countValue")String countValue){
        pageObject.graphsPage().verifyingCountForMultipleDisplayedNodes(legalEntity,countValue);
    }

    @Then("the user should not see the visual indicator displayed for non-person/non-entity when appeared multiple time for <entity> in the graphs")
    @Alias("the user should not see the visual indicator displayed for free text ownership when appeared multiple time for <entity> in the graphs")
    public void verifyIndicatorNotDisplayed(@Named("entity") String entity){
        pageObject.graphsPage().verifyIndicatorNotDisplayed(entity);
    }

    @When("the user clicks on <legalEntity> node which appears more than once in the graphs")
    public void selectingNodeToBeClicked(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().selectingNodeToBeClicked(legalEntity);
    }

    @Then("the user should see the nodes for <legalEntity> highlighted everywhere it appears in the graphs")
    public void verifyingHighLightDisplayedForMultipleNode(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().verifyingHighLightDisplayedForMultipleNode(legalEntity);
    }

    @When("the user clicks on the tile of the legal entity <nodeTitle> (including the entity of interest) in the graphs")
    public void clickOnNodeTitle(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().clickOnNodeTitle(nodeTitle);
    }

    @When("the user clicks on the person, non-person or non-entity graph node with title <nodeTitle>, user is currently viewing in the graph")
    public void clickOnNonPersonNonEntity(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().clickOnNonPersonNonEntity(nodeTitle);
    }

    @Then("the user should not see visual indicator for legal entity <legalEntity>, when displayed only once")
    public void verifyVisualIndicatorNotDisplayedForSingleLegalEntity(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().verifyVisualIndicatorNotDisplayedForSingleLegalEntity(legalEntity);
    }

    @Then("the user should not see the visual indicator for entity with same name but different fid <legalEntity>")
    public void verifyVisualIndicatorNotDisplayedForEntityDiffFid(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().verifyVisualIndicatorNotDisplayedForEntityDiffFid(legalEntity);
    }

    @When("the user clicks on the tile of the another legal entity <switchNode> (including the entity of interest) in the graphs")
    public void clickGraphNode(@Named("switchNode") String switchNode){
        pageObject.graphsPage().clickOnNodeTitle(switchNode);
    }

    @Then("the user should see the below owners for the legal entity $legalEntity in the graphs $ownersExamTable")
    public void verifyOwnersOfAnEntity(String legalEntity, ExamplesTable ownersExamTable){
        pageObject.graphsPage().verifyOwnersOfAnEntity(legalEntity, ownersExamTable);
    }

    @Then("the user should see the ultimate beneficial owners highlighted in the graph $ubosHighlightedExamTable")
    public void verifyUBOsAreHighlighted(ExamplesTable ubosHighlightedExamTable){
        pageObject.graphsPage().verifyUBOsAreHighlighted(ubosHighlightedExamTable);
    }

    @Then("the user should see the highlight removed from ultimate beneficial owners in the graph")
    public void verifyUBOHighlightIsRemoved(){
        pageObject.graphsPage().verifyUBOHighlightIsRemoved();
    }

    @Then("the user should see the legal title displayed in the nodes when the user hovers over it in the graphs $legalTitleExamTable")
    public void verifyHoverOverToolTipInNodes(ExamplesTable legalTitleExamTable){
        pageObject.graphsPage().verifyHoverOverToolTipInNodes(legalTitleExamTable);
    }

    @Then("user is taken to the graph page of that legal entity <nodeTitle>")
    public void verifyGraphPageOfLegalEntity(@Named("nodeTitle")String nodeTitle){
        pageObject.graphsPage().verifyGraphPageOfLegalEntity(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the full graph")
    public void captureExpectedScreenShotForFullGraph(){ pageObject.graphsPage().captureExpectedScreenShotForFullGraph();}

    @When("the user captures the actual snapshot for the full graph")
    public void captureActualScreenShotForFullGraph(){
        pageObject.graphsPage().captureActualScreenShotForFullGraph();
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for full graph")
    public void compareSnapshotsForFullGraph(){
        pageObject.graphsPage().compareSnapshotsForFullGraph();
    }

    @Then("the user captures the expected snapshot for the owners graph")
    public void captureExpectedScreenShotForOwnersGraph(){ pageObject.graphsPage().captureExpectedScreenShotForOwnersGraph();}

    @When("the user captures the actual snapshot for the owners graph")
    public void captureActualScreenShotForOwnersGraph(){pageObject.graphsPage().captureActualScreenShotForOwnersGraph();}

    @Then("the user should see the actual snapshot matching the expected snapshot for owners graph")
    public void compareSnapshotsForOwnersGraph(){pageObject.graphsPage().compareSnapshotsForOwnersGraph();}

    @Then("the user captures the expected snapshot for the subsidiaries graph")
    public void captureExpectedScreenShotForSubsGraph(){pageObject.graphsPage().captureExpectedScreenShotForSubsGraph();}

    @When("the user captures the actual snapshot for the subsidiaries graph")
    public void captureActualScreenShotForSubsGraph(){pageObject.graphsPage().captureActualScreenShotForSubsGraph();}

    @Then("the user should see the actual snapshot matching the expected snapshot for subsidiaries graph")
    public void compareSnapshotsForSubsGraph(){pageObject.graphsPage().compareSnapshotsForSubsGraph();}

    @Then("the user should not see the multiple appearance highlight on any node in the graphs")
    public void verifyingHighlightIsNotDisplayedForMultipleNode(){
        pageObject.graphsPage().verifyingHighlightIsNotDisplayedForMultipleNode();
    }

    @Then("the kyc user should see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs")
    public void verifyInProductMessage(){
        pageObject.graphsPage().verifyInProductMessage();
    }

    @Then("the kyc user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs")
    @Alias("the ubo user should not see message displayed there is ubo data available for this entity. you currently do not have access to this data, please subscribe in the graphs")
    public void verifyNoInProductMessage(){
        pageObject.graphsPage().verifyNoInProductMessage();
    }

    @When("the user clicks on the tile of the free text entity $freeText (including the entity of interest) in the graphs")
    public void clickOnFreeText(@Named("freeText") String freeText){
        pageObject.graphsPage().clickOnFreeText(freeText);
    }

    @When("the user clicks on please subscribe link in the message displayed in the graph")
    public void clickOnPleaseSubscribe(){
        pageObject.commonUtils().clickOnPleaseSubscribe();
    }

    @Then("the user should see the owners graph zoomed out on the graphs")
    public void verifyOwnersGraphIsZoomedOut(){
        pageObject.graphsPage().verifyOwnersGraphIsZoomedOut();
    }

    @Then("the user should see the subsidiaries graph zoomed out on the graphs")
    public void verifySubsidiariesGraphIsZoomedOut(){
        pageObject.graphsPage().verifySubsidiariesGraphIsZoomedOut();
    }

    @Then("the user should see the full graph zoomed out on the graphs")
    public void verifyFullGraphIsZoomedOut(){
        pageObject.graphsPage().verifyFullGraphIsZoomedOut();
    }

    @Then("the user should see the owners graph zoomed in on the graphs")
    public void verifyOwnersGraphIsZoomedIn(){
        pageObject.graphsPage().verifyOwnersGraphIsZoomedIn();
    }

    @Then("the user should see the subsidiaries graph zoomed in on the graphs")
    public void verifySubsidiariesGraphIsZoomedIn(){
        pageObject.graphsPage().verifySubsidiariesGraphIsZoomedIn();
    }

    @Then("the user should see the full graph zoomed in on the graphs")
    public void verifyFullGraphIsZoomedIn(){
        pageObject.graphsPage().verifyFullGraphIsZoomedIn();
    }

    @Then("the user should see the owners graph reset to whatever the original position was upon load on the graphs")
    public void verifyOwnersGraphIsResetToOriginalPosition(){
        pageObject.graphsPage().verifyOwnersGraphIsResetToOriginalPosition();
    }

    @Then("the user should see the subsidiaries graph reset to whatever the original position was upon load on the graphs")
    public void verifySubsidiariesGraphIsResetToOriginalPosition(){
        pageObject.graphsPage().verifySubsidiariesGraphIsResetToOriginalPosition();
    }

    @Then("the user should see the full graph reset to whatever the original position was upon load on the graphs")
    public void verifyFullGraphIsResetToOriginalPosition(){
        pageObject.graphsPage().verifyFullGraphIsResetToOriginalPosition();
    }

    @Then("the user captures the expected snapshot for the zoomed out owners graph")
    public void captureZoomedOutOwnersGraph(){
        pageObject.graphsPage().captureZoomedOutOwnersGraph();
    }

    @Then("the user captures the expected snapshot for the zoomed out subsidiaries graph")
    public void captureZoomedOutSubsidiariesGraph(){
        pageObject.graphsPage().captureZoomedOutSubsidiariesGraph();
    }

    @Then("the user captures the expected snapshot for the zoomed in owners graph")
    public void captureZoomedInOwnersGraph(){
        pageObject.graphsPage().captureZoomedInOwnersGraph();
    }

    @Then("the user captures the expected snapshot for the reset owners graph")
    public void captureResetOwnersGraph(){
        pageObject.graphsPage().captureResetOwnersGraph();
    }

    @Then("the user captures the expected snapshot for the reset subsidiaries graph")
    public void captureResetSubsidiariesGraph(){
        pageObject.graphsPage().captureResetSubsidiariesGraph();
    }

    @Then("the user captures the expected snapshot for the zoomed in subsidiaries graph")
    public void captureZoomedInSubsidiariesGraph(){
        pageObject.graphsPage().captureZoomedInSubsidiariesGraph();
    }

    @Then("the user captures the expected snapshot for the zoomed out full graph")
    public void captureZoomedOutFullGraph(){
        pageObject.graphsPage().captureZoomedOutFullGraph();
    }

    @Then("the user captures the expected snapshot for the zoomed in full graph")
    public void captureZoomedInFullGraph(){
        pageObject.graphsPage().captureZoomedInFullGraph();
    }

    @Then("the user captures the expected snapshot for the reset full graph")
    public void captureResetFullGraph(){
        pageObject.graphsPage().captureResetFullGraph();
    }

    @Then("the user should see the subsidiaries graph")
    public void verifySubsGraphHeader(){
        pageObject.graphsPage().verifySubsGraphHeader();
    }

    @Then("the user should see the owners graph")
    public void verifyOwnersGraphHeader(){
        pageObject.graphsPage().verifyOwnersGraphHeader();
    }

    @Then("the user should see the full graph")
    public void verifyFullGraphHeader(){
        pageObject.graphsPage().verifyFullGraphHeader();
    }

    @Then("the user captures the expected snapshot for the <nodeTitle> full graph")
    public void captureExpectedSnapShotForFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureExpectedSnapShotForFullGraph(nodeTitle);
    }

    @Then("the user captures the actual snapshot for the <nodeTitle> full graph")
    public void captureActualSnapShotForFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureActualSnapShotForFullGraph(nodeTitle);
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph")
    public void compareExpectedAndActualSnapshotForFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().compareExpectedAndActualSnapshotForFullGraph(nodeTitle);
    }

    @Then("the user captures the actual snapshot for truncated graph <nodeTitle>")
    public void captureActualSnapShotForTruncatedGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureActualSnapShotForTruncatedGraph(nodeTitle);
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for truncated graph <nodeTitle>")
    public void compareExpectedAndActualSnapshotForSubstruncatedGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().compareExpectedAndActualSnapshotForSubstruncatedGraph(nodeTitle);
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for owners truncated graph <imageName>")
    public void compareExpectedAndActualSnapshotForOwnerstruncatedGraph(@Named("imageName") String imageName){
        pageObject.graphsPage().compareExpectedAndActualSnapshotForOwnerstruncatedGraph(imageName);
    }

    @When("the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs")
    public void clickOnShowMoreLink(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().clickOnShowMoreLink(nodeTitle);
    }
}
