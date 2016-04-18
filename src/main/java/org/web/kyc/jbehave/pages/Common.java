package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import static org.junit.Assert.*;

/* Contains common methods to be used in page classes */

public class Common extends PagesCommon{

    private By ownership_tab_xpath = By.xpath("//*[@id='content-navigation'] //li[2]");
    private By percent_filter_option_header_text_xpath = By.xpath("//*[@id='content-filters']/h2[1]");
    private String percent_filter_options_text_xpath = "//*[@id='content-filters']/ul[1]/li";
    private By user_login_input_box_id = By.xpath("//input[@id='login']");
    private By login_button_xpath = By.xpath("//button[1]");
    private By logout_button_xpath = By.xpath("//button[1]");

    public Common(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open(){
        nvPairs.clear();
        get(readProperties().getUrl() + "login");
    }

    public void clickOnOwnershipTab() {
        waitForWebElementToAppear(ownership_tab_xpath);
        assertEquals("Ownership", getWebElementText(ownership_tab_xpath));
        clickOnWebElement(ownership_tab_xpath);
    }

    public void openUrl(String url){
        nvPairs.add(new BasicNameValuePair("fid", url));
        get(readProperties().getUrl() + "legalEntity/" + url + "/ownership/owners");
    }

    public void verifyPercentFilterOptions() {
        waitForWebElementToAppear(By.xpath(percent_filter_options_text_xpath+"[1]"));
        assertEquals("DISPLAY %", getWebElementText(percent_filter_option_header_text_xpath));
        assertEquals("View All", getWebElementText(By.xpath(percent_filter_options_text_xpath+"[1]")));
        assertTrue(isWebElementDisplayed(By.xpath(percent_filter_options_text_xpath+"[1][@class='ng-binding ng-scope selected']")));
        assertEquals("10% and above", getWebElementText(By.xpath(percent_filter_options_text_xpath+"[2]")));
        assertEquals("25% and above", getWebElementText(By.xpath(percent_filter_options_text_xpath+"[3]")));
        assertEquals("50% and above", getWebElementText(By.xpath(percent_filter_options_text_xpath+"[4]")));
    }

    public void selectPercentFilter(String percentFilter) {
        String filterXpath = "";
        nvPairs.add(new BasicNameValuePair("percentage",percentFilter.replace("% and above","")));
        if(percentFilter.equals("View All")){
             filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), percentFilter) + "]";
        } else {
             filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), percentFilter+"% and above") + "]";
        }
        clickOnWebElement(By.xpath(filterXpath));
    }

    public void verifyPercentFilterIsDeSelected(String deselectFilter) {
        String filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), deselectFilter) + "]";
        assertFalse(isWebElementDisplayed(By.xpath(filterXpath+"[@class='ng-binding ng-scope selected']")));
    }

    public void userLogin(String userType) {
        if(userType.equals("kyc")){
            enterStringInInputBox(user_login_input_box_id, readProperties().getKycUser());
        } else if(userType.equals("ubo")){
            enterStringInInputBox(user_login_input_box_id, readProperties().getUboUser());
        }
        clickOnWebElement(login_button_xpath);
        try {
            Thread.sleep(2000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void userLogout(){
        clickOnWebElement(logout_button_xpath);
    }
}
