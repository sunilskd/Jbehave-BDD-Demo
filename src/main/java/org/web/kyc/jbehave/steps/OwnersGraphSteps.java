package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.annotations.Aliases;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

/**
 * Created by sahug on 5/24/2016.
 */
public class OwnersGraphSteps {

    private final PageObject pageObject;

    public OwnersGraphSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user selects a country $country from the country highlight list in the owners graph page")
    @Aliases(values={"the user selects another country $country from the country highlight list in the owners graph page",
            "the user de-selects the selected country by selecting $country from the country highlight list in the owners graph page"})
    public void selectCountryHighlightInGraphs(@Named("country") String country){
        pageObject.commonUtils().selectCountryHighlightInGraphs(country);
    }

    @Then("the user should see the below owners in the owners graph that have the selected country of operations highlighted in the owners graph page $subsidiariesHighlightedExamTable")
    public void verifyNodesAreHighlightedForSelectedCountry(ExamplesTable subsidiariesHighlightedExamTable) {
        pageObject.commonUtils().verifyNodesAreHighlightedForSelectedCountry(subsidiariesHighlightedExamTable);
    }

    @Then("the user should not see any nodes in level $level, above the root entity, in the owners graph")
    public void verifyStopTravelingPath(String level){
        pageObject.commonUtils().verifyStopTravelingPath(Integer.toString(600 - (Integer.parseInt(level) * 180)));
    }


    @Then("the user should see the multiple appearance bar for <legalEntityTitle> indicating the number of times, <countValue> ,it appears in the graph")
    public void verifyingCountForMultipleDisplayedNodes(@Named("legalEntityTitle")String legalEntityTitle, @Named("countValue")String countValue){
        pageObject.ownersGraphPage().verifyingCountForMultipleDisplayedNodes(legalEntityTitle,countValue);
    }

    @Then("the user should not see the visual indicator displayed for non-person/non-entity when appeared multiple time for <entity> in the graph")
    @Alias("the user should not see the visual indicator displayed for free text ownership when appeared multiple time for <entity> in the graph")
    public void verifyIndicatorNotDisplayed(@Named("entity") String entity){
        pageObject.ownersGraphPage().verifyIndicatorNotDisplayed(entity);
    }

    @Then("the user should see the nodes for <legalEntityTitle> highlighted everywhere it appears in the graph")
    public void verifyingHighLightDisplayedForMultipleNode(@Named("legalEntityTitle") String legalEntityTitle){
        pageObject.ownersGraphPage().verifyingHighLightDisplayedForMultipleNode(legalEntityTitle);
    }

    @When("the user clicks on <legalEntityTitle> node which appears more than once in the graphs")
    public void selectingNodeToBeClicked(@Named("legalEntityTitle") String legalEntityTitle){
        pageObject.ownersGraphPage().selectingNodeToBeClicked(legalEntityTitle);
    }

    @When("the user clicks on the graph node with title $nodeTitle, user is currently viewing in the owners graph")
    @Alias("the user clicks on the graph node with title <nodeTitle>, user is currently viewing in the graph")
    public void clickPartialLinkText(@Named("nodeTitle") String nodeTitle){
        pageObject.commonUtils().clickPartialLinkText(nodeTitle);
    }

    @Then("the user should see below free text in the side panel of owners graph $freeTextExampleTable")
    public void verifyFreeTextInSidePanel(ExamplesTable freeTextExampleTable){
        pageObject.ownersGraphPage().verifyFreeTextInSidePanel(freeTextExampleTable);
    }

    @When("the user clicks on close button on the side panel in the owners graph")
    public void closeSidePanel(){
        pageObject.commonUtils().closeSidePanel();
    }

    @Then("side panel should be closed and user should continue to be on owners graph page")
    public void verifySidePanelIsClosed(){
        pageObject.commonUtils().verifySidePanelIsClosed();
    }

    @Then("the user should not see visual indicator for legal entity <entityType>, when displayed only once")
    public void verifyVisualIndicatorNotDisplayedForSingleLegalEntity(@Named("entityType") String entityType){
        pageObject.ownersGraphPage().verifyVisualIndicatorNotDisplayedForSingleLegalEntity(entityType);
    }

    @Then("the user should not see the visual indicator for entity with same name but different fid <entityType>")
    public void verifyVisualIndicatorNotDisplayedForEntityDiffFid(@Named("entityType") String entityType){
        pageObject.ownersGraphPage().verifyVisualIndicatorNotDisplayedForEntityDiffFid(entityType);
    }

    @Then("the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <nodeTitle> user clicked")
    public void dVerifyDetailsSectionInSidePanel(@Named("nodeTitle")String nodeTitle){
        pageObject.commonUtils().dVerifyDetailsSectionInSidePanel(nodeTitle);
    }
    @Then("the user should see complete headoffice address, regulators and stock exchanges in details section of side panel for the node <switchNode> user clicked")
    @Alias("the user should see list of direct subsidiaries with entity title,country and percentage ownership in directly owns section of side panel for the node <switchNode> user clicked")
    public void dVerifyDetailsSectionInSidePanelIsUpdated(@Named("switchNode")String nodeTitle){
        pageObject.commonUtils().dVerifyDetailsSectionInSidePanelIsUpdated(nodeTitle);
    }
    @Then("the user should see list of direct subsidiaries with entity title,country and percentage ownership in directly owns section of side panel for the node <nodeTitle> user clicked")
    public void dVerifyDirectlyOwnsSectionInSidePanel(@Named("nodeTitle")String nodeTitle){
        pageObject.commonUtils().dVerifyDirectlyOwnsSectionInSidePanel(nodeTitle);
    }

    @When("the user clicks on the graph page")
    public void userClicksOnGraph(){
        pageObject.commonUtils().userClicksOnGraph();
    }

    @Then("the side panel should still exists on the graph")
    public void verifySidePanelIsOpen(){
        pageObject.commonUtils().verifySidePanelIsOpen();
    }

    @Then("the kyc user should not see ubo list in side panel of graph page")
    public void verifyUboListIsNotDisplayed(){
        pageObject.commonUtils().verifyUboListIsNotDisplayed();
    }

    @Then("the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <nodeTitle> user clicked $uboListExamTable")
    @Alias("the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <switchNode> user clicked $uboListExamTable")
    public void dVerifyUBOSectionInSidePanel(ExamplesTable uboListExamTable){
        pageObject.commonUtils().dVerifyUBOSectionInSidePanel(uboListExamTable);
    }

    @Then("the user should see message displayed as no known entities under directly owns section in side panel of graph page")
    public void verifyNoKnowsEntitiesMessage(){
        pageObject.commonUtils().verifyNoKnowsEntitiesMessage();
    }

    @Then("the user should see message displayed as no known entities under ubo section in side panel of graph page")
    public void verifyNoKnowsEntitiesMessageUBOs(){
        pageObject.commonUtils().verifyNoKnowsEntitiesMessageUBOs();
    }

    @When("the user clicks on the graph node with title <switchNode>, in the graph")
    public void clickGraphNode(@Named("switchNode") String switchNode){
        pageObject.commonUtils().clickGraphNode(switchNode);
    }
    
    @Then("the user should see the below owners for the legal entity $legalEntity in the owners graph $ownersExamTable")
    @Alias("the user should see the below owners for the legal entity $legalEntity in the full graph $ownersExamTable")
    public void verifyOwnersOfEntity(String legalEntity, ExamplesTable ownersExamTable){
        pageObject.commonUtils().verifyOwnersOfEntity(legalEntity, ownersExamTable);
    }
}