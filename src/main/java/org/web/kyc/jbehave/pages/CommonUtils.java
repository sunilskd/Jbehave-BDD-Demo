package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import java.util.Calendar;

import static org.junit.Assert.*;

/* Contains commonUtils methods to be used in page classes */

public class CommonUtils extends WebDriverUtils {

    private By ownership_tab_xpath = By.xpath("//*[@id='content-navigation'] //li[2]");
    private By percent_filter_option_header_text_xpath = By.xpath("//*[@id='content-filters'] //div[h2='Display %']/h2");
    private String percent_filter_options_text_xpath = "//*[@id='content-filters'] //div[h2='Display %']/ul/li";
    private String country_highlight_options_text_xpath = "//*[@id='content-filters'] //div[h2='Highlight']/ul/li";
    private By user_login_input_box_id = By.xpath("//input[@id='login']");
    private By login_button_xpath = By.xpath("//button[1]");
    private By logout_button_xpath = By.xpath("//button[1]");
    private By summary_button_selected_text_xpath = By.xpath("//*[@id='view-options']/ul/li[@class='selected']");
    private By footer_copyrights_label_text_xpath = By.xpath("//*[@id='footer']/p");
    private By save_as_pdf_button_xpath = By.xpath("//button[@title='Save as PDF']");
    private By product_message_please_subscribe_link_text_xpath=By.xpath("//p[1]/a");
    private By bankers_almanac_logo_xpath = By.xpath("//*[@id='header']");

    public static String selectedCountryHighlight = "";
    private String userType="";

    public CommonUtils(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void openOwnershipModule() {
        nvPairs.clear();
        nvPairs.add(new BasicNameValuePair("userType", userType));

        /* Removing percentage name value pair at the start as percent filter are applied at each level */
        httpRequest().removeNameValuePair("percentage");
        get(readProperties().getUrl() + "/#/login");
        manage().window().maximize();
        verifyLoginIsSuccessful();
    }

    public void clickOnOwnershipTab() {
        waitForWebElementToAppear(ownership_tab_xpath);
        assertEquals("Ownership", getWebElementText(ownership_tab_xpath));
        clickOnWebElement(ownership_tab_xpath);
    }

    public void openUrl(String url) {
        nvPairs.add(new BasicNameValuePair("fid", url));
        get(readProperties().getUrl() + "/#/legalEntity/" + url + "/ownership/owners");
        verifyLoginIsSuccessful();
    }

    public void verifyPercentFilterOptions() {
        waitForWebElementToAppear(By.xpath(percent_filter_options_text_xpath + "[1]"));
        assertEquals("DISPLAY %", getWebElementText(percent_filter_option_header_text_xpath));
        assertEquals("View All", getWebElementText(By.xpath(percent_filter_options_text_xpath + "[1]")));
        assertTrue(isWebElementDisplayed(By.xpath(percent_filter_options_text_xpath + "[1][@class='selected']")));
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
        waitForInMilliSeconds(3000L);
        waitForPageToLoad(15000L);
        selectedCountryHighlight = country;
        String highlightXpath = country_highlight_options_text_xpath + "[" + getElementIndexByValue(By.xpath(country_highlight_options_text_xpath), country) + "]";
        clickOnWebElement(By.xpath(highlightXpath));
    }

    public void verifyPercentFilterIsDeSelected(String deselectFilter) {
        String filterXpath = percent_filter_options_text_xpath + "[" + getElementIndexByValue(By.xpath(percent_filter_options_text_xpath), deselectFilter) + "]";
        assertFalse(isWebElementDisplayed(By.xpath(filterXpath + "[@class='selected']")));
    }

    public void verifyCountryHighlightIsDeSelected(String deselectCountry){
        String countryHighlightXpath = country_highlight_options_text_xpath + "[" + getElementIndexByValue(By.xpath(country_highlight_options_text_xpath), deselectCountry) + "]";
        assertFalse(isWebElementDisplayed(By.xpath(countryHighlightXpath + "[@class='selected']")));
    }

    public void userLogin(String userType) {
        this.userType = userType;
        waitForWebElementToAppear(user_login_input_box_id);
        if (userType.equals("kyc")) {
            enterStringInInputBox(user_login_input_box_id, readProperties().getKycUser());
        } else if (userType.equals("ubo")) {
            enterStringInInputBox(user_login_input_box_id, readProperties().getUboUser());
        }
        clickOnWebElement(login_button_xpath);
        verifyLoginIsSuccessful();
    }

    public void verifyLoginIsSuccessful(){
        waitForInMilliSeconds(2000L);
        if(getCurrentUrl().contains("401")){
            navigate().back();
        } else if(getCurrentUrl().contains("404")){
            navigate().back();
        }
    }

    public void userLogout() {
        clickOnWebElement(logout_button_xpath);
    }

    public void verifySummaryIsSelectedByDefault() {
        waitForPageToLoad(15000L);
        assertEquals("Summary", getWebElementText(summary_button_selected_text_xpath));
    }

    public void verifyFooterInformation(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        waitForWebElementToAppear(footer_copyrights_label_text_xpath);
        assertEquals("© Reed Business Information Limited " + year,getWebElementText(footer_copyrights_label_text_xpath));
    }

    public void clickOnLinks(String footerLink){
        findElement(By.linkText(footerLink)).click();
        waitForInMilliSeconds(3000L);
    }

    public void clickOnFooterLogos(String verifyFooterLogos){
        findElement(By.className(verifyFooterLogos)).click();
    }

    public void verifyURLOpensInNewWindow(String url){
        waitForInMilliSeconds(3000L);
        for (String Handle : getWindowHandles()) {
            switchTo().window(Handle);
        }
        assertEquals(url, getCurrentUrl());
        close();
        switchTo().window((String) getWindowHandles().toArray()[0]);
    }

    public static void waitForInMilliSeconds(long milliSeconds){
        try {
            Thread.sleep(milliSeconds);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void clickOnSaveAsPDFIcon() {
        clickOnWebElement(save_as_pdf_button_xpath);
        waitForInMilliSeconds(5000L);
    }

    public void clickOnPleaseSubscribe(){
        clickOnWebElement(product_message_please_subscribe_link_text_xpath);
    }

    public void verifyPrintHelpPage() {
        verifyURLOpensInNewWindow(readProperties().getUrl() + "/printing-help.html");
    }

    public void openPrintHelp() {
        get(readProperties().getUrl() + "/printing-help.html");
        manage().window().maximize();
    }

    public void verifyPrintInstruction() {
        assertEquals("Printing Help", getWebElementText(By.xpath("//h1")));
        assertEquals("How to Print",getWebElementText(By.xpath("//h2[1]")));
        assertEquals("Acrobat Reader 12",getWebElementText(By.xpath("//h2[2]")));
        assertEquals("Acrobat Reader 11",getWebElementText(By.xpath("//h2[3]")));
        assertEquals("PDF X-Change Viewer",getWebElementText(By.xpath("//h2[4]")));
        assertEquals("Foxit",getWebElementText(By.xpath("//h2[5]")));
    }

    public void verifyBankersAlmanacLogo() {
        assertTrue(isWebElementDisplayed(bankers_almanac_logo_xpath));
    }

    public void verifyOwnershipModule() {
        assertEquals("Ownership ModulePrint Help", getWebElementText(bankers_almanac_logo_xpath).replace("\n",""));
    }
}