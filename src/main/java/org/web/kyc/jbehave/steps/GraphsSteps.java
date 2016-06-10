package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
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

    @Then("the user should see the list of below owners in level $level, above the root entity, in the owners graphs $ownersExamTable")
    public void verifyGraphNodes(String level, ExamplesTable ownersExamTable){
        pageObject.graphsPage().verifyGraphNodes(Integer.toString(500 - (Integer.parseInt(level)*180)), ownersExamTable);
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


    @When("the user clicks on the graph node with title $nodeTitle, user is currently viewing in the graphs")
    @Alias("the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph")
    public void clickPartialLinkText(@Named("nodeTitle") String nodeTitle){
        pageObject.graphsPage().clickPartialLinkText(nodeTitle);
    }

    @Then("the user should not see visual indicator for legal entity <legalEntity>, when displayed only once")
    public void verifyVisualIndicatorNotDisplayedForSingleLegalEntity(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().verifyVisualIndicatorNotDisplayedForSingleLegalEntity(legalEntity);
    }

    @Then("the user should not see the visual indicator for entity with same name but different fid <legalEntity>")
    public void verifyVisualIndicatorNotDisplayedForEntityDiffFid(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().verifyVisualIndicatorNotDisplayedForEntityDiffFid(legalEntity);
    }

    @When("the user clicks on the graph node with title <switchNode>, in the graphs")
    public void clickGraphNode(@Named("switchNode") String switchNode){
        pageObject.graphsPage().clickGraphNode(switchNode);
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

}
