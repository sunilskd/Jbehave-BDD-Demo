package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.web.kyc.jbehave.pages.PageObject;

public class ErrorScreenSteps {
    private final PageObject pageObject;

    public ErrorScreenSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the application is down due to any reason")
    public void launchErrorScreen(){
        pageObject.errorScreenPage().launchErrorScreen();
    }

    @Then("the user should see 500 error screen")
    public void verifyErrorMessageIsDisplayed(){
        pageObject.errorScreenPage().verifyErrorMessageIsDisplayed();
    }

    @Then("the user should see 404 error screen")
    public void verifyErrorScreenIsDisplayed(){
        pageObject.errorScreenPage().verifyErrorScreenIsDisplayed();
    }

}




