package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;
import static org.web.kyc.xqueries.XQueryEnum.ENTITY_DETAILS;
import static org.web.kyc.xqueries.XQueryEnum.SUBSIDIARIES_LIST;

public class SidePanelUtils extends WebDriverUtils {

    private By graph_side_panel_free_text_xpath = By.xpath("//div[3]/div/p");
    private By graph_side_panel_close_button_xpath = By.xpath("//div[3]/button");
    private By graph_side_panel_closed_xpath = By.xpath("//h3[@class='ng-hide']");
    private By graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private Document entityDetailsDocument;
    private By graph_side_panel_title_text_xpath= By.xpath("//div[3]/h2");
    private By graph_side_panel_bankers_almanac_ID_label_text_xpath= By.xpath("//div[3]/p");
    private By graph_side_panel_details_label_text_xpath= By.xpath("//div[3]/div[2]/h3[1]");
    private By graph_side_panel_head_office_label_text_xpath= By.xpath("//tr[1]/th");
    private By graph_side_panel_regulator_label_text_xpath= By.xpath("//tr[2]/th");
    private By graph_side_panel_stock_exchange_label_text_xpath= By.xpath("//tr[3]/th");
    private By graph_side_panel_direct_owners_label_text_xpath= By.xpath("//div[3]//h3[2]");
    private By graph_side_panel_ubo_label_text_xpath= By.xpath("//div[2]/div/h3");
    private By graph_side_panel_no_ubo_section_xpath = By.xpath("//div[2]/div[@style='display: none;']/h3");
    private By graph_side_panel_no_known_subs_message_text_xpath = By.xpath("//div[3]/div[2]/p[1]");
    private By graph_side_panel_no_known_ubos_message_text_xpath = By.xpath("//div[3]/div[2]/div/p");
    private By graph_side_panel_head_office_text_xpath =By.xpath("//tbody/tr/td/div");
    private By graph_side_panel_regulators_text_xpath =By.xpath("//tbody/tr[2]/td/span");
    private By graph_side_panel_stock_exchange_text_xpath =By.xpath("//tbody/tr[3]/td/span");
    private By graph_side_panel_direct_owners_title_list_text_xpath =By.xpath("//*[@id='directly-owns']/tbody/tr/td[1]");
    private By graph_side_panel_direct_owners_country_list_text_xpath =By.xpath("//*[@id='directly-owns']/tbody/tr/td[2]");
    private By graph_side_panel_direct_owners_percent_ownership_list_text_xpath =By.xpath("//*[@id='directly-owns']/tbody/tr/td[3]");
    private By graph_side_panel_ubo_title_list_text_xpath =By.xpath("//*[@id='ubo']/tbody/tr/td[1]");
    private By graph_side_panel_ubo_entity_list_text_xpath =By.xpath("//*[@id='ubo']/tbody/tr/td[2]");
    private By graph_side_panel_ubo_percent_ownership_list_text_xpath =By.xpath("//*[@id='ubo']/tbody/tr/td[3]");


    public SidePanelUtils(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifyFreeTextInSidePanel(ExamplesTable freeTextExampleTable){
        waitForInMilliSeconds(3000L);
        String aDirectOwnerFreeText = getWebElementText(graph_side_panel_free_text_xpath);
        assertEquals(freeTextExampleTable.getRow(0).get(freeTextExampleTable.getHeaders().get(0)), aDirectOwnerFreeText.replace("%","").trim());
    }

    public void closeSidePanel(){
        findElement(graph_side_panel_close_button_xpath).click();
    }

    public void verifySidePanelIsClosed(){
        assertTrue(isWebElementDisplayed(graph_side_panel_closed_xpath));
        assertTrue(isWebElementDisplayed(graph_header_text_xpath));
    }

    public void dVerifyDetailsSectionInSidePanel(){
        waitForInMilliSeconds(3000L);
        entityDetailsDocument = httpRequest().getResultsFormDataBase(ENTITY_DETAILS, nvPairs);
        assertEquals(entityDetailsDocument.getElementsByTagName("legalTitle").item(0).getTextContent(),getWebElementText(graph_side_panel_title_text_xpath));
        assertEquals("Bankersalmanac.com ID: " + entityDetailsDocument.getElementsByTagName("bankersAlmanacID").item(0).getTextContent(),(getWebElementText(graph_side_panel_bankers_almanac_ID_label_text_xpath)));
        dVerifySidePanelLabels();
        assertEquals(entityDetailsDocument.getElementsByTagName("headOfficeAddress").item(0).getTextContent().replace(", ",","),getWebElementText(graph_side_panel_head_office_text_xpath).replace("\n","").replace(", ",","));
        List<WebElement> aRegulatorsList = getWebElements(graph_side_panel_regulators_text_xpath);
        for (int i =0; i < aRegulatorsList.size(); i++){
            assertEquals("Regulator doesn't match at " + i, entityDetailsDocument.getElementsByTagName("regulator").item(i).getTextContent(), aRegulatorsList.get(i).getText());
        }

        List<WebElement> aStockExchangeList = getWebElements(graph_side_panel_stock_exchange_text_xpath);
        for (int i =0; i < aStockExchangeList.size(); i++){
            assertEquals("Stock Exchange doesn't match at " + i, entityDetailsDocument.getElementsByTagName("stockExchange").item(i).getTextContent(), aStockExchangeList.get(i).getText());
        }
    }

    public void dVerifySidePanelLabels(){
        waitForInMilliSeconds(3000L);
        assertEquals("Head Office", getWebElementText(graph_side_panel_head_office_label_text_xpath));
        assertEquals("Regulator", getWebElementText(graph_side_panel_regulator_label_text_xpath));
        assertEquals("Stock Exchange", getWebElementText(graph_side_panel_stock_exchange_label_text_xpath));
        assertEquals("DIRECTLY OWNS", getWebElementText(graph_side_panel_direct_owners_label_text_xpath));
        assertEquals("DETAILS", getWebElementText(graph_side_panel_details_label_text_xpath));
    }

    public void dVerifyDirectlyOwnsSectionInSidePanel(){
        waitForInMilliSeconds(3000L);
        Document eSubsidiariesList = httpRequest().getResultsFormDataBase(SUBSIDIARIES_LIST, nvPairs);
        List<WebElement> aSubsidiariesEntityName = getWebElements(graph_side_panel_direct_owners_title_list_text_xpath);
        List<WebElement> aSubsidiariesCountryName = getWebElements(graph_side_panel_direct_owners_country_list_text_xpath);
        List<WebElement> aSubsidiariesPercentageOwned = getWebElements(graph_side_panel_direct_owners_percent_ownership_list_text_xpath);
        assertEquals("Subsidiaries count mismatch", eSubsidiariesList.getElementsByTagName("entityName").getLength(), aSubsidiariesEntityName.size());
        for (int i = 0; i < aSubsidiariesEntityName.size(); i++) {
            assertEquals("Legal title does not match at" + i, eSubsidiariesList.getElementsByTagName("entityName").item(i).getTextContent(), aSubsidiariesEntityName.get(i).getText());
            assertEquals("Country name does not match at" + i, eSubsidiariesList.getElementsByTagName("countryOfOperations").item(i).getTextContent(), aSubsidiariesCountryName.get(i).getText());
            if (!eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent().isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, (eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent() + "%"), aSubsidiariesPercentageOwned.get(i).getText());
            }
        }
    }

    public void verifySidePanelIsOpen() {
        assertTrue(isWebElementDisplayed(graph_side_panel_details_label_text_xpath));
    }

    public void verifyUboListIsNotDisplayed() {
        assertFalse(isWebElementDisplayed(By.xpath("//*[@id='ubo']/tbody/tr")));
    }

    public void dVerifyUBOSectionInSidePanel(ExamplesTable uboListExamTable) {
        waitForInMilliSeconds(3000L);
        List<WebElement> aUBONameList = getWebElements(graph_side_panel_ubo_title_list_text_xpath);
        List<WebElement> aUBOEntityList = getWebElements(graph_side_panel_ubo_entity_list_text_xpath);
        List<WebElement> aUBOPercentageOwnedList = getWebElements(graph_side_panel_ubo_percent_ownership_list_text_xpath);
        assertEquals("ULTIMATE BENEFICIAL OWNERS", getWebElementText(graph_side_panel_ubo_label_text_xpath));
        for (int i = 0; i < aUBONameList.size(); i++) {
            assertEquals("UBO Name does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(0)), aUBONameList.get(i).getText());
            assertEquals("UBO Entity name does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(1)), aUBOEntityList.get(i).getText());
            if (!uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(2)) + "%", aUBOPercentageOwnedList.get(i).getText());
            }
        }
    }

    public void verifyNoKnowsEntitiesMessage(){
        waitForWebElementToAppear(graph_side_panel_no_known_subs_message_text_xpath);
        assertEquals("No known entities.", getWebElementText(graph_side_panel_no_known_subs_message_text_xpath));
    }

    public void verifyNoKnowsEntitiesMessageUBOs(){
        waitForWebElementToAppear(graph_side_panel_no_known_ubos_message_text_xpath);
        assertEquals("No known entities.", getWebElementText(graph_side_panel_no_known_ubos_message_text_xpath));
    }

    public void clickEntityTitleOnSidePanel(String nodeTitle){
        waitForInMilliSeconds(3000L);
        assertEquals(nodeTitle,findElement(graph_side_panel_title_text_xpath).getText());
        findElement(graph_side_panel_title_text_xpath).click();
    }

    public void verifyNoUBOSectionInSidePanel() {
        assertTrue(isWebElementDisplayed(graph_side_panel_no_ubo_section_xpath));
    }
}
