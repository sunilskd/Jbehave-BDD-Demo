package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class SubsidiariesSteps {
    private final PageObject pageObject;

    public SubsidiariesSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the subsidiaries tab")
    public void clickOnSubsidiariesTab() {
        pageObject.subsidiariesPage().clickOnSubsidiariesTab();
    }

    @Then("the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page")
    public void dVerifySubsidiariesList() {
        pageObject.subsidiariesPage().dVerifySubsidiariesList();
    }

    @Then("the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page $subsidiariesListExamTable")
    public void sVerifySubsidiariesList(ExamplesTable subsidiariesListExamTable) {
        pageObject.subsidiariesPage().sVerifySubsidiariesList(subsidiariesListExamTable);

    }

    @Then("the user should see message displayed in place of list explaining there are no subsidiaries")
    public void verifyNoSubsidiariesMsg() {
        pageObject.subsidiariesPage().verifyNoSubsidiariesMsg();
    }

    @Then("the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the subsidiaries page")
    public void verifyPercentFilterOptions(){
        pageObject.commonUtils().verifyPercentFilterOptions();
    }

    @When("the user selects the percent filter option <percentFilter> in the subsidiaries page")
    public void selectPercentFilter(@Named("percentFilter") String percentFilter){
        pageObject.commonUtils().selectPercentFilter(percentFilter);
    }

    @Then("the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the subsidiaries page")
    public void dVerifySubsidiariesListForPercentFilter(){
        pageObject.subsidiariesPage().dVerifySubsidiariesListForPercentFilter();
    }

    @Then("the user should see the percent filter $deselectFilter de-selected in the subsidiaries page")
    public void verifyPercentFilterIsDeSelected(@Named("deselectFilter") String deselectFilter){
        pageObject.commonUtils().verifyPercentFilterIsDeSelected(deselectFilter);
    }

    @When("the user changes the percent filter option to $updatedFilter in the subsidiaries page")
    public void changePercentFilterOption(@Named("updatedFilter") String updatedFilter){
        pageObject.commonUtils().selectPercentFilter(updatedFilter);
    }

    @When("the user selects a country <country> from the country highlight list in the subsidiaries page")
    @Alias("the user de-select previously selected country <country> by clicking on it a second time from the country highlight in the subsidiaries page")
    public void selectCountryHighlight(@Named("country") String country){
        pageObject.commonUtils().selectCountryHighlight(country);
    }

    @When("the user selects another country <changeCountry> from the country highlight list in the subsidiaries page")
    public void changeCountryHighlight(@Named("changeCountry") String changeCountry){
        pageObject.commonUtils().selectCountryHighlight(changeCountry);
    }

    @Then("the user should see the direct subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page")
    public void verifyDirectSubsidiariesAreHighlighted(){
        pageObject.subsidiariesPage().verifyDirectSubsidiariesAreHighlighted();
    }

    @Then("the user should see the list of unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries page")
    public void dVerifyCountryHighlightList() {
        pageObject.subsidiariesPage().dVerifyCountryHighlightList();
    }

    @Then("the user should not see the subsidiaries in the subsidiaries list that have the selected country of operations highlighted in the subsidiaries page")
    public void verifyDirectOwnersAreNotHighlighted(){
        pageObject.subsidiariesPage().verifyDirectSubsidiariesAreNotHighlighted();
    }

    @Then("the user should not see any country in country highlights list in the subsidiaries page")
    public void verifyCountryHighlightListNotExists(){
        pageObject.subsidiariesPage().verifyCountryHighlightListNotExists();
    }

    @When("the user clicks and opens the legal title $legalTitle in subsidiaries list in new window in the subsidiaries page")
    public void openLegalTitleInSubsidiariesListInNewWindow(@Named("$legalTitle") String legalTitle){
        pageObject.subsidiariesPage().openLegalTitleInSubsidiariesListInNewWindow(legalTitle);
    }

    @When("the user clicks on the legal title $legalTitle in subsidiaries list in the subsidiaries page")
    public void clickOnLegalTitleInSubsidiariesList(@Named("legalTitle") String legalTitle){
        pageObject.subsidiariesPage().clickOnLegalTitleInSubsidiariesList(legalTitle);
    }

    @Then("the user should see the subsidiaries summary selected by default in the subsidiaries page")
    public void verifySummaryIsSelectedByDefault(){
        pageObject.commonUtils().verifySummaryIsSelectedByDefault();
    }

    @When("the user captures the expected snapshot for the subsidiaries page")
    public void eCaptureSubsidiariesPage(){
        pageObject.subsidiariesPage().eCaptureSubsidiariesPage();
    }

    @When("the user captures the actual snapshot for the subsidiaries page")
    public void aCaptureSubsidiariesPage(){
        pageObject.subsidiariesPage().aCaptureSubsidiariesPage();
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for subsidiaries page")
    public void compareSnapshotsForSubsidiaries(){
        pageObject.subsidiariesPage().compareSnapshotsForSubsidiaries();
    }

    @Then("the previously selected country <country> should be de-selected in the subsidiaries page")
    public void verifyCountryHighlightIsDeSelected(@Named("country") String deselectCountry){
        pageObject.commonUtils().verifyCountryHighlightIsDeSelected(deselectCountry);
    }

    @Then("the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the subsidiaries page")
    public void verifySavedSubsidiariesPDFFile(){
        pageObject.subsidiariesPage().verifySavedSubsidiariesPDFFile();
    }

    @Then("the user captures the expected snapshot for the subsidiaries page <imageName>")
    public void eCaptureSubsidiariesPageTruncatedGraph(@Named("imageName")String imageName){
        pageObject.subsidiariesPage().eCaptureSubsidiariesPageTruncatedGraph(imageName);
    }
}

