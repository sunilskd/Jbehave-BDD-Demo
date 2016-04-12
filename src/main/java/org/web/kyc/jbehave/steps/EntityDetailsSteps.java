package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.Pages;

public class EntityDetailsSteps {
    private Pages pages;

    public EntityDetailsSteps(Pages pages) {
        this.pages = pages;
    }

    @When("the user clicks on the entity details tab")
    public void clickOnEntityDetailsTab(){
        pages.entityDetailsPage().clickOnEntityDetailsTab(pages.common().selectedFid);
    }

    @Then("the user should see the identifiers with giin, lei and fatca status for the selected institution in the entity details page")
    public void dVerifyIdentifiers(){
        pages.entityDetailsPage().dVerifyIdentifiers();

    }

    @Then("the user should see multiple leis associated to the entity")
    public void dVerifyMultipleLeis(){
        pages.entityDetailsPage().dVerifyMultipleLeis();

    }

    @Then("the user should see below head office address, giin and facta status for the selected institution in the entity details page $entityDetailsExamTable")
    public void sVerifyEntityDetails(ExamplesTable entityDetailsExamTable) {
        pages.entityDetailsPage().sVerifyEntityDetails(entityDetailsExamTable);

    }

    @Then("the user should not see head office address")
    public void verifyNoHeadOfficeAddress() {
        pages.entityDetailsPage().verifyNoHeadOfficeAddress();
    }

    @Then("the user should see only identifier lables and not values for identifiers")
    public void verifyIdentifierLables(){
    pages.entityDetailsPage().verifyIdentifierLables();
    }

    @Then("the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page")
    public void dVerifyEntityDetailsSummary(){
        pages.entityDetailsPage().dVerifyEntityDetailsSummary();
    }
}