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
    @Aliases(values= {"the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the owners graphs page $countriesHighlightListExamTable",
            "the user should see the list of below unique country of operations for each owners to highlight, sorted alphabetically, in the full graphs page $countriesHighlightListExamTable"})
    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        pageObject.commonUtils().sVerifyCountryHighlightList(countriesHighlightListExamTable);
    }
    
    @When("the user uses the slider to changes the percent ownership in increments of whole numbers, ranging from 0 to 100, to $slideTo in the graph")
    public void changePercentOwnershipUsingSlider(@Named("$slideTo") int slideTo){
        pageObject.commonUtils().changePercentOwnershipUsingSlider(slideTo);
    }

    @When("the user enters percentage as $percentFilter in ownership percentage filter text box in the graph")
    public void enterPercentFilter(@Named("percentFilter") String percentFilter){
        pageObject.commonUtils().enterPercentFilter(percentFilter);
    }

    @Then("the user should see, by default, percent filter set to 0 for both input box and slider, in the graph")
    public void verifyPercentFilterIsSetToZero() {
        pageObject.commonUtils().verifyPercentFilterIsSetToZero();
    }

    @Then("the user should see the direct relationship only filter checkbox unchecked by default in the graph")
    public void verifyingDirectRelationshipOnlyFilterIsUnchecked(){pageObject.commonUtils().verifyingDirectRelationshipOnlyFilterIsUnchecked();}

    @When("the user clicks on direct relationship only filter checkbox in the graph")
    public void clickOnDirectRelationshipCheckbox(){pageObject.commonUtils().clickOnDirectRelationshipCheckbox();}

    @When("the user unchecks direct relationship only filter checkbox in the  graph")
    public void unCheckDirectRelationshipCheckbox(){pageObject.commonUtils().unCheckDirectRelationshipCheckbox();}

    @Then("the user should see the copyright notice: © Reed Business Information Limited (year)")
    public void verifyFooterInformation(){pageObject.commonUtils().verifyFooterInformation();
    }

    @When("the user clicks on $footerLink link in footer section")
    public void verifyFooterLinks(@Named("$footerLink") String footerLink){pageObject.commonUtils().verifyFooterLinks(footerLink);
    }

    @When("the user clicks on the logo $logo in footers section")
    public void verifyFooterLogos(@Named("$logo") String logo){pageObject.commonUtils().verifyFooterLogos(logo);
    }

    @Then("user is taken to a URL $url that opens in a new window")
    public void verifyURLOpensInNewWindow(@Named("$url") String url){pageObject.commonUtils().verifyURLOpensInNewWindow(url);}

    @Then("the user should see the legal title displayed in the nodes when the user hovers over it in the graphs $legalTitleExamTable")
    public void verifyHoverOverToolTipInNodes(ExamplesTable legalTitleExamTable){
        pageObject.commonUtils().verifyHoverOverToolTipInNodes(legalTitleExamTable);
    }

    @Then("the user verifies no other country names are listed in dropdown")
    public void verifyCountryHighlightDropDownSize(){
        pageObject.commonUtils().verifyCountryHighlightDropDownSize();
    }

    @Then("the user should not see the nodes highlighted in the graph page")
    public void verifyNoHighlightedNodes() {
        pageObject.commonUtils().verifyNoHighlightedNodes();
    }

    @Then("the user should see the ultimate beneficial owners filter checkbox unchecked by default in the graph")
    public void verifyUBOFilterIsUncheckedByDefault(){
        pageObject.commonUtils().verifyUBOFilterIsUncheckedByDefault();
    }

    @When("the user clicks on the ultimate beneficial owners filter checkbox in the graph")
    public void clickOnUBOFilterCheckbox(){
        pageObject.commonUtils().clickOnUBOFilterCheckbox();
    }

    @Then("the user should see the ultimate beneficial owners highlighted in the graph $ubosHighlightedExamTable")
    public void verifyUBOsAreHighlighted(ExamplesTable ubosHighlightedExamTable){
        pageObject.commonUtils().verifyUBOsAreHighlighted(ubosHighlightedExamTable);
    }

    @Then("the user should see the highlight removed from ultimate beneficial owners in the graph")
    public void verifyUBOHighlightIsRemoved(){
        pageObject.commonUtils().verifyUBOHighlightIsRemoved();
    }

    @Then("the user should see the ultimate beneficial owners filter checkbox disabled in the graph")
    public void verifyUBOFilterIsDisabled(){
        pageObject.commonUtils().verifyUBOFilterIsDisabled();
    }
}
