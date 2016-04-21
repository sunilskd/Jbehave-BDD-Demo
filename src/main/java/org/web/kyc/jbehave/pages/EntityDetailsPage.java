package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;
import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.web.kyc.xqueries.XQueryEnum.ENTITY_DETAILS;

public class EntityDetailsPage extends WebDriverUtils {

    private By entity_details_tab_xpath = By.xpath("//*[@id='content-navigation'] //li[1]");
    private By entity_details_name_text_xpath = By.xpath("//*[@id='entity-details']/h1");
    private By entity_details_almanac_id_text_xpath = By.xpath("//*[@id='entity-details']/p");
    private By entity_details_summary_header_text_xpath = By.xpath("//*[@id='content-view'] /h1[1]");
    private By entity_details_head_office_address_text_xpath = By.xpath("//*[@id='entity-head-office']/tbody/tr/td");
    private By entity_details_giin_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[1]/td");
    private By entity_details_fatca_status_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[2]/td");
    private By entity_details_lei_text_xpath = By.xpath("//*[@id='entity-lei'] //*[@class='ng-binding ng-scope']");
    private By entity_details_identifiers_header_text_xpath = By.xpath("//*[@id='content-view']/h1[2]");
    private By entity_details_head_office_label_text_xpath = By.xpath("//*[@id='entity-head-office']/tbody/tr/th");
    private By entity_details_giin_label_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[1]/th");
    private By entity_details_lei_label_text_xpath = By.xpath("//*[@id='entity-lei']/tbody/tr/th");
    private By entity_details_fatca_status_label_text_xpath = By.xpath("//*[@id='entity-identifiers']/tbody/tr[2]/th");
    private Document entityDetailsDocument;

    public EntityDetailsPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnEntityDetailsTab() {
        waitForWebElementToAppear(entity_details_tab_xpath);
        assertEquals("Entity Details", getWebElementText(entity_details_tab_xpath));
        clickOnWebElement(entity_details_tab_xpath);
        entityDetailsDocument = httpRequest().getResultsFormDataBase(ENTITY_DETAILS, nvPairs);
    }

    public void dVerifyEntityDetailsHeader() {
        assertEquals(entityDetailsDocument.getElementsByTagName("legalTitle").item(0).getTextContent(),getWebElementText(entity_details_name_text_xpath));
        assertEquals("Bankersalmanac.com ID: " + entityDetailsDocument.getElementsByTagName("bankersAlmanacID").item(0).getTextContent(),(getWebElementText(entity_details_almanac_id_text_xpath)));
    }

    public void dVerifyEntityDetailsSummary() {
        waitForWebElementToAppear(entity_details_summary_header_text_xpath);
        assertEquals("Summary",getWebElementText(entity_details_summary_header_text_xpath));
        dVerifyHeadOfficeAddress();
    }

    public void dVerifyHeadOfficeAddress() {
        assertEquals("Head Office", getWebElementText(entity_details_head_office_label_text_xpath));
        assertEquals(entityDetailsDocument.getElementsByTagName("headOfficeAddress").item(0).getTextContent().replace(", ",","),getWebElementText(entity_details_head_office_address_text_xpath).replace("\n","").replace(", ",","));
    }

    public void dVerifyIdentifiers() {
        verifyIdentifierLabels();
        List<WebElement> aLeiValues = getWebElements(entity_details_lei_text_xpath);
        assertEquals("Identifiers",getWebElementText(entity_details_identifiers_header_text_xpath));
        assertEquals(entityDetailsDocument.getElementsByTagName("FATCAStatus").item(0).getTextContent(),getWebElementText(entity_details_fatca_status_text_xpath));
        assertEquals(entityDetailsDocument.getElementsByTagName("GIIN").item(0).getTextContent(),getWebElementText(entity_details_giin_text_xpath));
        for (int i = 0; i < aLeiValues.size(); i++) {
            assertEquals("LEI Value does not match at" + i, entityDetailsDocument.getElementsByTagName("LEIIssuer").item(i).getTextContent()+ " "
                    + entityDetailsDocument.getElementsByTagName("LEIValue").item(i).getTextContent(), aLeiValues.get(i).getText());
        }
    }

    public void verifyIdentifierLabels() {
        assertEquals("GIIN", getWebElementText(entity_details_giin_label_text_xpath));
        assertEquals("FATCA Status", getWebElementText(entity_details_fatca_status_label_text_xpath));
        assertEquals("LEI", getWebElementText(entity_details_lei_label_text_xpath));
    }

    public void sVerifyEntityDetailsHeader(String legalTitle,String bankersAlmanacId){
        assertEquals(legalTitle, getWebElementText(entity_details_name_text_xpath));
        assertEquals(bankersAlmanacId, getWebElementText(entity_details_almanac_id_text_xpath));

    }

    public void sVerifyHeadOfficeAddress(String headOfficeAddress) {
        assertEquals(headOfficeAddress, getWebElementText(entity_details_head_office_address_text_xpath).replace("\n", "").replace(", ", ","));

    }

    public void sVerifyGiinAndFatcaStatus(String giin, String fatcaStatus) {
        assertEquals(giin, getWebElementText(entity_details_giin_text_xpath));
        assertEquals(fatcaStatus, getWebElementText(entity_details_fatca_status_text_xpath));

    }

    public void sVerifyLeis(ExamplesTable leisExamTable) {
        List<WebElement> aLeiValues = getWebElements(entity_details_lei_text_xpath);
        for (int i = 0; i < leisExamTable.getRowCount(); i++) {
            assertEquals("LEI does not match at" + i, aLeiValues.get(i).getText(), leisExamTable.getRow(i).get(leisExamTable.getHeaders().get(0)));

        }

    }

}


