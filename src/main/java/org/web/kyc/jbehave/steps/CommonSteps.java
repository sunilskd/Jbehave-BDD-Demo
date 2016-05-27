package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
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

    @Then("the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries graphs page $countriesHighlightListExamTable")
    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        pageObject.commonUtils().sVerifyCountryHighlightList(countriesHighlightListExamTable);
    }
    
    @When("the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to $slideTo in the subsidiaries graph page")
    public void changePercentOwnershipUsingSlider(@Named("$slideTo") int slideTo){
        pageObject.commonUtils().changePercentOwnershipUsingSlider(slideTo);
    }

    @When("the user enters percentage as $percentFilter in ownership percentage text box in the subsidiaries graph")
    public void enterPercentFilter(@Named("percentFilter") String percentFilter){
        pageObject.commonUtils().enterPercentFilter(percentFilter);
    }

    @Then("the user should see the pecentage filter is set to 0 by default in the subsidiaries graph page")
    public void verifyPercentFilterSettoZero() {
        pageObject.commonUtils().verifyPercentFilterSettoZero();

    }

    @Then("the user verifies direct relationship checkbox is not checked on graph")
    public void verifyingDirectRelationshipCheckboxIsNotClicked(){pageObject.commonUtils().verifyingDirectRelationshipCheckboxIsNotClicked();}

    @When("the user clicks on direct relationship checkbox on graph")
    public void clickOnDirectRelationshipCheckbox(){pageObject.commonUtils().clickOnDirectRelationshipCheckbox();}

    @When("the user unchecks direct relationship checkbox on graph")
    public void unCheckDirectRelationshipCheckbox(){pageObject.commonUtils().unCheckDirectRelationshipCheckbox();}


}
