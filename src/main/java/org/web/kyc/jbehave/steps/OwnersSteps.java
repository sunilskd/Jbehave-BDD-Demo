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
    @Alias("the ubo user should see the list of direct owners (person or institution or non entity) ordered by percentage ownership then asc by owners name for the selected institution in the owners page")
    public void dVerifyDirectOwnersList(){
        pageObject.ownersPage().dVerifyDirectOwnersList();
    }

    @Then("the kyc user should see message displayed in place of list explaining there are no direct owners")
    @Alias("the ubo user should see message displayed in place of list explaining there are no direct owners")
    public void verifyNoDirectOwnersMsg(){
        pageObject.ownersPage().verifyNoDirectOwnersMsg();
    }

    @Then("the kyc user should see the below list of direct owners ordered by percentage ownership then asc by legal title for the selected institution in the owners page $directOwnersListExamTable")
    @Alias("the ubo user should see the below list of direct owners (person or institution or non entity) ordered by percentage ownership then asc by legal title for the selected institution in the owners page $directOwnersListExamTable")
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
        pageObject.common().verifyPercentFilterOptions();
    }

    @When("the user selects the percent filter option <percentFilter> in the owners page")
    public void selectPercentFilter(@Named("percentFilter") String percentFilter){
        pageObject.common().selectPercentFilter(percentFilter);
    }

    @Then("the kyc user should see the direct owners ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the owners page")
    @Alias("the ubo user should see the direct owners ordered by percentage ownership then asc by direct owners name (legal title or people as owners), filtered by selected percent filter, for the selected institution in the owners page")
    public void dVerifyDirectOwnersAndUBOListForPercentFilter(){
        pageObject.ownersPage().dVerifyDirectOwnersAndUBOListForPercentFilter();
    }

    @Then("the kyc user should see the percent filter $deselectFilter de-selected in the owners page")
    @Alias("the ubo user should see the percent filter $deselectFilter de-selected in the owners page")
    public void verifyPercentFilterIsDeSelected(@Named("deselectFilter") String deselectFilter){
        pageObject.common().verifyPercentFilterIsDeSelected(deselectFilter);
    }

    @When("the user changes the percent filter option to $updatedFilter in the owners page")
    public void changePercentFilterOption(@Named("updatedFilter") String updatedFilter){
        pageObject.common().selectPercentFilter(updatedFilter);
    }
}
