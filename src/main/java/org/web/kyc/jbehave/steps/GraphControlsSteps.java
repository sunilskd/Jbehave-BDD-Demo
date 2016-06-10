package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
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
    @Alias("the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the graphs $countriesHighlightListExamTable")
    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        pageObject.graphControlsUtils().sVerifyCountryHighlightList(countriesHighlightListExamTable);
    }


    @When("the user selects a country $country from the country highlight list in the graphs")
    @Aliases(values={"the user selects another country $country from the country highlight list in the graphs",
            "the user de-selects the selected country by selecting $country from the country highlight list in the graphs"})
    public void selectCountryHighlightInGraphs(@Named("country") String country){
        pageObject.graphControlsUtils().selectCountryHighlightInGraphs(country);
    }

    @Then("the user should see the direct relationship only filter checkbox unchecked by default in the graphs")
    public void verifyingDirectRelationshipOnlyFilterIsUnchecked(){pageObject.graphControlsUtils().verifyingDirectRelationshipOnlyFilterIsUnchecked();}

    @When("the user clicks on direct relationship only filter checkbox in the graphs")
    @Alias("the user unchecks direct relationship only filter checkbox in the graphs")
    public void clickOnDirectRelationshipCheckbox(){pageObject.graphControlsUtils().clickOnDirectRelationshipCheckbox();}

    @Then("the user should see, by default, percent filter set to 0 for both input box and slider, in the graphs")
    public void verifyPercentFilterIsSetToZero() {
        pageObject.graphControlsUtils().verifyPercentFilterIsSetToZero();
    }

    @When("the user enters percentage as $percentFilter in ownership percentage filter text box in the graphs")
    public void enterPercentFilter(@Named("percentFilter") String percentFilter) {
        pageObject.graphControlsUtils().enterPercentFilter(percentFilter);
    }

    @Then("the user should not see the ultimate beneficial owners filter checkbox in the subsidiaries graph")
    public void verifyNoUBOFilters(){
        pageObject.graphControlsUtils().verifyNoUBOFilters();
    }

    @Then("the user should see the ultimate beneficial owners filter checkbox unchecked by default in the graph")
    public void verifyUBOFilterIsUncheckedByDefault(){
        pageObject.graphControlsUtils().verifyUBOFilterIsUncheckedByDefault();
    }

    @When("the user clicks on the ultimate beneficial owners filter checkbox in the graph")
    public void clickOnUBOFilterCheckbox(){
        pageObject.graphControlsUtils().clickOnUBOFilterCheckbox();
    }

    @When("the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to $slideTo in the graph")
    public void changePercentOwnershipUsingSlider(@Named("$slideTo") int slideTo){
        pageObject.graphControlsUtils().changePercentOwnershipUsingSlider(slideTo);
    }

    @Then("the user should see the ultimate beneficial owners filter checkbox disabled in the graph")
    public void verifyUBOFilterIsDisabled(){
        pageObject.graphControlsUtils().verifyUBOFilterIsDisabled();
    }


}
