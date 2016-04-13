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
    public void clickOnSubsidiariesTab() {
        pages.subsidiariesPage().clickOnSubsidiariesTab();
    }

    @Then("the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page")
    public void dVerifySubsidiariesList() {
        pages.subsidiariesPage().dVerifySubsidiariesList();
    }

    @Then("the user should see the below list of direct subsidiaries ordered by percentage ownership then asc by legal title for the selected institution in the subsidiaries page $subsidiariesListExamTable")
    public void sVerifySubsidiariesList(ExamplesTable subsidiariesListExamTable) {
        pages.subsidiariesPage().sVerifySubsidiariesList(subsidiariesListExamTable);

    }

    @Then("the user should see message displayed in place of list explaining there are no subsidiaries")
    public void verifyNoSubsidiariesMsg() {
        pages.subsidiariesPage().verifyNoSubsidiariesMsg();
    }

    @Then("the user should see the legal title <institutionLegalTitle> of the institution it is looking at in the subsidiaries page")
    public void verifyInstitutionLegalTitle(@Named("institutionLegalTitle") String institutionLegalTitle) {
        pages.subsidiariesPage().verifyInstitutionLegalTitle(institutionLegalTitle);
    }

    @Then("the user should see the optional percent filters all, 10, 25 and 50 and above for direct owners and ubo with all selected by default in the subsidiaries page")
    public void verifyPercentFilterOptions(){
        pages.common().verifyPercentFilterOptions();
    }

    @When("the user selects the percent filter option <percentFilter> in the subsidiaries page")
    public void selectPercentFilter(@Named("percentFilter") String percentFilter){
        pages.common().selectPercentFilter(percentFilter);
    }

    @Then("the user should see the list of direct subsidiaries ordered by percentage ownership then asc by legal title, filtered by selected percent filter, for the selected institution in the subsidiaries page")
    public void dVerifySubsidiariesListForPercentFilter(){
        pages.subsidiariesPage().dVerifySubsidiariesListForPercentFilter();
    }

    @Then("the user should see the percent filter $deselectFilter de-selected in the subsidiaries page")
    public void verifyPercentFilterIsDeSelected(@Named("deselectFilter") String deselectFilter){
        pages.common().verifyPercentFilterIsDeSelected(deselectFilter);
    }
}
