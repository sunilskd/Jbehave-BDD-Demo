package org.web.kyc.jbehave.steps;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.web.kyc.jbehave.pages.Pages;

public class SampleSteps {

    private final Pages pages;

    public SampleSteps(Pages pages) {
        this.pages = pages;
    }

    @Given("a user is on the search page")
    public void open(){
        pages.samplePage().open();
    }

    @Then("the user should see username field")
    public void verifyUsername() {
        pages.samplePage().verifyUsername();
    }
}
