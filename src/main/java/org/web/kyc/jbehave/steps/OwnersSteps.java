package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.Pages;

public class OwnersSteps {
    private final Pages pages;

    public OwnersSteps(Pages pages) {
        this.pages = pages;
    }

    @When("the user clicks on the owners tab")
    public void clickOnOwnersTab(){
        pages.ownersPage().clickOnOwnersTab();
    }

    @Then("the user should see the list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page")
    public void dVerifyDirectOwnersList(){
        pages.ownersPage().dVerifyDirectOwnersList();
    }

    @Then("the user should see message displayed in place of list explaining there are no direct owners")
    public void verifyNoDirectOwnersMsg(){
        pages.ownersPage().verifyNoDirectOwnersMsg();
    }

    @Then("the user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page $directOwnersListExamTable")
    public void sVerifyDirectOwnersList(ExamplesTable directOwnersListExamTable){
        pages.ownersPage().sVerifyDirectOwnersList(directOwnersListExamTable);
    }

    @Then("the user should see not see the percentage meter bar in the direct owners list")
    public void verifyNoPercentageMeterBar(){
        pages.ownersPage().verifyNoPercentageMeterBar();
    }

    @Then("the user should see the percentage meter bar in the direct owners list")
    public void verifyPercentageMeterBar(){
        pages.ownersPage().verifyPercentageMeterBar();
    }

    @Then("the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the owners page")
    public void verifyPercentFilterOptions(){
        pages.common().verifyPercentFilterOptions();
    }

    @When("the user selects the percent filter option <percentFilter> in the owners page")
    public void selectPercentFilter(@Named("percentFilter") String percentFilter){
        pages.common().selectPercentFilter(percentFilter);
    }

    @Then("the user should see the direct owners ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the owners page")
    public void dVerifyDirectOwnersAndUBOListForPercentFilter(){
        pages.ownersPage().dVerifyDirectOwnersAndUBOListForPercentFilter();
    }

    @Then("the user should see the percent filter $deselectFilter de-selected in the owners page")
    public void verifyPercentFilterIsDeSelected(@Named("deselectFilter") String deselectFilter){
        pages.common().verifyPercentFilterIsDeSelected(deselectFilter);
    }

    @When("the user changes the percent filter option to $updatedFilter in the owners page")
    public void changePercentFilterOption(@Named("updatedFilter") String updatedFilter){
        pages.common().selectPercentFilter(updatedFilter);
    }
}
