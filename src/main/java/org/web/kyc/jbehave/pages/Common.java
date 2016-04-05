package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import static org.junit.Assert.assertEquals;

/* Contains common methods to be used in page classes */

public class Common extends PagesCommon{

    private By ownership_tab_xpath = By.xpath("//*[@id='content-navigation'] //li[2]");
    public String fid= "";
    public Common(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open(){
        get(readProperties().getUrl());
    }

    public void clickOnOwnershipTab() {
        waitForElementToAppear(ownership_tab_xpath);
        assertEquals("Ownership", getWebElementText(ownership_tab_xpath));
        clickOnWebElement(ownership_tab_xpath);
    }

    public void openUrl(String url){
        fid = url;
        get("https://internal-uboqa-web-1999720210.us-east-1.elb.amazonaws.com/kyc-webapp/#/legalEntity/" + url + "/ownership/owners");
    }
}
