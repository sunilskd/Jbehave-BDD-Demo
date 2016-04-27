package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/* Contains commonUtils methods to be used in page classes */

public class CommonUtils extends WebDriverUtils {

    private By ownership_tab_xpath = By.xpath("//*[@id='content-navigation'] //li[2]");
    private By percent_filter_option_header_text_xpath = By.xpath("//*[@id='content-filters']/h2[1]");
    private String percent_filter_options_text_xpath = "//*[@id='content-filters']/ul[1]/li";
    private String country_highlight_options_text_xpath = "//*[@id='content-filters']/ul[2]/li";
    private By user_login_input_box_id = By.xpath("//input[@id='login']");
    private By login_button_xpath = By.xpath("//button[1]");
    private By logout_button_xpath = By.xpath("//button[1]");
    private By summary_tab_selected_text_xpath = By.xpath("//*[@id='view-options']/ul/li[@class='selected']");
    public static String selectedCountryHighlight = "";

    public CommonUtils(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open() {
        nvPairs.clear();
        get(readProperties().getUrl() + "login");
    }

    public void clickOnOwnershipTab() {
        waitForWebElementToAppear(ownership_tab_xpath);
        assertEquals("Ownership", getWebElementText(ownership_tab_xpath));
        clickOnWebElement(ownership_tab_xpath);
    }

    public void openUrl(String url) {
        nvPairs.add(new BasicNameValuePair("fid", url));
        get(readProperties().getUrl() + "legalEntity/" + url + "/ownership/owners");
    }

    public void verifyPercentFilterOptions() {
        waitForWebElementToAppear(By.xpath(percent_filter_options_text_xpath + "[1]"));
        assertEquals("DISPLAY %", getWebElementText(percent_filter_option_header_text_xpath));
        assertEquals("View All", getWebElementText(By.xpath(percent_filter_options_text_xpath + "[1]")));
        assertTrue(isWebElementDisplayed(By.xpath(percent_filter_options_text_xpath + "[1][@class='ng-binding ng-scope selected']")));
        assertEquals("10% and above", getWebElementText(By.xpath(percent_filter_options_text_xpath + "[2]")));
        assertEquals("25% and above", getWebElementText(By.xpath(percent_filter_options_text_xpath + "[3]")));
        assertEquals("50% and above", getWebElementText(By.xpath(percent_filter_options_text_xpath + "[4]")));
    }

    public void selectPercentFilter(String percentFilter) {
        waitForPageToLoad(15000L);
        String filterXpath = "";
        nvPairs.add(new BasicNameValuePair("percentage", percentFilter.replace("% and above", "")));
        if (percentFilter.equals("View All")) {
            filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), percentFilter) + "]";
        } else {
            filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), percentFilter + "% and above") + "]";
        }
        clickOnWebElement(By.xpath(filterXpath));
    }

    public void selectCountryHighlight(String country) {

        try {
            Thread.sleep(3000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        waitForPageToLoad(15000L);
        selectedCountryHighlight = country;
        String highlightXpath = country_highlight_options_text_xpath + "[" + getElementIndexByValue(By.xpath(country_highlight_options_text_xpath), country) + "]";
        clickOnWebElement(By.xpath(highlightXpath));
    }

    public void verifyPercentFilterIsDeSelected(String deselectFilter) {
        String filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), deselectFilter) + "]";
        assertTrue(isWebElementDisplayed(By.xpath(filterXpath + "[@class='ng-binding ng-scope']")));
    }

    public void verifyCountryHighlightIsDeSelected(String deselectCountry){
        String countyrHighlighXpath = country_highlight_options_text_xpath + "[" + getElementIndexByValue(By.xpath(country_highlight_options_text_xpath), deselectCountry) + "]";
        assertTrue(isWebElementDisplayed(By.xpath(countyrHighlighXpath + "[@class='ng-binding ng-scope']")));
    }

    public void userLogin(String userType) {
        waitForWebElementToAppear(user_login_input_box_id);
        if (userType.equals("kyc")) {
            enterStringInInputBox(user_login_input_box_id, readProperties().getKycUser());
        } else if (userType.equals("ubo")) {
            enterStringInInputBox(user_login_input_box_id, readProperties().getUboUser());
        }
        clickOnWebElement(login_button_xpath);
        try {
            Thread.sleep(2000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void userLogout() {
        clickOnWebElement(logout_button_xpath);
    }

    public void verifySummaryIsSelectedByDefault() {
        assertEquals("Summary", getWebElementText(summary_tab_selected_text_xpath));
    }
}
