package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class SubsidiariesGraphSteps {

    private final PageObject pageObject;

    public SubsidiariesGraphSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Then("the user should see the legal entity $legalEntity, user is currently viewing, as the root in the subsidiaries graph")
    public void verifySubsidiariesGraphRootNode(@Named("legalEntity") String legalEntity){
        pageObject.subsidiariesGraphPage().verifySubsidiariesGraphRootNode(legalEntity);
    }

    @Then("the user should see the list of below subsidiaries in level $level, below the root entity, in the subsidiaries graph $subsidiariesExamTable")
    public void verifySubsidiariesNodes(String level, ExamplesTable subsidiariesExamTable){
        pageObject.subsidiariesGraphPage().verifySubsidiariesNodes(level, subsidiariesExamTable);
    }
}
