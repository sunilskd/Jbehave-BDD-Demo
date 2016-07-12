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
    public void launchUnexpectedServerErrorScreen(){
        pageObject.errorScreenPage().launchUnexpectedServerErrorScreen();
    }

    @Then("the user should see 500 unexpected server error page")
    public void verifyUnexpectedServerErrorPage(){
        pageObject.errorScreenPage().verifyUnexpectedServerErrorPage();
    }

    @Then("the user should see 404 page not found error page")
    public void verifyPageNotFoundPage(){
        pageObject.errorScreenPage().verifyPageNotFoundPage();
    }

    @When("user tries to log in and is not successfully authenticated on new module")
    public void launchAccessDeniedPage(){
        pageObject.errorScreenPage().launchAccessDeniedPage();
    }

    @Then("the user should see 401 access denied error page")
    public void verifyAccessDeniedPage(){
        pageObject.errorScreenPage().verifyAccessDeniedPage();
    }
}




