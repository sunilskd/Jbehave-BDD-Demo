package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.Pages;

public class SubsidiariesSteps {
    private final Pages pages;

    public SubsidiariesSteps(Pages pages) {
        this.pages = pages;
    }

    @When("the user clicks on the subsidiaries tab")
    public void clickOnSubsidiariesTab(){
        pages.subsidiariesPage().clickOnSubsidiariesTab();
    }

    @Then("the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page")
    public void dVerifySubsidiariesList(@Named("fid") String fid){
        pages.subsidiariesPage().dVerifySubsidiariesList(fid);
    }

    @Then("the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution <fid> in the subsidiaries page $subsidiariesListExamTable")
    public void sVerifySubsidiariesList(ExamplesTable subsidiariesListExamTable){
        pages.ownersPage().sVerifyDirectOwnersList(subsidiariesListExamTable);

    }

    @Then("the user should see message displayed in place of list explaining there are no subsidiaries")
    public void verifyNoDirectOwnersMsg(){
        pages.subsidiariesPage().verifyNoDirectOwnersMsg();
    }


}
