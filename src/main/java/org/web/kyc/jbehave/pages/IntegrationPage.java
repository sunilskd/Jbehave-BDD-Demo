package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import static org.junit.Assert.assertEquals;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

/**
 * Created by singirikondas on 6/21/2016.
 */
public class IntegrationPage extends WebDriverUtils {

    private By user_login_input_box_id = By.xpath("//*[@id='Username']");
    private By user_password_input_box_id = By.xpath("//*[@id='Password']");
    private By login_button_xpath = By.xpath("//*[@id='Submit']");
    private By view_on_bankers_almanac_button_xpath =By.xpath("//button[1]");
    private By logout_link_text_xpath = By.xpath(".//*[@id='ctl00_LoginBar_lnkLogin']/u");
    private String userType="";

    public IntegrationPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void launchBankersAlmanac() {
        get(readProperties().getBankersAlmanacUrl());
        manage().window().maximize();
    }

    public void userLogin(String userType) {
        this.userType = userType;
        waitForWebElementToAppear(user_login_input_box_id);
        if (userType.equals("kyc")) {
            enterStringInInputBox(user_login_input_box_id, readProperties().getKycUser());
        } else if (userType.equals("ubo")) {
            enterStringInInputBox(user_login_input_box_id, readProperties().getUboUser());
        }
        enterStringInInputBox(user_password_input_box_id, "password");
        clickOnWebElement(login_button_xpath);
        waitForInMilliSeconds(2000L);
    }

    public void clickViewOnBankersAlmanac(){
        clickOnWebElement(view_on_bankers_almanac_button_xpath);
        waitForInMilliSeconds(2000L);
    }

    public void verifyBankersAlamanacPage(){
        assertEquals(getCurrentUrl(),"http://batest.rbidev.ds/private/mbkhof.aspx?fid=2");
        waitForInMilliSeconds(2000L);
        clickOnWebElement(logout_link_text_xpath);
    }

}
