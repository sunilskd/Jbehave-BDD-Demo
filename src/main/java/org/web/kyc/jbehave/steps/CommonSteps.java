package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.*;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

import java.io.IOException;

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

    @Then("the user should see the copyright notice: © Reed Business Information Limited (year)")
    public void verifyFooterInformation(){pageObject.commonUtils().verifyFooterInformation();
    }

    @When("the user clicks on $footerLink link in footer section")
    @Alias("the user clicks on $footerLink link in error screen")
    public void verifyFooterLinks(@Named("$footerLink") String footerLink){pageObject.commonUtils().verifyFooterLinks(footerLink);
    }

    @When("the user clicks on the logo $logo in footers section")
    public void verifyFooterLogos(@Named("$logo") String logo){pageObject.commonUtils().verifyFooterLogos(logo);
    }

    @Then("user is taken to a URL $url that opens in a new window")
    public void verifyURLOpensInNewWindow(@Named("$url") String url){pageObject.commonUtils().verifyURLOpensInNewWindow(url);}

    @Given("compare pdfs")
    public void comparePdfs() throws IOException {
        pageObject.commonUtils().comparePdfs();
    }
}
