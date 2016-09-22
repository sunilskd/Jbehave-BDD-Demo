package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.web.selenium.WebDriverProvider;
import org.web.kyc.jbehave.pages.PageObject;

public class CommonSteps {

    private final PageObject pageObject;

    public CommonSteps(WebDriverProvider webDriverProvider) {
        pageObject = new PageObject(webDriverProvider);
    }

    @Given("the user is on the ubo login page")
    public void openOwnershipModule(){
        pageObject.commonUtils().openOwnershipModule();
    }

    @Given("the user is on the ubo print help page")
    public void openPrintHelp(){
        pageObject.commonUtils().openPrintHelp();
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

    @Then("the user should see the copyright notice: © Reed Business Information Limited (year)")
    public void verifyFooterInformation(){pageObject.commonUtils().verifyFooterInformation();
    }

    @When("the user clicks on $footerLink link in footer section")
    @Aliases(values={"the user clicks on $footerLink link in error screen",
                    "the user clicks on the $footerLink link in the header section"})
    public void clickOnHeaderOrFooterLinks(@Named("$footerLink") String footerLink){pageObject.commonUtils().clickOnLinks(footerLink);
    }

    @Then("the user should see the bankers almanac logo in top left corner")
    public void verifyBankersAlmanacLogo(){
        pageObject.commonUtils().verifyBankersAlmanacLogo();
    }

    @Then("the user should see the ownership module next to bankers almanac logo in top left corner")
    public void verifyOwnershipModule(){
        pageObject.commonUtils().verifyOwnershipModule();
    }

    @When("the user clicks on the logo $logo in footers section")
    public void verifyFooterLogos(@Named("$logo") String logo){pageObject.commonUtils().clickOnFooterLogos(logo);
    }

    @Then("user is taken to a URL $url that opens in a new window")
    @Alias("the user is taken to subscription page URL $url on accuity.com")
    public void verifyURLOpensInNewWindow(@Named("$url") String url){pageObject.commonUtils().verifyURLOpensInNewWindow(url);}

    @When("the user clicks on the save as pdf icon (display loading icon while generating saved pdf for lists)")
    public void clickOnSaveAsPDFIcon(){
        pageObject.commonUtils().clickOnSaveAsPDFIcon();
    }

    @Then("user should see the instructions to print from web browser open in new tab")
    public void verifyPrintHelpPage(){
        pageObject.commonUtils().verifyPrintHelpPage();
    }

    @Then("user should see the instructions to print from web browser")
    public void verifyPrintInstruction(){
        pageObject.commonUtils().verifyPrintInstruction();
    }

}