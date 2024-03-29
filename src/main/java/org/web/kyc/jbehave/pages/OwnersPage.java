package org.web.kyc.jbehave.pages;

import org.apache.commons.io.FileUtils;
import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import static org.junit.Assert.*;
import static org.web.kyc.comparator.Comparator.compareImages;
import static org.web.kyc.comparator.PDFComparator.comparePDFsContent;
import static org.web.kyc.jbehave.pages.CommonUtils.selectedCountryHighlight;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;
import static org.web.kyc.xqueries.XQueryEnum.DIRECT_OWNERS_LIST;
import static org.web.kyc.utils.FilesUtils.*;

public class OwnersPage extends WebDriverUtils {

    private By owners_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[2]");
    private By direct_owners_header_text_xpath = By.xpath("//*[@id='content-view']/div[1]/div/h1");
    private By direct_owners_name_header_text_xpath = By.xpath("//*[@id='direct-owners'] //th[1]");
    private By direct_owners_country_header_text_xpath = By.xpath("//*[@id='direct-owners'] //th[2]");
    private By direct_owners_percentage_header_text_xpath = By.xpath("//*[@id='direct-owners'] //th[3]");
    private By direct_owners_date_header_text_xpath = By.xpath("//*[@id='direct-owners'] //th[4]");
    private By direct_owners_source_header_text_xpath = By.xpath("//*[@id='direct-owners'] //th[5]");
    private By direct_owners_entity_name_text_xpath = By.xpath("//*[@id='direct-owners'] //tr[@class='ng-scope']/td[1]");
    private By direct_owners_entity_free_text_xpath = By.xpath("//*[@class='free-text ng-scope']/td/div");
    private By direct_owners_country_name_text_xpath = By.xpath("//*[@id='direct-owners'] //td[2]");
    private By direct_owners_percentage_owned_text_xpath = By.xpath("//*[@id='direct-owners'] //td[3]");
    private By direct_owners_date_text_xpath = By.xpath("//*[@id='direct-owners'] //td[4]");
    private By direct_owners_source_text_xpath = By.xpath("//*[@id='direct-owners'] //td[5]");
    private By no_direct_owners_msg_text_xpath = By.xpath("//*[@id='content-view']/div[1]/div[3]/p");
    private By direct_owners_percentage_meter_bar_xpath = By.xpath("//*[@class='percent-meter ng-scope'] //div[@class='measure']");
    private By direct_owners_no_percentage_meter_bar_xpath = By.xpath("//*[@id='direct-owners'] //div[@class='meter ng-isolate-scope'][@style='display: none;']");
    private String direct_owners_highlighted_xpath = "//*[@id='direct-owners']  //*[@class='ng-scope highlight']";
    private By direct_owners_not_highlighted_xpath = By.xpath("//*[@id='direct-owners'] //tbody[@class='ng-scope']");
    private By direct_owners_rows_xpath = By.xpath("//*[@id='direct-owners'] //tbody");
    private String direct_owners_row_for_country_xpath = "//*[td='";
    private By direct_owners_country_highlight_list_text_xpath = By.xpath("//*[@id='content-filters'] //div[h2='Highlight']/ul/li");
    private By ubo_header_text_xpath = By.xpath("//*[@id='content-view']/div[2]/div[1]/div/h1");
    private By ubo_name_header_text_xpath = By.xpath("//*[@id='ubo'] /thead/tr/th[1]");
    private By ubo_entity_header_text_xpath = By.xpath("//*[@id='ubo'] /thead/tr/th[2]");
    private By ubo_percentage_header_text_xpath = By.xpath("//*[@id='ubo'] /thead/tr/th[3]");
    private By ubo_date_header_text_xpath = By.xpath("//*[@id='ubo'] /thead/tr/th[4]");
    private By ubo_source_header_text_xpath = By.xpath("//*[@id='ubo'] /thead/tr/th[5]");
    private By ubo_name_text_xpath = By.xpath("//*[@id='ubo'] /tbody/tr[1]/td[1]");
    private By ubo_entity_name_text_xpath = By.xpath("//*[@id='ubo'] /tbody/tr[1]/td[2]");
    private By ubo_percentage_owned_text_xpath = By.xpath("//*[@id='ubo'] /tbody/tr[1]/td[3]");
    private By ubo_date_text_xpath = By.xpath("//*[@id='ubo'] /tbody/tr[1]/td[4]");
    private By ubo_source_text_xpath = By.xpath("//*[@id='ubo'] /tbody/tr[1]/td[5]");
    private By no_ubo_section_xpath = By.xpath("//div[@product='UBO'][@style=\"display: none;\"]");
    private By no_ubo_msg_text_xpath = By.xpath("//*[@id='content-view']/div[2]/div[1]/div[2]/p");
    private By in_product_msg_text_xpath = By.xpath("//p[@class='subscribe attention']");
    private By ubo_declaration_document_link_text_xpath =By.xpath("//div[2]/div/a");
    private By spinner_css = By.cssSelector("div.kyc-loading-widget.loader");

    Set<String> eCountryHighlightList = new TreeSet<>();

    public OwnersPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnOwnersTab(){
        assertEquals("Owners", getWebElementText(owners_tab_xpath));
        clickOnWebElement(owners_tab_xpath);
    }

    public void dVerifyDirectOwnersList() {
        eCountryHighlightList.clear();
        waitForWebElementToAppear(direct_owners_entity_name_text_xpath);
        verifyDirectOwnersHeaders();
        Document eDirectOwnersList = httpRequest().getResultsFormDataBase(DIRECT_OWNERS_LIST, nvPairs);
        List<WebElement> aDirectOwnerEntityName = getWebElements(direct_owners_entity_name_text_xpath);
        List<WebElement> aDirectOwnersCountryName = getWebElements(direct_owners_country_name_text_xpath);
        List<WebElement> aDirectOwnersPercentageOwned = getWebElements(direct_owners_percentage_owned_text_xpath);
        List<WebElement> aDirectOwnersLastValidatedDate = getWebElements(direct_owners_date_text_xpath);
        List<WebElement> aDirectOwnersSource = getWebElements(direct_owners_source_text_xpath);
        assertEquals("Direct owners count mismatch", eDirectOwnersList.getElementsByTagName("entityName").getLength(), aDirectOwnerEntityName.size());

        for(int i=0; i<aDirectOwnerEntityName.size(); i++) {
            assertEquals("Legal title does not match at" + i, eDirectOwnersList.getElementsByTagName("entityName").item(i).getTextContent(), aDirectOwnerEntityName.get(i).getText());
            assertEquals("Country name does not match at" + i, eDirectOwnersList.getElementsByTagName("countryOfOperations").item(i).getTextContent(),aDirectOwnersCountryName.get(i).getText());
            eCountryHighlightList.add(eDirectOwnersList.getElementsByTagName("countryOfOperations").item(i).getTextContent());
            if(!eDirectOwnersList.getElementsByTagName("percentOwnership").item(i).getTextContent().isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, eDirectOwnersList.getElementsByTagName("percentOwnership").item(i).getTextContent() + "%", aDirectOwnersPercentageOwned.get(i).getText());
            }
            assertEquals("Validated date does not match at" + i, eDirectOwnersList.getElementsByTagName("lastValidatedDate").item(i).getTextContent(), aDirectOwnersLastValidatedDate.get(i).getText());
            assertEquals("Source does not match at" + i, eDirectOwnersList.getElementsByTagName("displaySource").item(i).getTextContent(), aDirectOwnersSource.get(i).getText());
        }
    }

    public void verifyDirectOwnersHeaders(){
        waitForWebElementToAppear(direct_owners_name_header_text_xpath);
        /* BUG - KYC-310*/
        assertEquals("Direct Owners", getWebElementText(direct_owners_header_text_xpath));
        assertEquals("NAME",getWebElementText(direct_owners_name_header_text_xpath));
        assertEquals("COUNTRY",getWebElementText(direct_owners_country_header_text_xpath));
        assertEquals("%",getWebElementText(direct_owners_percentage_header_text_xpath));
        assertEquals("DATE",getWebElementText(direct_owners_date_header_text_xpath));
        assertEquals("SOURCE",getWebElementText(direct_owners_source_header_text_xpath));
    }

    public void verifyUBOHeaders(){
        assertEquals("Ultimate Beneficial Owners", getWebElementText(ubo_header_text_xpath));
        assertEquals("NAME",getWebElementText(ubo_name_header_text_xpath));
        assertEquals("ENTITY",getWebElementText(ubo_entity_header_text_xpath));
        assertEquals("%",getWebElementText(ubo_percentage_header_text_xpath));
        assertEquals("DATE",getWebElementText(ubo_date_header_text_xpath));
        assertEquals("SOURCE",getWebElementText(ubo_source_header_text_xpath));
    }

    public void verifyNoDirectOwnersMsg() {
        waitForWebElementToAppear(no_direct_owners_msg_text_xpath);
        assertEquals("No known entities.", getWebElementText(no_direct_owners_msg_text_xpath));
    }

    public void sVerifyDirectOwnersList(ExamplesTable directOwnersListExamTable) {
        waitForWebElementToAppear(direct_owners_entity_name_text_xpath);
        verifyDirectOwnersHeaders();
        List<WebElement> aDirectOwnerEntityName = getWebElements(direct_owners_entity_name_text_xpath);
        List<WebElement> aDirectOwnersCountryName = getWebElements(direct_owners_country_name_text_xpath);
        List<WebElement> aDirectOwnersPercentageOwned = getWebElements(direct_owners_percentage_owned_text_xpath);
        List<WebElement> aDirectOwnersLastValidatedDate = getWebElements(direct_owners_date_text_xpath);
        List<WebElement> aDirectOwnersSource = getWebElements(direct_owners_source_text_xpath);
        for(int i=0; i<aDirectOwnersCountryName.size(); i++) {
            assertEquals("Legal title does not match at" + i, directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(0)), aDirectOwnerEntityName.get(i).getText());
            assertEquals("Country name does not match at" + i, directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(1)), aDirectOwnersCountryName.get(i).getText());
            if(!directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(2)) + "%", aDirectOwnersPercentageOwned.get(i).getText());
            }
            assertEquals("Validated date does not match at" + i, directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(3)), aDirectOwnersLastValidatedDate.get(i).getText());
            assertEquals("Source does not match at" + i, directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(4)), aDirectOwnersSource.get(i).getText());
        }
    }

    public void verifyNoPercentageMeterBar() {
        assertTrue(isWebElementDisplayed(direct_owners_no_percentage_meter_bar_xpath ));
    }

    public void verifyPercentageMeterBar() {
        waitForWebElementToAppear(direct_owners_percentage_owned_text_xpath);
        List<WebElement> aDirectOwnersPercentageOwned = getWebElements(direct_owners_percentage_owned_text_xpath);
        List<String> meterStyleValue = getWebElementsAttributeValue(direct_owners_percentage_meter_bar_xpath, "style");
        List<String> meterTitleValue = getWebElementsAttributeValue(direct_owners_percentage_meter_bar_xpath, "title");

        for(int i=0; i<aDirectOwnersPercentageOwned.size(); i++){
            assertEquals("width: "+aDirectOwnersPercentageOwned.get(i).getText(), meterStyleValue.get(i).replace(";",""));
            assertEquals(aDirectOwnersPercentageOwned.get(i).getText(), meterTitleValue.get(i));
        }
    }

    public void dVerifyDirectOwnersListForSelectedPercentFilter() {
        dVerifyDirectOwnersList();
    }

    public void verifyDirectOwnersAreHighlighted() {
        /* Compare size of all the direct owners highlighted for the county with all the direct owners for the country */
        assertEquals(
                getWebElements(By.xpath(direct_owners_highlighted_xpath + "[td='" + selectedCountryHighlight + "']")).size(),
                getWebElements(By.xpath(direct_owners_row_for_country_xpath + selectedCountryHighlight + "']")).size());

        /* Compare size of all the direct owners highlighted with all the direct owners for the country */
        assertEquals(
                getWebElements(By.xpath(direct_owners_highlighted_xpath)).size(),
                getWebElements(By.xpath(direct_owners_row_for_country_xpath + selectedCountryHighlight + "']")).size());
    }

    public void verifyDirectOwnersAreNotHighlighted() {
        assertEquals(getWebElements(direct_owners_not_highlighted_xpath).size(), getWebElements(direct_owners_rows_xpath).size());
    }

    public void dVerifyCountryHighlightList() {
        waitForPageToLoad(15000L);
        List<String> aCountryHighlightList = getWebElementsText(direct_owners_country_highlight_list_text_xpath);
        Iterator eIterator = eCountryHighlightList.iterator();
        Iterator aIterator = aCountryHighlightList.iterator();
        while (eIterator.hasNext()){
            assertEquals(eIterator.next(),aIterator.next());
        }
    }

    public void verifyCountryHighlightListNotExists() {
        waitForPageToLoad(15000L);
        assertFalse(isWebElementDisplayed(direct_owners_country_highlight_list_text_xpath));
    }

    public void clickOnLegalTitleInDirectOwnersList(String legalTitle) {
        waitForWebElementToAppear(direct_owners_entity_name_text_xpath);
        nvPairs.add(new BasicNameValuePair("name", legalTitle));
        for(org.apache.http.NameValuePair nameValuePair : nvPairs) {
            if("fid".equals(nameValuePair.getName())) {
                nvPairs.remove(nameValuePair);
            }
        }
        clickOnWebElement(By.linkText(legalTitle));
        waitForInMilliSeconds(3000L);
    }

    public void openLegalTitleInDirectOwnersListInNewWindow(String legalTitle) {
        waitForPageToLoad(15000L);
        nvPairs.add(new BasicNameValuePair("name", legalTitle));
        httpRequest().removeNameValuePair("fid");
        openLinkInNewWindow(By.linkText(legalTitle));
    }

    public void dVerifyFreeTextInDirectOwnersList(){
        waitForWebElementToAppear(direct_owners_entity_free_text_xpath);
        verifyDirectOwnersHeaders();
        Document eDirectOwnersList = httpRequest().getResultsFormDataBase(DIRECT_OWNERS_LIST, nvPairs);
        String aDirectOwnerFreeText = getWebElementText(direct_owners_entity_free_text_xpath);
        assertEquals(eDirectOwnersList.getElementsByTagName("freeTextEntity").item(0).getTextContent().replace("%",""), aDirectOwnerFreeText.replace("%",""));
    }

    public void sVerifyFreeTextInDirectOwnersList(String directOwnerFreeText) {
        waitForWebElementToAppear(direct_owners_entity_free_text_xpath);
        verifyDirectOwnersHeaders();
        String aDirectOwnerFreeText = getWebElementText(direct_owners_entity_free_text_xpath);
        assertEquals(directOwnerFreeText, aDirectOwnerFreeText.replace("%",""));
    }

    public void sVerifyNoFreeTextInDirectOwnersList() {
        verifyDirectOwnersHeaders();
        assertFalse(isWebElementDisplayed(direct_owners_entity_free_text_xpath));
    }

    public void eCaptureOwnersPage(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/e"+ nodeTitle.replace(" ","") + "OwnersPage.png");
    }

    public void aCaptureOwnersPage(String nodeTitle) {
        takeSnapshot("./src/test/resources/actual/a" + nodeTitle.replace(" ","") + "OwnersPage.png");
    }

    public void compareSnapshotsForOwners(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/e" + nodeTitle.replace(" ","") + "OwnersPage.png",
                        readProperties().getTestResourcePath() + "/actual/a" + nodeTitle.replace(" ","") + "OwnersPage.png",
                        readProperties().getTestResourcePath() + "/difference/d" + nodeTitle.replace(" ","") + "OwnersPage.png"));
    }

    public void sVerifyUBOList(ExamplesTable uboListExamTable) {
        //waitForWebElementToAppear(ubo_name_text_xpath);
        waitForInMilliSeconds(3000L);
        verifyUBOHeaders();
        List<WebElement> aUBOName = getWebElements(ubo_name_text_xpath);
        List<WebElement> aUBOEntityName = getWebElements(ubo_entity_name_text_xpath);
        List<WebElement> aUBOPercentageOwned = getWebElements(ubo_percentage_owned_text_xpath);
        List<WebElement> aUBOLastValidatedDate = getWebElements(ubo_date_text_xpath);
        List<WebElement> aUBOSource = getWebElements(ubo_source_text_xpath);
        for(int i=0; i<aUBOName.size(); i++) {
            assertEquals("UBO Name does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(0)), aUBOName.get(i).getText());
            assertEquals("UBO Entity Name does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(1)), aUBOEntityName.get(i).getText());
            if(!uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(2)) + "%", aUBOPercentageOwned.get(i).getText());
            }
            assertEquals("Validated date does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(3)), aUBOLastValidatedDate.get(i).getText());
            assertEquals("Source does not match at" + i, uboListExamTable.getRow(i).get(uboListExamTable.getHeaders().get(4)), aUBOSource.get(i).getText());
        }
    }

    public void verifyNoUBOMsg() {
        waitForWebElementToAppear(no_ubo_msg_text_xpath);
        assertEquals("Ultimate Beneficial Owners", getWebElementText(ubo_header_text_xpath));
        assertEquals("No known entities.", getWebElementText(no_ubo_msg_text_xpath));
        //assertFalse(isWebElementDisplayed(in_product_msg_text_xpath));
    }

    public void verifyInProductMessage(){
        waitForInMilliSeconds(1000L);
       // assertEquals("Ultimate Beneficial Owners", getWebElementText(ubo_header_text_xpath)); /* XPaths returns 2 WebElements. Grabbing the first one */
        assertEquals("There is UBO data available for this entity. You currently do not have access to this data, please subscribe.", getWebElementText(in_product_msg_text_xpath));
    }



    public void verifySavedPDFFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {

            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/owners_summary");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "owners_summary_" + fid + ".pdf",
                                readProperties().getTestResourcePath() + "/pdfs/actual/" + "owners_summary_" + fid + ".pdf",
                                readProperties().getTestResourcePath() + "/pdfs/difference/" + "owners_summary_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifyNoUBOSection() {
        assertTrue(isWebElementDisplayed(no_ubo_section_xpath));
    }

    public void verifyNoInProductMessage() {
        //assertFalse(isWebElementDisplayed(in_product_msg_text_xpath));
        assertEquals("", getWebElementText(in_product_msg_text_xpath));
    }

    public void verifyNoUBODDRLink() {
        assertFalse(isWebElementDisplayed(ubo_declaration_document_link_text_xpath));
    }


}
