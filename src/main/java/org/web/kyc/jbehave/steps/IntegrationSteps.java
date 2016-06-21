package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.When;
import org.jbehave.core.annotations.Then;
import org.web.kyc.jbehave.pages.PageObject;

public class IntegrationSteps {

    private final PageObject pageObject;

    public IntegrationSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Given("the user is on bankers almanac page")
    public void launchBankersAlmanac(){
        pageObject.integrationPage().launchBankersAlmanac();
    }

    @When("the user login as a $userType user to bankers almanac page")
    public void userLogin(@Named("userType") String userType){
        pageObject.integrationPage().userLogin(userType);
    }

    @When("the user clicks on view on bankers almanac")
    public void clickViewOnBankersAlmanac(){
        pageObject.integrationPage().clickViewOnBankersAlmanac();
    }

    @Then("the user should be navigated to the full details of that entity on bankersalmanac page")
    public void verifyBankersAlamanacPage(){
        pageObject.integrationPage().verifyBankersAlamanacPage();
    }

}
