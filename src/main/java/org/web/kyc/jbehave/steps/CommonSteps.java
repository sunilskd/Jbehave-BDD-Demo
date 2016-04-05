package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.When;
import org.web.kyc.jbehave.pages.Pages;

public class CommonSteps {
    private final Pages pages;

    public CommonSteps(Pages pages) {
        this.pages = pages;
    }

    @Given("the kyc user is on the ubo home page")
    public void open(){
        pages.common().open();
    }

    @When("the user clicks on the ownership tab")
    public void clickOnOwnershipTab(){
        pages.common().clickOnOwnershipTab();
    }

    @When("the user opens legal entity <fid>")
    public void openUrl(@Named("fid") String fid){
        pages.common().openUrl(fid);
    }
}
