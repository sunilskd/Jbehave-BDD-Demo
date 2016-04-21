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

    @Then("the user should see the identifiers with giin, lei and fatca status for the selected institution in the entity details page")
    public void dVerifyIdentifiers(){
        pages.entityDetailsPage().dVerifyIdentifiers();
    }

    @Then("the user should see the headers with institution legal title and bankers almanac id in entity details page")
    public void dVerifyEntityDetailsHeader(){
        pages.entityDetailsPage().dVerifyEntityDetailsHeader();
    }

    @Then("the user should see the headers with institution legal title <legalTitle> and bankers almanac id <bankersAlmanacId> in entity details page")
    public void sVerifyEntityDetailsHeader(@Named("legalTitle") String legalTitle,@Named("bankersAlmanacId") String bankersAlmanacId){
        pages.entityDetailsPage().sVerifyEntityDetailsHeader(legalTitle,bankersAlmanacId);
    }

    @Then("the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page")
    public void dVerifyEntityDetailsSummary(){
        pages.entityDetailsPage().dVerifyEntityDetailsSummary();
    }

    @Then("the user should see the summary with head office address <headOfficeAddress> respecting the useInAddress flag for the selected institution in the entity details page")
    public void sVerifyHeadOfficeAddress(@Named("headOfficeAddress") String headOfficeAddress){
        pages.entityDetailsPage().sVerifyHeadOfficeAddress(headOfficeAddress);
    }

    @Then("the user should see the identifiers with giin <giin> and fatca status <fatcaStatus> for the selected institution in the entity details page")
    public void sVerifyGiinAndFatcaStatus(@Named("giin") String giin,@Named("fatcaStatus") String fatcaStatus)
    {
        pages.entityDetailsPage().sVerifyGiinAndFatcaStatus(giin,fatcaStatus);

    }

    @Then("the user should see the identifiers with below leis in the entity details page $leis")
    public void sVerifyLeis(ExamplesTable leisExamTable){
        pages.entityDetailsPage().sVerifyLeis(leisExamTable);
    }

}