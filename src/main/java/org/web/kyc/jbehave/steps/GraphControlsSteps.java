package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Aliases;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class GraphControlsSteps {

    private final PageObject pageObject;

    public GraphControlsSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Then("the user should see no country highlight selected by default in country highlight drop-down in the graphs")
    public void verifyNoCountryHighlightSelection(){
        pageObject.graphControlsUtils().verifyNoCountryHighlightSelection();
    }

    @Then ("the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the graphs $countriesHighlightListExamTable")
    @Aliases(values= {"the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs $countriesHighlightListExamTable",
            "the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs $countriesHighlightListExamTable"})
    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        pageObject.graphControlsUtils().sVerifyCountryHighlightList(countriesHighlightListExamTable);
    }



}
