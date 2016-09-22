package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.web.selenium.WebDriverProvider;
import org.web.kyc.jbehave.pages.PageObject;

public class AuditSteps {

    private final PageObject pageObject;

    public AuditSteps(WebDriverProvider webDriverProvider) {
        pageObject = new PageObject(webDriverProvider);
    }

    @When("the user clicks on display audit information link in owners page")
    public void clickOnDisplayAuditInformationLink(){
        pageObject.auditPage().clickOnDisplayAuditInformationLink();
    }

    @Then("the user should see audit information with legal title of legal entity user is viewing, sorted by action by date listing the most recent at the top in owners page")
    public void dVerifyAuditInformation(){
        pageObject.auditPage().dVerifyAuditInformation();
    }

    @Then("the user should see a message thats says no audit information is available")
    public void verifyNoAuditInformationAvailableMsg(){
        pageObject.auditPage().verifyNoAuditInformationAvailableMsg();
    }

    @When("the user clicks on hide audit information link in owners page")
    public void clickOnHideAuditInformationLink(){
        pageObject.auditPage().clickOnHideAuditInformationLink();
    }

    @Then("the audit section should collapse and Owners list should be moved to top section")
    public void dVerifyAuditSectionCollapse(){
        pageObject.auditPage().dVerifyAuditSectionCollapse();
    }
}
