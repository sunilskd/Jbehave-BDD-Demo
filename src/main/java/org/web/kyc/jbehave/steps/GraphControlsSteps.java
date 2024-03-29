package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.web.kyc.jbehave.pages.PageObject;

public class GraphControlsSteps {

    private final PageObject pageObject;

    public GraphControlsSteps(WebDriverProvider webDriverProvider) {
        pageObject = new PageObject(webDriverProvider);
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
    @Alias("the user should see, percent filter is reset to 0 for both input box and slider, in the graphs")
    public void verifyPercentFilterIsSetToZero() {
        pageObject.graphControlsUtils().verifyPercentFilterIsSetToZero();
    }

    @Then("the user should see, percent filter is reset to 100 for both input box and slider, in the graphs")
    public void verifyPercentFilterIsSetToHundred() {
        pageObject.graphControlsUtils().verifyPercentFilterIsSetToHundred();
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
    @Alias("the user should see the ultimate beneficial owners filter checkbox unchecked in the graph")
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

    @Then("the user should see the ultimate beneficial owners filter checkbox and the label disabled/grayed in the graph")
    public void verifyUBOFilterIsDisabled(){
        pageObject.graphControlsUtils().verifyUBOFilterIsDisabled();
    }

    @Then("the user should see the option to zoom graph in/out on the graphs")
    public void verifyZoomOption(){
        pageObject.graphControlsUtils().verifyZoomOption();
    }

    @When("the user hovers cursor over i icon next to zoom slider on the graphs")
    public void hoverCursorOverIconForZoom(){
        pageObject.graphControlsUtils().hoverCursorOverIconForZoom();
    }

    @When("the user hovers cursor over i icon next to percent filter on the graphs")
    public void hoverCursorOverIconForPercentFilter(){
        pageObject.graphControlsUtils().hoverCursorOverIconForPercentFilter();
    }

    @When("the user hovers cursor over i icon next to country highlight on the graphs")
    public void hoverCursorOverIconForCountryHighlight(){
        pageObject.graphControlsUtils().hoverCursorOverIconForCountryHighlight();
    }

    @Then("user should see the info 'Use your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move graphs' on the graphs")
    public void verifyZoomInfo(){
        pageObject.graphControlsUtils().verifyZoomInfo();
    }

    @Then("user should see the info 'Display ownership greater than or equal to the value shown. User slider or input to change the percentage.' on the graphs")
    public void verifyPercentFilterInfo(){
        pageObject.graphControlsUtils().verifyPercentFilterInfo();
    }

    @Then("user should see the info 'Use these tools to highlight tiles within the graph. Counts (Total) reflect applied filters. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information.' on the graphs")
    public void verifyCountryHighlightInfo(){
        pageObject.graphControlsUtils().verifyCountryHighlightInfo();
    }

    @When("the user clicks on the minus sign next to zoom slider on the graphs")
    public void clickOnMinusSign(){
        pageObject.graphControlsUtils().clickOnMinusSign();
    }

    @When("the user clicks on the plus sign next to zoom slider on the graphs")
    public void clickOnPlusSign(){
        pageObject.graphControlsUtils().clickOnPlusSign();
    }

    @When("the user clicks on the reset button next to zoom slider on the graphs")
    public void clickOnResetButton(){
        pageObject.graphControlsUtils().clickOnResetButton();
    }

    @Then("the user should see UBO count as $UBOCount displayed next to UBO checkbox label")
    public void verifyUBOCount(@Named("UBOCount") String UBOCount){
        pageObject.graphControlsUtils().verifyUBOCount(UBOCount);
    }

    @Then("the user should not see UBO count displayed next to UBO checkbox label")
    public void verifyNoUBOCount(){
        pageObject.graphControlsUtils().verifyNoUBOCount();
    }

}
