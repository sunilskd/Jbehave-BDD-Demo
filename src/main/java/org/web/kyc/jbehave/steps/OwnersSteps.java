package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class OwnersSteps {
    private final PageObject pageObject;

    public OwnersSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the owners tab")
    public void clickOnOwnersTab(){
        pageObject.ownersPage().clickOnOwnersTab();
    }

    @Then("the kyc user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page")
    @Alias("the ubo user should see the list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by owners name for the selected institution in the owners page")
    public void dVerifyDirectOwnersList(){
        pageObject.ownersPage().dVerifyDirectOwnersList();
    }

    @Then("the user should see message displayed in place of list explaining there are no direct owners")
    public void verifyNoDirectOwnersMsg(){
        pageObject.ownersPage().verifyNoDirectOwnersMsg();
    }

    @Then("the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page $directOwnersListExamTable")
    @Alias("the ubo user should see the below list of direct owners (person or institution or other entity type) ordered by percentage ownership then asc by legal title for the selected institution in the owners page $directOwnersListExamTable")
    public void sVerifyDirectOwnersList(ExamplesTable directOwnersListExamTable){
        pageObject.ownersPage().sVerifyDirectOwnersList(directOwnersListExamTable);
    }

    @Then("the user should not see the percentage meter bar in the direct owners list")
    public void verifyNoPercentageMeterBar(){
        pageObject.ownersPage().verifyNoPercentageMeterBar();
    }

    @Then("the user should see the percentage meter bar in the direct owners list")
    public void verifyPercentageMeterBar(){
        pageObject.ownersPage().verifyPercentageMeterBar();
    }

    @Then("the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page")
    public void verifyPercentFilterOptions(){
        pageObject.commonUtils().verifyPercentFilterOptions();
    }

    @When("the user selects the percent filter option <percentFilter> in the owners page")
    public void selectPercentFilter(@Named("percentFilter") String percentFilter){
        pageObject.commonUtils().selectPercentFilter(percentFilter);
    }

    @Then("the kyc user should see the direct owners ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the owners page")
    @Alias("the ubo user should see the direct owners ordered by percentage ownership then asc by direct owners name (legal title or people as owners), filtered by selected percent filter, for the selected institution in the owners page")
    public void dVerifyDirectOwnersListForSelectedPercentFilter(){
        pageObject.ownersPage().dVerifyDirectOwnersListForSelectedPercentFilter();
    }

    @Then("the user should see the percent filter $deselectFilter de-selected in the owners page")
    public void verifyPercentFilterIsDeSelected(@Named("deselectFilter") String deselectFilter){
        pageObject.commonUtils().verifyPercentFilterIsDeSelected(deselectFilter);
    }

    @Then("the previously selected country <country> should be de-selected in the owners page")
    public void verifyCountryHighlightIsDeSelected(@Named("country") String deselectCountry){
        pageObject.commonUtils().verifyCountryHighlightIsDeSelected(deselectCountry);
    }

    @When("the user changes the percent filter option to $updatedFilter in the owners page")
    public void changePercentFilterOption(@Named("updatedFilter") String updatedFilter){
        pageObject.commonUtils().selectPercentFilter(updatedFilter);
    }

    @Then("the user should see the list of unique country of operations for each direct owners to highlight, sorted alphabetically, in the owners page")
    public void dVerifyCountryHighlightList(){
        pageObject.ownersPage().dVerifyCountryHighlightList();
    }

    @Then("the user should not see any country in country highlights list in the owners page")
    public void verifyCountryHighlightListNotExists(){
        pageObject.ownersPage().verifyCountryHighlightListNotExists();
    }

    @Then("the user should see the direct owners in the owners list that have the selected country of operations highlighted in the owners page")
    public void verifyDirectOwnersAreHighlighted(){
        pageObject.ownersPage().verifyDirectOwnersAreHighlighted();
    }

    @Then("the user should not see the direct owners in the owners list that have the selected country of operations highlighted in the owners page")
    public void verifyDirectOwnersAreNotHighlighted(){
        pageObject.ownersPage().verifyDirectOwnersAreNotHighlighted();
    }

    @When("the user selects a country <country> from the country highlight list in the owners page")
    @Alias("the user de-select previously selected country <country> by clicking on it a second time from the country highlight in the owners page")
    public void selectCountryHighlight(@Named("country") String country){
        pageObject.commonUtils().selectCountryHighlight(country);
    }

    @When("the user selects another country <changeCountry> from the country highlight list in the owners page")
    public void changeCountryHighlight(@Named("changeCountry") String changeCountry) {
        pageObject.commonUtils().selectCountryHighlight(changeCountry);
    }

    @When("the user clicks on the legal title $legalTitle in direct owners list in the owners page")
    public void clickOnLegalTitleInDirectOwnersList(@Named("legalTitle") String legalTitle){
        pageObject.ownersPage().clickOnLegalTitleInDirectOwnersList(legalTitle);
    }

    @When("the user clicks and opens the legal title $legalTitle in direct owners list in new window in the owners page")
    public void openLegalTitleInDirectOwnersListInNewWindow(@Named("$legalTitle") String legalTitle){
        pageObject.ownersPage().openLegalTitleInDirectOwnersListInNewWindow(legalTitle);
    }

    @Then("the user should see the direct owners summary selected by default in the owners page")
    public void verifySummaryIsSelectedByDefault(){
        pageObject.commonUtils().verifySummaryIsSelectedByDefault();
    }

    @Then("the kyc user should see the free text at the bottom of the direct owner list for the selected institution in the owners page")
    public void dVerifyFreeTextInDirectOwnersList(){
        pageObject.ownersPage().dVerifyFreeTextInDirectOwnersList();
    }

    @Then("the kyc user should see the free text <directOwnerFreeText> at the bottom of the direct owner list for the selected institution in the owners page")
    public void sVerifyFreeTextInDirectOwnersList(@Named("directOwnerFreeText") String directOwnerFreeText){
        pageObject.ownersPage().sVerifyFreeTextInDirectOwnersList(directOwnerFreeText);
    }

    @Then("the kyc user should not see the free text at the bottom of the direct owner list for the selected institution in the owners page")
    @Alias("the ubo user should not see the free text at the bottom of the direct owner list for the selected institution in the owners page")
    public void sVerifyNoFreeTextInDirectOwnersList(){
        pageObject.ownersPage().sVerifyNoFreeTextInDirectOwnersList();
    }

    @When("the user captures the expected snapshot for the owners page")
    public void eCaptureOwnersPage(){
        pageObject.ownersPage().eCaptureOwnersPage();
    }

    @When("the user captures the actual snapshot for the owners page")
    public void aCaptureOwnersPage(){
        pageObject.ownersPage().aCaptureOwnersPage();
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for owners page")
    public void compareSnapshotsForOwners(){
        pageObject.ownersPage().compareSnapshotsForOwners();
    }

    @Then("the ubo user should see the below list of UBOs (person or persons)ordered by percentage ownership then alphabetically by personSortKey for the selected institution in the owners page $UBOListExamTable")
    public void sVerifyUBOList(ExamplesTable uboListExamTable){
        pageObject.ownersPage().sVerifyUBOList(uboListExamTable);
    }

    @Then("the ubo user should see message displayed in place of list explaining there are no UBOs")
    @Alias("the kyc user should see message displayed as no known entities for KYC user")
    public void verifyNoUBOMsg(){
        pageObject.ownersPage().verifyNoUBOMsg();
    }

}
