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

public class EntityDetailsPage extends PagesCommon {

    private By entityDetails_tab_xpath = By.xpath("//*[@id='content-navigation'] /ul/li[1]");
    private By entityDetails_name_text_xpath = By.xpath("//*[@id='entity-details']/h1");
    private By entityDetails_almanacid_text_xpath = By.xpath("//*[@id='entity-details']/p");
    private By entity_details_summary_header_text_xpath = By.xpath("//*[@id='content-view'] /h1[1]");
    private By entity_details_head_office_address_text_xpath = By.xpath("//*[@id='entity-head-office']/tbody/tr/td/div[1]");
    private By entityDetails_giin_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[1]/td");
    private By entity_details_facta_satus_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[2]/td");
    private By entityDetails_lei_text_xpath = By.xpath("//*[@id='entity-lei'] //*[@class='ng-binding']");
    private By entityDetails_identifiers_header_text_xpath = By.xpath("//*[@id='content-view']/h1[2]");
    private By entity_details_head_office_lable_text_xpath = By.xpath("//*[@id='entity-head-office']/tbody/tr/th");
    private By entityDetails_giin_lable_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[1]/th");
    private By entityDetails_lei_lable_text_xpath = By.xpath("//*[@id='entity-lei']/tbody/tr/th");
    private By entityDetails_facta_satus_lable_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[2]/th");
    private Document entityDetailsDocument;

    public EntityDetailsPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnEntityDetailsTab(String fid) {
        assertEquals("Entity Details", getWebElementText(entityDetails_tab_xpath));
        clickOnWebElement(entityDetails_tab_xpath);
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("fid", fid));
        entityDetailsDocument = httpRequest().getResultsFormDataBase(ENTITY_DETAILS, nvPairs);
    }

    public void verifyEntityDetailsHeader(){
        assertEquals("Entity Name does not match ", getWebElementText(entityDetails_name_text_xpath), entityDetailsDocument.getElementsByTagName("legalTitle").item(0).getTextContent());
        assertEquals("Almanac ID does not match ", getWebElementText(entityDetails_almanacid_text_xpath), entityDetailsDocument.getElementsByTagName("legalTitle").item(0).getTextContent());

    }

    public void dVerifyEntityDetailsSummary() {
        waitForWebElementToAppear(entity_details_summary_header_text_xpath);
        assertEquals("Summary header does not match ", getWebElementText(entity_details_summary_header_text_xpath), "Summary");
        verifyEntityDetailsHeader();
        dVerifyHeadOfficeAddress();
    }

    public void dVerifyHeadOfficeAddress() {
        assertEquals("Head Office", getWebElementText(entity_details_head_office_lable_text_xpath));
        assertEquals("Head Office Address does not match ", getWebElementText(entity_details_head_office_address_text_xpath), entityDetailsDocument.getElementsByTagName("headOfficeAddress").item(0).getTextContent());

    }

    public void dVerifyIdentifiers() {
        waitForWebElementToAppear(entityDetails_identifiers_header_text_xpath);
        List<WebElement> aLeiValues = getWebElements(entityDetails_lei_text_xpath);

        assertEquals("Identifiers header does not match ", getWebElementText(entityDetails_identifiers_header_text_xpath ), "Identifiers");
        assertEquals("FACTA Status does not match ", getWebElementText(entity_details_facta_satus_text_xpath), entityDetailsDocument.getElementsByTagName("FATCAStatus").item(0).getTextContent());
        assertEquals("GIIN does not match ", getWebElementText(entityDetails_giin_text_xpath), entityDetailsDocument.getElementsByTagName("GIIN").item(0).getTextContent());
        if(aLeiValues.size()==1){
            assertEquals("LEIs value does not match ", getWebElementText(entityDetails_lei_text_xpath), entityDetailsDocument.getElementsByTagName("LEIs").item(0).getTextContent());
        }else if(aLeiValues.size()>1){dVerifyMultipleLeis();}

        verifyIdentifierLables();
    }

    public void dVerifyMultipleLeis() {
        List<WebElement> aLeiValues = getWebElements(entityDetails_lei_text_xpath);
        for (int i = 0; i < aLeiValues.size(); i++) {
            assertEquals("LEI Value does not match at" + i, aLeiValues.get(i).getText(), entityDetailsDocument.getElementsByTagName("LEIs").item(i).getTextContent());
        }
    }

    public void sVerifyEntityDetails(ExamplesTable entityDetailsExamTable) {
        waitForWebElementToAppear(entity_details_summary_header_text_xpath);
        for (int i = 0; i < entityDetailsExamTable.getRowCount(); i++) {
            assertEquals("Head Office Address does not match at" + i, getWebElementText(entity_details_head_office_address_text_xpath), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(0)));
            assertEquals("GIIN does not match at" + i, getWebElementText(entityDetails_giin_text_xpath), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(1)));
            assertEquals("FACTA STATUS does not match at" + i, getWebElementText(entity_details_facta_satus_text_xpath), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(2)));
            assertEquals("LEI does not match at" + i, getWebElementText(entityDetails_lei_text_xpath), entityDetailsExamTable.getRow(i).get(entityDetailsExamTable.getHeaders().get(3)));
        }
    }

    public void verifyNoHeadOfficeAddress(){
        assertEquals("", getWebElementText(entity_details_head_office_address_text_xpath));
        assertEquals("Head Office", getWebElementText(entity_details_head_office_lable_text_xpath));
    }

    public void verifyIdentifierLables(){
        assertEquals("GIIN", getWebElementText(entityDetails_giin_lable_text_xpath));
        assertEquals("FATCA Status", getWebElementText(entityDetails_facta_satus_lable_text_xpath));
        assertEquals("LEI", getWebElementText(entityDetails_lei_lable_text_xpath));


    }



}

