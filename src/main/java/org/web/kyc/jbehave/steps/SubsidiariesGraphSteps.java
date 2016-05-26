package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class SubsidiariesGraphSteps {

    private final PageObject pageObject;

    public SubsidiariesGraphSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Then("the user should see the legal entity $legalEntity, user is currently viewing, as the root in the subsidiaries graph")
    public void verifySubsidiariesGraphRootNode(@Named("legalEntity") String legalEntity){
        pageObject.subsidiariesGraphPage().verifySubsidiariesGraphRootNode(legalEntity);
    }

    @Then("the user should see the list of below subsidiaries in level $level, below the root entity, in the subsidiaries graph $subsidiariesExamTable")
    public void verifyGraphNodes(String level, ExamplesTable subsidiariesExamTable){
        pageObject.commonUtils().verifyGraphNodes(Integer.toString(Integer.parseInt(level)*180), subsidiariesExamTable);
    }

    @Then("the user should see message displayed in place of graph explaining there are no subsidiaries")
    public void verifyNoSubsidiariesMsg() {
        pageObject.subsidiariesGraphPage().verifyNoSubsidiariesMsg();
    }

    @When("the user selects a country $country from the country highlight list in the subsidiaries graph page")
    @Aliases(values={"the user selects another country $country from the country highlight list in the subsidiaries graph page",
                    "the user de-selects the selected country by selecting $country from the country highlight list in the subsidiaries graph page"})
    public void selectCountryHighlightInGraphs(@Named("country") String country){
        pageObject.commonUtils().selectCountryHighlightInGraphs(country);
    }

    @Then("the user should see the below subsidiaries in the subsidiaries graph that have the selected country of operations highlighted in the subsidiaries graph page $subsidiariesHighlightedExamTable")
    public void verifyNodesAreHighlightedForSelectedCountry(ExamplesTable subsidiariesHighlightedExamTable){
        pageObject.commonUtils().verifyNodesAreHighlightedForSelectedCountry(subsidiariesHighlightedExamTable);
    }

    @Then("the user should see no country highlight selected by default in country highlight drop-down in the subsidiaries graph page")
    public void verifyNoCountryHighlightSelection(){
        pageObject.commonUtils().verifyNoCountryHighlightSelection();
    }

    @Then("the user should not see the nodes highlighted in the graph page")
    public void verifyNoHighlightedNodes(){
        pageObject.commonUtils().verifyNoHighlightedNodes();
    }
}
