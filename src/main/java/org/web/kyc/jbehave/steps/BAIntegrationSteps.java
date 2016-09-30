package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.When;
import org.jbehave.core.annotations.Then;
import org.jbehave.web.selenium.WebDriverProvider;
import org.web.kyc.jbehave.pages.PageObject;

public class BAIntegrationSteps {

    private final PageObject pageObject;

    public BAIntegrationSteps(WebDriverProvider webDriverProvider) {
        pageObject = new PageObject(webDriverProvider);
    }

    @Given("the user is on bankers almanac page")
    public void launchBankersAlmanac(){
        pageObject.baIntegrationPage().launchBankersAlmanac();
    }

    @When("the user login as a $userType user to bankers almanac page")
    public void userLogin(@Named("userType") String userType){
        pageObject.baIntegrationPage().userLogin(userType);
    }

    @When("the user clicks on view on bankers almanac")
    public void clickViewOnBankersAlmanac(){
        pageObject.baIntegrationPage().clickViewOnBankersAlmanac();
    }

    @Then("the user should be navigated to the full details of that entity <fid> on bankersalmanac page")
    public void verifyBankersAlamanacPage(@Named("fid") String fid){
        pageObject.baIntegrationPage().verifyBankersAlmanacPage(fid);
    }

    @When("the user clicks on UBO Declaration Document")
    public void clickUboDeclarationDocument(){
        pageObject.baIntegrationPage().clickUboDeclarationDocument();
    }

    @Then("the user should be navigated to the ubo section of that entity <fid> on bankersalmanac page")
    public void verifyBankersAlamanacUboSection(@Named("fid") String fid){
        pageObject.baIntegrationPage().verifyBankersAlamanacUboSection(fid);
    }

    @When("the user logout from banker almanac page")
    public void userLogsOutOfBankersAlmanac(){
        pageObject.baIntegrationPage().userLogsOutOfBankersAlmanac();
    }

}
