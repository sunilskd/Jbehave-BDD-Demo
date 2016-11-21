package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.web.kyc.jbehave.pages.PageObject;

public class GraphsSteps {

    private final PageObject pageObject;

    public GraphsSteps(WebDriverProvider webDriverProvider) {
        pageObject = new PageObject(webDriverProvider);
    }

    @When("the user clicks on the graph button")
    public void clickOnGraphButton(){
        pageObject.graphsPage().clickOnGraphButton();
    }

    @Then("the user should see the legal entity $rootEntity, user is currently viewing, as the root and highlighted on the graphs")
    public void verifyRootNodeInTheGraphs(@Named("rootEntity") String rootEntity){
        pageObject.graphsPage().verifyRootNodeInTheGraphs(rootEntity);
    }

    @Then("the user should see the list of subsidiaries in level $level, below the root entity, in the graphs")
    public void verifySubsInTheGraphs(String level){
        pageObject.graphsPage().dVerifyGraphNodesAtLevels(Integer.toString(Integer.parseInt(level)*250), "subsidiaries");
    }

    @Then("the user should see the list of owners in level $level, above the root entity, in the graphs")
    public void verifyOwnersInTheGraphs(String level){
        pageObject.graphsPage().dVerifyGraphNodesAtLevels(Integer.toString(0 - (Integer.parseInt(level)*250)), "owners");
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

//    @Then("the user should see the subsidiaries for the legal entity $legalEntity in the graphs")
//    public void verifySubsidiariesOfAnEntity(String legalEntity){
//        pageObject.graphsPage().verifySubsidiariesOfAnEntity(legalEntity);
//    }

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

//    @Then("the user should see the owners for the legal entity $legalEntity in the graphs")
//    public void verifyOwnersOfAnEntity(String legalEntity){
//        pageObject.graphsPage().verifyOwnersOfAnEntity(legalEntity);
//    }

    @Then("the user should see the ultimate beneficial owners highlighted in the graph $ubosHighlightedExamTable")
    public void verifyUBOsAreHighlighted(ExamplesTable ubosHighlightedExamTable){
        pageObject.graphsPage().verifyUBOsAreHighlighted(ubosHighlightedExamTable);
    }

    @Then("the user should see the highlight removed from ultimate beneficial owners in the graph")
    public void verifyUBOHighlightIsRemoved(){
        pageObject.graphsPage().verifyUBOHighlightIsRemoved();
    }

//    @Then("the user should see the legal title displayed in the nodes when the user hovers over it in the graphs $legalTitleExamTable")
//    public void verifyHoverOverToolTipInNodes(ExamplesTable legalTitleExamTable){
//        pageObject.graphsPage().verifyHoverOverToolTipInNodes(legalTitleExamTable);
//    }

    @Then("user is taken to the respective graph page of that legal entity <nodeTitle>")
    public void verifyGraphPageOfLegalEntity(@Named("nodeTitle")String nodeTitle){
        pageObject.graphsPage().verifyGraphPageOfLegalEntity(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the <nodeTitle> full graph")
    public void captureExpectedScreenShotForFullGraph(@Named("nodeTitle") String nodeTitle){ pageObject.graphsPage().captureExpectedScreenShotForFullGraph(nodeTitle);}

    @When("the user captures the actual snapshot for the <nodeTitle> full graph")
    public void captureActualScreenShotForFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureActualScreenShotForFullGraph(nodeTitle);
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for <nodeTitle> full graph")
    public void compareSnapshotsForFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().compareSnapshotsForFullGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the <nodeTitle> owners graph")
    public void captureExpectedScreenShotForOwnersGraph(@Named("nodeTitle") String nodeTitle){ pageObject.graphsPage().captureExpectedScreenShotForOwnersGraph(nodeTitle);}

    @When("the user captures the actual snapshot for the <nodeTitle> owners graph")
    public void captureActualScreenShotForOwnersGraph(@Named("nodeTitle") String nodeTitle){pageObject.graphsPage().captureActualScreenShotForOwnersGraph(nodeTitle);}

    @Then("the user should see the actual snapshot matching the expected snapshot for <nodeTitle> owners graph")
    public void compareSnapshotsForOwnersGraph(@Named("nodeTitle") String nodeTitle){pageObject.graphsPage().compareSnapshotsForOwnersGraph(nodeTitle);}

    @Then("the user captures the expected snapshot for the <nodeTitle> subsidiaries graph")
    public void captureExpectedScreenShotForSubsGraph(@Named("nodeTitle") String nodeTitle){pageObject.graphsPage().captureExpectedScreenShotForSubsGraph(nodeTitle);}

    @When("the user captures the actual snapshot for the <nodeTitle> subsidiaries graph")
    public void captureActualScreenShotForSubsGraph(@Named("nodeTitle") String nodeTitle){pageObject.graphsPage().captureActualScreenShotForSubsGraph(nodeTitle);}

    @Then("the user should see the actual snapshot matching the expected snapshot for <nodeTitle> subsidiaries graph")
    public void compareSnapshotsForSubsGraph(@Named("nodeTitle") String nodeTitle){pageObject.graphsPage().compareSnapshotsForSubsGraph(nodeTitle);}

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

    @Then("the user should see the zoomed out <nodeTitle> owners graphs")
    public void verifyOwnersGraphIsZoomedOut(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifyOwnersGraphIsZoomedOut(nodeTitle);
    }

    @Then("the user should see the zoomed out <nodeTitle> subsidiaries graph")
    public void verifySubsidiariesGraphIsZoomedOut(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifySubsidiariesGraphIsZoomedOut(nodeTitle);
    }

    @Then("the user should see the zoomed out <nodeTitle> full graphs")
    public void verifyFullGraphIsZoomedOut(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifyFullGraphIsZoomedOut(nodeTitle);
    }

    @Then("the user should see the zoomed in <nodeTitle> owners graphs")
    public void verifyOwnersGraphIsZoomedIn(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifyOwnersGraphIsZoomedIn(nodeTitle);
    }

    @Then("the user should see the zoomed in <nodeTitle> subsidiaries graphs")
    public void verifySubsidiariesGraphIsZoomedIn(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifySubsidiariesGraphIsZoomedIn(nodeTitle);
    }

    @Then("the user should see the zoomed in <nodeTitle> full graphs")
    public void verifyFullGraphIsZoomedIn(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifyFullGraphIsZoomedIn(nodeTitle);
    }

    @Then("the user should see the graph reset to whatever the original position was upon load on the <nodeTitle> owners graphs")
    public void verifyOwnersGraphIsResetToOriginalPosition(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifyOwnersGraphIsResetToOriginalPosition(nodeTitle);
    }

    @Then("the user should see the graph reset to whatever the original position was upon load on the <nodeTitle> subsidiaries graphs")
    public void verifySubsidiariesGraphIsResetToOriginalPosition(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifySubsidiariesGraphIsResetToOriginalPosition(nodeTitle);
    }

    @Then("the user should see the graph reset to whatever the original position was upon load on the <nodeTitle> full graphs")
    public void verifyFullGraphIsResetToOriginalPosition(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().verifyFullGraphIsResetToOriginalPosition(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the zoomed out <nodeTitle> owners graph")
    public void captureZoomedOutOwnersGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureZoomedOutOwnersGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the zoomed out <nodeTitle> subsidiaries graph")
    public void captureZoomedOutSubsidiariesGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureZoomedOutSubsidiariesGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the zoomed in <nodeTitle> owners graph")
    public void captureZoomedInOwnersGraph(String nodeTitle){
        pageObject.graphsPage().captureZoomedInOwnersGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the reset <nodeTitle> owners graph")
    public void captureResetOwnersGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureResetOwnersGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the reset <nodeTitle> subsidiaries graph")
    public void captureResetSubsidiariesGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureResetSubsidiariesGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the zoomed in <nodeTitle> subsidiaries graph")
    public void captureZoomedInSubsidiariesGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureZoomedInSubsidiariesGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the zoomed out <nodeTitle> full graph")
    public void captureZoomedOutFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureZoomedOutFullGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the zoomed in <nodeTitle> full graph")
    public void captureZoomedInFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureZoomedInFullGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the reset <nodeTitle> full graph")
    public void captureResetFullGraph(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().captureResetFullGraph(nodeTitle);
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

    @When("the user clicks on show more link which appears on the legal entity node <nodeTitle> in the graphs")
    public void clickOnShowMoreLink(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().clickOnShowMoreLink(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the subsidiaries page <nodeTitle>")
    public void eCaptureSubsidiariesPageTruncatedGraph(@Named("nodeTitle")String nodeTitle){
        pageObject.graphsPage().eCaptureSubsidiariesPageTruncatedGraph(nodeTitle);
    }

    @Then("the user captures the expected snapshot for the owners page <nodeTitle>")
    public void eCaptureOwnersPageTruncatedGraph(@Named("nodeTitle")String nodeTitle){
        pageObject.graphsPage().eCaptureOwnersPageTruncatedGraph(nodeTitle);
    }

    @Then("the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5")
    public void verifyGraphsAreTruncatedBy5PerLogicMsg(){
        pageObject.graphsPage().verifyGraphsAreTruncatedBy5PerLogicMsg();
    }

    @Then("the user should see the notification message that the graphs are truncated as it has more than 125 triples and more than 2500 nodes")
    public void verifyGraphsAreTruncatedBy2500NodesLogicMsg(){
        pageObject.graphsPage().verifyGraphsAreTruncatedBy2500NodesLogicMsg();
    }

    @Then("the user should see the notification message that the graphs are truncated as it has more than 125 triples and more than 2500 nodes and the pdf will be downloaded as a list")
    public void verifyGraphsAreTruncatedBy2500NodesLogicAndPdfAsAListMsg(){
        pageObject.graphsPage().verifyGraphsAreTruncatedBy2500NodesLogicAndPdfAsAListMsg();
    }

    @Then("the user should see the notification message that the graphs are truncated as it has more than 125 triples and ownership relationship exists with percent less than 5 and the pdf will be downloaded as a list")
    public void verifyGraphsAreTruncatedBy5PerLogicAndPdfAsAListMsg(){
        pageObject.graphsPage().verifyGraphsAreTruncatedBy5PerLogicAndPdfAsAListMsg();
    }

    @When("the user resize graph to $translate")
    public void resizeGraphs(@Named("translate") String translate){
        pageObject.graphsPage().resizeGraphs(translate);
    }

    @Then("the user should be able to save the file <fid> (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the group structure graph page")
    public void verifySavedPDFGroupStructureGraphFile(@Named("fid")String fid){
        pageObject.graphsPage().verifySavedPDFGroupStructureGraphFile(fid);
    }

    @Then("the user should be able to save the file <fid>, as a list instead of the graph (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the group structure graph page")
    public void verifySavedPDFGroupStructureGraphAsListFile(@Named("fid")String fid){
        pageObject.graphsPage().verifySavedPDFGroupStructureGraphAsListFile(fid);
    }

    @Then("the user should be able to save the file <fid> (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the owners graph page")
    public void verifySavedPDFOwnersGraphFile(@Named("fid")String fid){
        pageObject.graphsPage().verifySavedPDFOwnersGraphFile(fid);
    }

    @Then("the user should be able to save the file <fid>, as a list instead of the graph (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the owners graph page")
    public void verifySavedPDFOwnersGraphAsListFile(@Named("fid")String fid){
        pageObject.graphsPage().verifySavedPDFOwnersGraphAsListFile(fid);
    }

    @Then("the user should be able to save the file <fid> (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the subsidiaries graph page")
    public void verifySavedPDFSubsidiariesGraphFile(@Named("fid") String fid){
        pageObject.graphsPage().verifySavedPDFSubsidiariesGraphFile(fid);
    }

    @Then("the user should be able to save the file <fid>, as a list instead of the graph (highlighted nodes will be shown only on saved graph and not list, filter panel will not be shown for graph or list) in the subsidiaries graph page")
    public void verifySavedPDFSubsidiariesGraphAsListFile(@Named("fid") String fid){
        pageObject.graphsPage().verifySavedPDFSubsidiariesGraphAsListFile(fid);
    }

}

