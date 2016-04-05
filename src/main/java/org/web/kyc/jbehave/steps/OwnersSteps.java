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

    @Then("the user should see the list of direct owners for the selected institution <fid> in the owners page")
    public void dVerifyDirectOwnersList(@Named("fid") String fid){
        pages.ownersPage().dVerifyDirectOwnersList(fid);
    }

    @Then("the user should see the message no data found for the selected institution in the owners page")
    public void verifyNoDirectOwnersMsg(){
        pages.ownersPage().verifyNoDirectOwnersMsg();
    }

    @Then("the user should see the below list of direct owners for the selected institution in the owners page $directOwnersListExamTable")
    public void sVerifyDirectOwnersList(ExamplesTable directOwnersListExamTable){
        pages.ownersPage().sVerifyDirectOwnersList(directOwnersListExamTable);
    }
}
