package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.Pages;

public class EntityDetailsSteps {
    private final Pages pages;

    public EntityDetailsSteps(Pages pages) {
        this.pages = pages;
    }

    @When("the user clicks on the entity details tab")
    public void clickOnEntityDetailsTab(){
        pages.entityDetailsPage().clickOnEntityDetailsTab();

    }

    @Then("the user should see head office address with address line1 line2 line3 line 4 city subarea country zip <fid> And user should see giin value")
    public void dVerifyHeadOfficeAddress(@Named("fid") String fid){
        pages.entityDetailsPage().dVerifyHeadOfficeAddress(fid);
    }

    @Then("the user should see lei and Factcs status")
    public void dVerifyLeiAndFactaStatus(@Named("fid") String fid){
        pages.entityDetailsPage().dVerifyLeiAndFactaStatus(fid);

    }

    @Then("the user should see multiple leis associated to the entity")
    public void dVerifyMultipleLeis(@Named("fid") String fid){
        pages.entityDetailsPage().dVerifyMultipleLeis(fid);

    }

    @Then("the user should see below head office address giin facta status $entityDetailsExamTable")
    public void sVerifyHeadOfficeAddress(ExamplesTable entityDetailsExamTable) {
        pages.entityDetailsPage().sVerifyHeadOfficeAddress(entityDetailsExamTable);

    }

    @When("the user clicks on the entity details tab and there is no address associated to the entity or UseInAddress is false")
    public void clickOnEntityDetailsTab1(){
        pages.entityDetailsPage().clickOnEntityDetailsTab();
    }

    @Then("the user should not see head office address")
    public void verifyNoHeadOfficeAddress() {
        pages.entityDetailsPage().verifyNoHeadOfficeAddress();
    }

    @Then("the user should not see only identifier lables and not values")
    public void verifyIdentifierLables(){
    pages.entityDetailsPage().verifyIdentifierLables();
    }

}