package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import static org.junit.Assert.*;

/* Contains common methods to be used in page classes */

public class Common extends PagesCommon{

    private By ownership_tab_xpath = By.xpath("//*[@id='content-navigation'] //li[2]");
    public static String selectedFid="";

    public Common(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open(){
        get(readProperties().getUrl());
    }

    public void clickOnOwnershipTab() {
        waitForWebElementToAppear(ownership_tab_xpath);
        assertEquals("Ownership", getWebElementText(ownership_tab_xpath));
        clickOnWebElement(ownership_tab_xpath);
    }

    public void openUrl(String url){
        get("https://internal-uboqa-web-1999720210.us-east-1.elb.amazonaws.com/kyc-webapp/#/legalEntity/" + url + "/ownership/owners");
        selectedFid = url;
    }

}
