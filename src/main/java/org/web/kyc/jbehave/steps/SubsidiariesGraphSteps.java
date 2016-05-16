package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Then;
import org.web.kyc.jbehave.pages.PageObject;

public class SubsidiariesGraphSteps {

    private final PageObject pageObject;

    public SubsidiariesGraphSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Then("the user should see the subsidiaries graph")
    public void verifySubsGraph(){
        pageObject.subsidiariesGraphPage().verifySubsGraph();
    }
}
