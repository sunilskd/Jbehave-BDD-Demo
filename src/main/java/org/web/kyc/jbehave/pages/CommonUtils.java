package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.*;

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
    private By graph_button_xpath = By.xpath("//*[@id='view-options']/ul/li[2]");
    private By graph_country_highlight_drop_down_xpath = By.xpath("//select");
    private By graph_country_highlight_list_text_xpath = By.xpath("//select/option");
    private By graph_country_highlight_header_text_xpath = By.xpath(".//div[@class='graph-controls']/div[3] //label");
    private By graph_highlight_in_graph_header_text_xpath = By.xpath("//div[@class='graph-controls']/div[3] //h2");
    private By graph_percent_slider_bar_xpath = By.xpath("//*[@class='graph-controls'] //input[2]");
    private By graph_percent_filter_text_box_xpath = By.xpath("//*[@class='graph-controls']/div[1]/div/input[1]");
    private By graph_no_known_entities_message_text_xpath = By.xpath("//*[@id='content-view']/p");
    private By graph_filter_direct_relationship_only_xpath = By.xpath("//input[@type='checkbox'][@class='ng-pristine ng-valid']");
    private By graph_filer_direct_relationship_only_uncheck_xpath = By.xpath("//input[@type='checkbox'][@class='ng-valid ng-dirty']");
    private String graph_level_xpath = "//*[contains(@transform,',";
    private String graph_percent_xpath = ")')]/*[local-name()='text'][1]/*[local-name()='tspan'][@x='40']";
    private String graph_country_xpath = ")')]/*[local-name()='text'][2]";
    private String graph_legal_title_tool_tip_xpath = "//*[@class='graph-container']//*[local-name()='title']";
    private String graph_legal_title_link_xpath = ")')]/*[local-name()='text']//*[local-name()='tspan'][@class='name']";
    private By graph_country_highlight_nodes_xpath = By.xpath("//*[local-name()='g'][contains(@class,'highlight-country')]/*[local-name()='text']/*[local-name()='title']");
    private By footer_copyrights_label_text_xpath = By.xpath("//*[@id='footer']/p");
    private By graph_country_highlight_nodes_verify_xpath = By.xpath("//*[local-name()='rect'][contains(@class,'country-highlight')]");
    private String graph_legal_title_xpath = ")')]/*[local-name()='text']/*[local-name()='title']";
    private By graph_xpath = By.xpath(".//*[local-name()='g'][@class='drawarea']");
    private By graph_side_panel_close_button_xpath = By.xpath("//div[3]/button");
    private By graph_side_panel_closed_xpath = By.xpath("//h3[@class='ng-hide']");
    private By graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private By graph_percent_filter_label_xpath = By.xpath("//*[@class='graph-controls']/div[1] //label");
    private By graph_display_in_graph_label_xpath = By.xpath("//*[@class='graph-controls']/div[1] //h2");
    private By graph_filter_direct_relationship_only_label_xpath = By.xpath("//div[@class='graph-controls']/div[2]/div");
    private By graph_ubo_filter_label_xpath = By.xpath("//div[@class='graph-controls']/div[4]/div");
    private By graph_highlight_ubo_xpath = By.xpath("//*[local-name()='g'][contains(@class,'highlight-ubo')]/*[local-name()='text']/*[local-name()='tspan'][1]");
    private By graph_ubo_filter_checkbox_unchecked_state_xpath = By.xpath("//input[@data-ng-model='graphFilterState.ubo'][@class='ng-scope ng-pristine ng-valid']");
    private By graph_ubo_filter_checkbox_xpath = By.xpath("//input[@data-ng-model='graphFilterState.ubo']");
    private By graph_ubo_filter_checkbox_disabled_xpath = By.xpath("//input[@data-ng-model='graphFilterState.ubo'][@disabled='']");

    public static String selectedCountryHighlight = "";
    private String userType="";

    public CommonUtils(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open() {
        nvPairs.clear();
        nvPairs.add(new BasicNameValuePair("userType", userType));
        get(readProperties().getUrl() + "login");
        manage().window().maximize();
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
        waitForInMilliSeconds(2000L);
    }

    public void userLogout() {
        clickOnWebElement(logout_button_xpath);
    }

    public void verifySummaryIsSelectedByDefault() {
        waitForPageToLoad(15000L);
        assertEquals("Summary", getWebElementText(summary_button_selected_text_xpath));
    }

    public void clickOnGraphButton() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_button_xpath);
        if(isWebElementDisplayed(graph_xpath)) {
            executeScript
                    ("return arguments[0].setAttribute(arguments[1],arguments[2]);",
                            getWebElement(graph_xpath), "transform", "translate(868.6954528766546,353.85591147078947) scale(0.14742692172911015)");
        }
    }

    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        waitForInMilliSeconds(3000L);
        verifyCountryHighlightsHeader();
        List<String> aCountryHighlightList = getWebElementsText(graph_country_highlight_list_text_xpath);
        for(int i =0; i<countriesHighlightListExamTable.getRowCount(); i++){
            assertEquals("Country list does not match at " + i, countriesHighlightListExamTable.getRow(i).get(countriesHighlightListExamTable.getHeaders().get(0)), aCountryHighlightList.get(i));
        }
    }

    public void selectCountryHighlightInGraphs(String country) {
        Select dropDown = new Select(getWebElement(graph_country_highlight_drop_down_xpath));
        dropDown.selectByVisibleText(country);
    }

    public void verifyCountryHighlightsHeader() {
        assertEquals("HIGHLIGHT IN GRAPH", getWebElementText(graph_highlight_in_graph_header_text_xpath));
        assertEquals("Country", getWebElementText(graph_country_highlight_header_text_xpath));
    }

    public void verifyNoCountryHighlightSelection(){
        waitForWebElementToAppear(graph_country_highlight_drop_down_xpath);
        Select dropDown = new Select(getWebElement(graph_country_highlight_drop_down_xpath));
        assertEquals("No country highlight", dropDown.getFirstSelectedOption().getText());
    }

    public void verifyNoHighlightedNodes() {
        assertFalse(isWebElementDisplayed(graph_country_highlight_nodes_verify_xpath));
    }

    public void changePercentOwnershipUsingSlider(int slideTo) {
        moveSliderBarTo(graph_percent_slider_bar_xpath, slideTo);
    }

    public void enterPercentFilter(String percentFilter){
        waitForWebElementToAppear(graph_percent_filter_text_box_xpath);
        enterStringInInputBox(graph_percent_filter_text_box_xpath, percentFilter);
        waitForInMilliSeconds(3000L);
    }

    public void verifyPercentFilterIsSetToZero() {
        waitForWebElementToAppear(graph_percent_slider_bar_xpath);
        assertEquals("% Ownership (Greater than or equal to value)", getWebElementText(graph_percent_filter_label_xpath));
        assertEquals("DISPLAY IN GRAPH", getWebElementText(graph_display_in_graph_label_xpath));
        assertEquals("0", getWebElementsAttributeValue(graph_percent_slider_bar_xpath, "data-value").get(0));
    }

    public void clickOnDirectRelationshipCheckbox() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_filter_direct_relationship_only_xpath);
    }

    public void verifyingDirectRelationshipOnlyFilterIsUnchecked() {
        assertEquals("Direct relationships only", getWebElementText(graph_filter_direct_relationship_only_label_xpath));
        assertTrue(isWebElementDisplayed(graph_filter_direct_relationship_only_xpath));
    }

    public void unCheckDirectRelationshipCheckbox() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_filer_direct_relationship_only_uncheck_xpath);
    }

    public void verifyGraphNodes(String level, ExamplesTable nodesExamTable) {
        List<WebElement> aLegalTitle = getWebElements(By.xpath(graph_level_xpath + level + graph_legal_title_link_xpath));
        List<WebElement> aPercent = getWebElements(By.xpath(graph_level_xpath + level + graph_percent_xpath ));
        List<WebElement> aCountry = getWebElements(By.xpath(graph_level_xpath + level + graph_country_xpath));
        List aNodeList = new ArrayList();

        /* Comparing the size of actual and expected list */
        assertEquals(aLegalTitle.size(),nodesExamTable.getRowCount());

        /* Creating a list of actual owners list by concatenating legal title, percent and country */
        for (int i =0; i<getWebElements(By.xpath(graph_level_xpath + level + ")')]")).size(); i++) {
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", aLegalTitle.get(i)).toString().replace("%","")
                                                                                        .replace("<tspan x=\"40\">","")
                                                                                        .replace("</tspan><tspan dy=\"14\" x=\"40\">","")
                                                                                        .replace("</tspan><tspan class=\"ellipsis\">","")
                                                                                        .replace("</tspan>","")
                                                                                        .replace(" ","") +
                            executeScript("return arguments[0].innerHTML;", aPercent.get(i)).toString().replace("%","") +
                            executeScript("return arguments[0].innerHTML;", aCountry.get(i)).toString().replace(" ","")
            );
        }

        List eNodeList = new ArrayList();
        for (Map<String,String> row : nodesExamTable.getRows()) {
            String legalTitle = row.get("NODES").replace(" ","");
            eNodeList.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyNodesAreHighlightedForSelectedCountry(ExamplesTable nodesHighlightedExamTable) {
        List<WebElement> webElements = getWebElements(graph_country_highlight_nodes_xpath);
        List aNodeList = new ArrayList();

        /* Comparing the size of actual and expected list */
        assertEquals(webElements.size(),nodesHighlightedExamTable.getRowCount());

        for (int i =0; i<webElements.size(); i++) {
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", webElements.get(i)).toString());
        }

        List eNodeList = new ArrayList();
        for (Map<String,String> row : nodesHighlightedExamTable.getRows()) {
            String legalTitle = row.get("NODES");
            eNodeList.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        /* Looping through all the nodes*/
        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyNoEntitiesMsg() {
        waitForWebElementToAppear(graph_no_known_entities_message_text_xpath);
        waitForInMilliSeconds(3000L);
        assertEquals("No known entities.", getWebElementText(graph_no_known_entities_message_text_xpath));
    }

    public void verifyFooterInformation(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        waitForWebElementToAppear(footer_copyrights_label_text_xpath);
        assertEquals("© Reed Business Information Limited " + year,getWebElementText(footer_copyrights_label_text_xpath));
     }

    public void verifyFooterLinks(String footerLink){
        findElement(By.linkText(footerLink)).click();
        waitForInMilliSeconds(3000L);
    }

    public void verifyFooterLogos(String verifyFooterLogos){
       findElement(By.className(verifyFooterLogos)).click();
    }


    public void verifyURLOpensInNewWindow(String url){
        waitForInMilliSeconds(3000L);
        for (String Handle : getWindowHandles()) {
            switchTo().window(Handle);
        }
        assertEquals(url, getCurrentUrl());
        switchTo().window((String) getWindowHandles().toArray()[0]);
    }

    public void verifyHoverOverToolTipInNodes(ExamplesTable legalTitleExamTable) {
        waitForWebElementToAppear(By.xpath(graph_legal_title_tool_tip_xpath));
        List<WebElement> aLegalTitle = getWebElements(By.xpath(graph_legal_title_tool_tip_xpath));
        List aNodeList = new ArrayList();

        /* Comparing the size of actual and expected list */
        assertEquals(aLegalTitle.size(),legalTitleExamTable.getRowCount());

        for (int i =0; i<aLegalTitle.size(); i++) {
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", aLegalTitle.get(i)).toString().replace("%","").trim());
        }

        List eNodeList = new ArrayList();
        for (Map<String,String> row : legalTitleExamTable.getRows()) {
            String legalTitle = row.get("LEGAL TITLE");
            eNodeList.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyCountryHighlightDropDownSize() {
        List<String> aCountryHighlightList = getWebElementsText(graph_country_highlight_list_text_xpath);
        assertTrue(aCountryHighlightList.size()==1);
    }

    public void verifyStopTravelingPath(String level) {
        waitForInMilliSeconds(3000L);
        assertFalse(isWebElementDisplayed(By.xpath(graph_level_xpath + level + graph_legal_title_xpath)));
    }

    public void clickPartialLinkText(String linkText){
        waitForInMilliSeconds(3000L);
        findElement(By.partialLinkText(linkText)).click();
    }
    public void closeSidePanel(){
        findElement(graph_side_panel_close_button_xpath).click();
    }

    public void verifySidePanelIsClosed(){
        assertTrue(isWebElementDisplayed(graph_side_panel_closed_xpath));
        assertTrue(isWebElementDisplayed(graph_header_text_xpath));
    }

    public void verifyUBOFilterIsUncheckedByDefault() {
        waitForWebElementToAppear(graph_ubo_filter_label_xpath);
        assertEquals("Ultimate Beneficial Owner", getWebElementText(graph_ubo_filter_label_xpath));
        assertTrue(isWebElementDisplayed(graph_ubo_filter_checkbox_unchecked_state_xpath));
    }

    public void clickOnUBOFilterCheckbox() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_ubo_filter_checkbox_xpath);
    }

    public void verifyUBOsAreHighlighted(ExamplesTable ubosHighlightedExamTable) {
        List<WebElement> highlightedUbos = getWebElements(graph_highlight_ubo_xpath);
        List aNodeList = new ArrayList();
        for(int i=0; i<highlightedUbos.size(); i++){
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", highlightedUbos.get(i)).toString()
                                                                        .replace("<tspan x=\"40\">","")
                                                                        .replace("</tspan><tspan dy=\"14\" x=\"40\">","")
                                                                        .replace("</tspan><tspan class=\"ellipsis\">","")
                                                                        .replace("</tspan>",""));
        }

        List eNodeList = new ArrayList();
        for (Map<String,String> row : ubosHighlightedExamTable.getRows()) {
            String legalTitle = row.get("NODES");
            eNodeList.add(legalTitle);
        }

        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyUBOHighlightIsRemoved() {
        assertFalse(isWebElementDisplayed(graph_highlight_ubo_xpath));
    }

    public void verifyUBOFilterIsDisabled() {
        assertTrue(isWebElementDisplayed(graph_ubo_filter_checkbox_disabled_xpath));
    }

    public void verifyNoUBOFilters() {
        assertFalse(isWebElementDisplayed(graph_ubo_filter_checkbox_xpath));
    }

    public static void waitForInMilliSeconds(long milliSeconds){
        try {
            Thread.sleep(milliSeconds);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
