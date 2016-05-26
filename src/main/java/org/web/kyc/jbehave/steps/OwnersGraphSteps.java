package org.web.kyc.jbehave.steps;

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
        pageObject.commonUtils().verifyGraphNodes(Integer.toString(840 - (Integer.parseInt(level)*180)), ownersExamTable);
    }

    @When("the user clicks on the direct relationships only filter in the owners graph")
    public void clickOnDirectRelationshipOnlyFilter(){
        pageObject.commonUtils().clickOnDirectRelationshipCheckbox();
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
    public void verifyNodesAreHighlightedForSelectedCountry(ExamplesTable subsidiariesHighlightedExamTable){
        pageObject.commonUtils().verifyNodesAreHighlightedForSelectedCountry(subsidiariesHighlightedExamTable);
    }

}
