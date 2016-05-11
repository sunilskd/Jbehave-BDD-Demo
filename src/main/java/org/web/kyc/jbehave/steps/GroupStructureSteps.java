package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

/**
 * Created by sahug on 5/11/2016.
 */
public class GroupStructureSteps {

    private final PageObject pageObject;

    public GroupStructureSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the group structure tab")
    public void clickOnGroupStructureTab() {
        pageObject.groupStructurePage().clickOnGroupStructureTab();
    }

    @Then("the user should see the majority owner for the institution $institutionName in the group structure page $majorityOwnersExamTable")
    public void sVerifyMajorityOwners(@Named("institutionName") String institutionName, ExamplesTable majorityOwnersExamTable) {
        pageObject.groupStructurePage().sVerifyMajorityOwners(institutionName, majorityOwnersExamTable);
    }

    @Then("the user should see the indented list of subsidiaries for the institution $institutionName that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page $subsidiariesExamTable")
    public void sVerifySubsidiaries(@Named("institutionName") String institutionName, ExamplesTable subsidiariesExamTable){
        pageObject.groupStructurePage().sVerifySubsidiaries(institutionName, subsidiariesExamTable);
    }

    @When("the user clicks on the legal entity $legalEntity in group structure page")
    public void clickOnLegalEntityInGroupStructure(@Named("legalEntity") String legalEntity){
        pageObject.groupStructurePage().clickOnLegalEntityInGroupStructure(legalEntity);
    }

    @Then("the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list")
    public void verifyCountryHighlightListInGroupStructure(){
        pageObject.groupStructurePage().verifyCountryHighlightListInGroupStructure();
    }
}
