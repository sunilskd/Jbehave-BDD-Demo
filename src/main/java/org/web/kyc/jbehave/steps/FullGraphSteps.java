package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class FullGraphSteps {

    private final PageObject pageObject;

    public FullGraphSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user selects a country $country from the country highlight list in the full graph page")
    @Aliases(values={"the user selects another country $country from the country highlight list in the full graph page",
                        "the user de-selects the selected country by selecting $country from the country highlight list in the full graph page"})
    public void selectCountryHighlightInGraphs(@Named("country") String country){
        pageObject.commonUtils().selectCountryHighlightInGraphs(country);
    }

    @Then("the user should see the below nodes in the full graph that have the selected country of operations highlighted in the full graph page $nodesHighlightedExamTable")
    public void verifyNodesAreHighlightedForSelectedCountry(ExamplesTable nodesHighlightedExamTable){
        pageObject.commonUtils().verifyNodesAreHighlightedForSelectedCountry(nodesHighlightedExamTable);
    }

    @Then("the user should not see any nodes in level $level, above the root entity, in the full graph")
    public void verifyStopTravelingPath(String level){
        pageObject.commonUtils().verifyStopTravelingPath(Integer.toString(0 - (Integer.parseInt(level) * 180)));
    }
}
