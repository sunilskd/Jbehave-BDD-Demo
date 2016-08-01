package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import static org.junit.Assert.assertEquals;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class ErrorScreenPage extends WebDriverUtils {

    private By error_header_text_xpath= By.xpath("//h1");
    private By error_line1_text_xpath= By.xpath("//p[1]");
    private By error_line2_text_xpath= By.xpath("//p[3]");

    public ErrorScreenPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void launchUnexpectedServerErrorScreen(){
        waitForInMilliSeconds(3000L);
        get("https://internal-uboqa-web-1999720210.us-east-1.elb.amazonaws.com/kyc-webapp/#/500");
        manage().window().maximize();
    }

    public void verifyUnexpectedServerErrorPage(){
        waitForInMilliSeconds(3000L);
        assertEquals("500 Unexpected Server Error", getWebElementText(error_header_text_xpath));
        assertEquals("An error occurred and your request could not be completed. Please try again.", getWebElementText(error_line1_text_xpath));
        assertEquals("If the issue persists, please contact Bankers Almanac Helpdesk.", getWebElementText(error_line2_text_xpath));
    }

    public void verifyPageNotFoundPage(){
        waitForInMilliSeconds(3000L);
        assertEquals("404 Page Not Found", getWebElementText(error_header_text_xpath));
        assertEquals("Sorry, the page you requested cannot be found. You may have used an outdated link or typed a URL that doesn't exist.", getWebElementText(error_line1_text_xpath));
        assertEquals("If the issue persists, please contact Bankers Almanac Helpdesk.", getWebElementText(error_line2_text_xpath));
    }

    public void launchAccessDeniedPage() {
        waitForInMilliSeconds(3000L);
        get("https://internal-uboqa-web-1999720210.us-east-1.elb.amazonaws.com/kyc-webapp/#/401");
        manage().window().maximize();
    }

    public void verifyAccessDeniedPage() {
        waitForInMilliSeconds(3000L);
        assertEquals("Access Denied", getWebElementText(error_header_text_xpath));
        assertEquals("You are not authorized for this product.", getWebElementText(error_line1_text_xpath));
    }
}
