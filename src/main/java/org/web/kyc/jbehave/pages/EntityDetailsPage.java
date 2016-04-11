package org.web.kyc.jbehave.pages;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.web.kyc.xqueries.XQueryEnum.ENTITY_DETAILS;

/**
 * Created by singirikondas on 4/7/2016.
 */
public class EntityDetailsPage extends PagesCommon {

    private By entityDetails_tab_xpath = By.xpath("//*[@id='content-navigation'] /ul/li[1]");
    private By entityDetails_name = By.xpath("//*[@id='entity-details']/h1");
    private By entityDetails_almanacid = By.xpath("//*[@id='entity-details']/p");
    private By entityDetails_summary_header_text_xpath = By.xpath("//*[@id='content-view'] /h1[1]");
    private By entityDetails_headoffice_address = By.xpath("//*[@id='entity-head-office']/tbody/tr/td/div[1]");
    private By entityDetails_giin = By.xpath("//*[@id='entity-identifiers']/tbody/tr[1]/td");
    private By entityDetails_facta_satus = By.xpath("//*[@id='entity-identifiers']/tbody/tr[2]/td");
    private By entityDetails_lei = By.xpath("//*[@id='entity-lei']/tbody/tr[1]/td");
    private By entityDetails_identifiers_header_text_xpath = By.xpath("//*[@id='content-view']/h1[2]");
    private By entityDetails_headoffice_lable = By.xpath("//*[@id='entity-head-office']/tbody/tr/th");
    private By entityDetails_giin_lable = By.xpath("//*[@id='entity-identifiers']/tbody/tr[1]/th");
    private By entityDetails_lei_lable = By.xpath("//*[@id='entity-lei']/tbody/tr/th");
    private By entityDetails_facta_satus_lable = By.xpath("//*[@id='entity-identifiers']/tbody/tr[2]/th");

    public EntityDetailsPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnEntityDetailsTab() {
        assertEquals("Entity Details", getWebElementText(entityDetails_tab_xpath));
        clickOnWebElement(entityDetails_tab_xpath);
    }

    public void dVerifyHeadOfficeAddress(String fid) {
        waitForWebElementToAppear(entityDetails_summary_header_text_xpath);
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("fid", fid));
        Document eEntityDetails = httpRequest().getResultsFormDataBase(ENTITY_DETAILS, nvPairs);
        WebElement aEntityHeadOfficeAddress = (WebElement) getWebElements(entityDetails_headoffice_address);
        WebElement aEntityName = (WebElement) getWebElements(entityDetails_name);
        WebElement aEntityAlmanacId = (WebElement) getWebElements(entityDetails_almanacid);
        WebElement aEntityGiin = (WebElement) getWebElements(entityDetails_giin);
        WebElement aSummaryHeader = (WebElement) getWebElements(entityDetails_summary_header_text_xpath);
        WebElement aIdentifiersHeader = (WebElement) getWebElements(entityDetails_identifiers_header_text_xpath);

        assertEquals("Entity Name does not match ", aEntityName.getText(), eEntityDetails.getElementsByTagName("legalTitle").item(0).getTextContent());
        assertEquals("Almanac ID does not match ", aEntityAlmanacId.getText(), eEntityDetails.getElementsByTagName("bankersAlmanacID").item(0).getTextContent());
        assertEquals("Summary header does not match ", aSummaryHeader.getText(), "Summary");
        assertEquals("Headoffice Address does not match ", aEntityHeadOfficeAddress.getText(), eEntityDetails.getElementsByTagName("headOfficeAddress").item(0).getTextContent());
        assertEquals("Identifiers header does not match ", aIdentifiersHeader.getText(), "Identifiers");
        assertEquals("GIIN does not match ", aEntityGiin.getText(), eEntityDetails.getElementsByTagName("GIIN").item(0).getTextContent());

    }

    public void dVerifyLeiAndFactaStatus(String fid) {
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("fid", fid));
        Document eEntityDetails = httpRequest().getResultsFormDataBase(ENTITY_DETAILS, nvPairs);
        WebElement aFactaStatus = (WebElement) getWebElements(entityDetails_facta_satus);
        WebElement aLeis = (WebElement) getWebElements(entityDetails_lei);
        assertEquals("FACTA Status does not match ", aFactaStatus.getText(), eEntityDetails.getElementsByTagName("FATCAStatus").item(0).getTextContent());
        assertEquals("LEIs value does not match ", aLeis.getText(), eEntityDetails.getElementsByTagName("LEIs").item(0).getTextContent());

    }

    public void dVerifyMultipleLeis(String fid) {
        //
    }

    public void sVerifyHeadOfficeAddress(ExamplesTable entityDetailsExamTable) {
        waitForWebElementToAppear(entityDetails_summary_header_text_xpath);
        WebElement aEntityHeadOfficeAddress = (WebElement) getWebElements(entityDetails_headoffice_address);
        WebElement aEntityGiin = (WebElement) getWebElements(entityDetails_giin);
        WebElement aFactaStatus = (WebElement) getWebElements(entityDetails_facta_satus);
        for (int i = 0; i < entityDetailsExamTable.getRowCount(); i++) {
            assertEquals("Head Office Address does not match at" + i, aEntityHeadOfficeAddress.getText(), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(0)));
            assertEquals("GIIN does not match at" + i, aEntityGiin.getText(), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(1)));
            assertEquals("FACTA STATUS does not match at" + i, aFactaStatus.getText(), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(2)));
        }
    }

    public void verifyNoHeadOfficeAddress(){
        assertEquals("", getWebElementText(entityDetails_headoffice_address));
        assertEquals("Head Office", getWebElementText(entityDetails_headoffice_lable));
    }

    public void verifyIdentifierLables(){
        assertEquals("GIIN", getWebElementText(entityDetails_giin_lable));
        assertEquals("FATCA Status", getWebElementText(entityDetails_facta_satus_lable));
        assertEquals("LEI", getWebElementText(entityDetails_lei_lable));

    }

}

