package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.eclipse.jetty.util.annotation.Name;
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

    @Then("the user should see the legal entity $legalEntity, user is currently viewing, as the root in the owners graph")
    public void verifyOwnersGraphRootNode(@Named("legalEntity") String legalEntity){
        pageObject.ownersGraphPage().verifyOwnersGraphRootNode(legalEntity);
    }

    @Then("the user should see the list of below owners in level $level, above the root entity, in the owners graph $ownersExamTable")
    public void verifyGraphNodes(String level, ExamplesTable ownersExamTable){
        pageObject.commonUtils().verifyGraphNodes(Integer.toString(600 - (Integer.parseInt(level)*180)), ownersExamTable);
    }

    @Then("the user should see no country highlight selected by default in country highlight drop-down in the owners graph page")
    public void verifyNoCountryHighlightSelection(){
        pageObject.commonUtils().verifyNoCountryHighlightSelection();
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

    @Then("the user should see message displayed in place of graph explaining there are no owners")
    public void verifyNoOwnersMsg() {
        pageObject.commonUtils().verifyNoEntitiesMsg();

    }

    @Then("the user should not see any nodes in level $level, above the root entity, in the owners graph")
    public void verifyStopTravelingPath(String level){
        pageObject.commonUtils().verifyStopTravelingPath(Integer.toString(600 - (Integer.parseInt(level) * 180)));
    }


    @Then("the user should see the multiple appearance bar for <legalEntityTitle> indicating the number of times, <countValue> ,it appears in the graph")
    public void verifyingCountForMultipleDisplayedNodes(@Named("legalEntityTitle")String legalEntityTitle, @Named("countValue")String countValue){
        pageObject.ownersGraphPage().verifyingCountForMultipleDiplayedNodes(legalEntityTitle,countValue);
    }

    @Then("the user should not see the visual indicator displayed for non-person/non-entity when appeared multiple time for <entity> in the graph")
    @Alias("the user should not see the visual indicator displayed for free text ownership when appeared multiple time for <entity> in the graph")
    public void verifyIndicatorNotDisplayed(@Named("nonEntityValue") String nonEntityValue){
        pageObject.ownersGraphPage().verifyIndicatorNotDisplayed(nonEntityValue);
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
    public void clickPartialLinkText(String linkText){
        pageObject.commonUtils().clickPartialLinkText(linkText);
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
    public void verifyingVisualIndicatorNotDisplayedForSingleLegalEntity(@Named("entityType") String entityType){
        pageObject.ownersGraphPage().verifyingVisualIndicatorNotDisplayedForSingleLegalEntity(entityType);
    }

    @Then("the user not see visual indicator for entity with same name but different fid <entityType>")
    public void verifyingVisualIndicatorNotDisplayedForEntityDiffFid(@Named("entityType") String entityType){
        pageObject.ownersGraphPage().verifyingVisualIndicatorNotDisplayedForEntityDiffFid(entityType);
    }
}
