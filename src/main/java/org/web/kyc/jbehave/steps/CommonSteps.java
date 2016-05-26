package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class CommonSteps {
    private final PageObject pageObject;

    public CommonSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Given("the user is on the ubo login page")
    public void open(){
        pageObject.commonUtils().open();
    }

    @When("the user clicks on the ownership tab")
    public void clickOnOwnershipTab(){
        pageObject.commonUtils().clickOnOwnershipTab();
    }

    @When("the user opens legal entity <fid>")
    public void openUrl(@Named("fid") String fid){
        pageObject.commonUtils().openUrl(fid);
    }

    @When("the user login as a $userType user")
    public void userLogin(@Named("userType") String userType){
        pageObject.commonUtils().userLogin(userType);
    }

    @When("the user logout")
    public void userLogout(){
        pageObject.commonUtils().userLogout();
    }

    @When("the user clicks on the graph button")
    public void clickOnGraphButton(){
        pageObject.commonUtils().clickOnGraphButton();
    }

    @Then ("the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries graphs page $countriesHighlightListExamTable")
    @Alias("the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the owners graphs page $countriesHighlightListExamTable")
    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        pageObject.commonUtils().sVerifyCountryHighlightList(countriesHighlightListExamTable);
    }

    @Then("the user verifies direct relationship checkbox is not checked on graph")
    public void verifyingDirectRelationshipCheckboxisNotClicked(){pageObject.commonUtils().verifyingDirectRelationshipCheckboxisNotClicked();}

    @Then("the user clicks on direct relationship checkbox on graph")
    public void clickOnDirectRelationshipCheckbox(){pageObject.commonUtils().clickOnDirectRelationshipCheckbox();}

    @Then("the user unchecks direct relationship checkbox on graph")
    public void unCheckDirectRelationshipCheckbox(){pageObject.commonUtils().unCheckDirectRelationshipCheckbox();}

}
