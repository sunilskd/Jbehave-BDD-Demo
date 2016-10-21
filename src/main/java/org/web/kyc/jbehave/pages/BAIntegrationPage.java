package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class BAIntegrationPage extends WebDriverUtils {


    private By view_on_bankers_almanac_button_xpath =By.xpath(".//*[@id='tools']/a[1]");
    private By logout_link_text_xpath = By.xpath(".//*[@id='ctl00_LoginBar_lnkLogin']/u");
    private By ubo_declaration_document_link_text_xpath =By.xpath("//div[2]/div[1]/div/a");
    private String userType="";

    public BAIntegrationPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void launchBankersAlmanac() {
        get(readProperties().getBankersAlmanacUrl()+"formslogin.aspx");
        manage().window().maximize();
    }

     public void clickViewOnBankersAlmanac(){
        clickOnWebElement(view_on_bankers_almanac_button_xpath);
        waitForInMilliSeconds(2000L);
    }


    public void verifyBankersAlmanacPage(String fid) {
        waitForInMilliSeconds(3000L);
        //assertEquals("http://bauat.rbidev.ds/private/mbkhof.aspx?fid=" + fid, getCurrentUrl());
        assertTrue(getCurrentUrl().contains("http://www.bankersalmanac.com/"));
    }

    public void userLogsOutOfBankersAlmanac(){
        get("http://bauat.rbidev.ds/private/seaban.aspx");
        clickOnWebElement(logout_link_text_xpath);
        waitForInMilliSeconds(2000L);

    }

    public void clickUboDeclarationDocument(){
        clickOnWebElement(ubo_declaration_document_link_text_xpath);
        waitForInMilliSeconds(2000L);
    }

    public void verifyBankersAlamanacUboSection(String fid){
        waitForInMilliSeconds(2000L);
        //assertEquals("http://bauat.rbidev.ds/private/mbkddrm.aspx?fid=" + fid +"#UBO",getCurrentUrl());
        assertTrue(getCurrentUrl().contains("http://www.bankersalmanac.com/"));
        assertTrue(getCurrentUrl().contains("#UBO"));
        //clickOnWebElement(logout_link_text_xpath);
        waitForInMilliSeconds(2000L);
    }

}
