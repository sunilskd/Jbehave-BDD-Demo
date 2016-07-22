package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;
import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.comparator.Comparator.compareImages;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;
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
    private By entity_details_swift_bic_header_text_xpath = By.xpath("//*[@id='content-view']/h1[3]");
    private By entity_details_swift_bic_label_text_xpath = By.xpath("//*[@id='entity-swift-bic'] //th");
    private By entity_details_swift_bic_list_text_xpath = By.xpath("//*[@id='entity-swift-bic'] //span");
    private By entity_details_stock_exchange_list_text_xpath = By.xpath(".//*[@id='entity-regulator'] /tbody/tr[2]/td/span");
    private By entity_details_stock_exchange_label_text_xpath = By.xpath("//*[@id='entity-regulator']/tbody/tr[2]/th");
    private By entity_details_stock_and_ticker_symbol_list_text_xpath=By.xpath("//*[@id='entity-lei']/tbody/tr[2] /td/span/span[@class='ng-binding']");
    private By entity_details_stock_and_ticker_symbol_label_text_xpath=By.xpath(".//*[@id='entity-lei']/tbody/tr[2]/th");
    private By entity_details_regulators_list_text_xpath =By.xpath("//*[@id='entity-regulator']/tbody/tr[1]/td/span");
    private By entity_details_regulators_label_text_xpath =By.xpath("//*[@id='entity-regulator']/tbody/tr[1]/th");
    private By entity_details_website_text_xpath=By.xpath("//td/a");
    private By entity_details_website_label_text_xpath=By.xpath("//*[@id='entity-head-office']/tbody/tr[2]/th");
    private By entity_details_registered_office_xpath = By.xpath(".//*[@id='entity-head-office']/tbody/tr[2]/td");
    private By entity_details_registered_office_container_xpath = By.xpath(".//*[@id='entity-head-office']/tbody/tr");
    private By spinner_css = By.cssSelector("div.kyc-loading-widget.loader");
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
            assertEquals("LEI does not match at" + i, leisExamTable.getRow(i).get(leisExamTable.getHeaders().get(0)), aLeiValues.get(i).getText());
        }
    }

    public void dVerifySwiftBicList() {
        verifySwiftBicLabels();
        List<WebElement> aSwiftBicList = getWebElements(entity_details_swift_bic_list_text_xpath);
        for (int i =0; i < aSwiftBicList.size(); i++){
            assertEquals("SWIFT BIC doesn't match at " + i, entityDetailsDocument.getElementsByTagName("swiftBic").item(i).getTextContent(), aSwiftBicList.get(i).getText());
        }
    }

    public void sVerifySwiftBicList(ExamplesTable swiftBicExampleTable) {
        verifySwiftBicLabels();
        List<WebElement> aSwiftBicList = getWebElements(entity_details_swift_bic_list_text_xpath);
        for (int i =0; i < aSwiftBicList.size(); i++){
            assertEquals("SWIFT BIC doesn't match at " + i, swiftBicExampleTable.getRow(i).get(swiftBicExampleTable.getHeaders().get(0)), aSwiftBicList.get(i).getText());
        }
    }

    public void verifySwiftBicLabels(){
        assertEquals("SWIFT/BIC", getWebElementText(entity_details_swift_bic_header_text_xpath));
        assertEquals("SWIFT/BIC", getWebElementText(entity_details_swift_bic_label_text_xpath));
    }

    public void dVerifyStockExchangeInformation(){
        assertEquals("Stock Exchange", getWebElementText(entity_details_stock_exchange_label_text_xpath));
        List<WebElement> aStockExchangeList = getWebElements(entity_details_stock_exchange_list_text_xpath);
        for (int i =0; i < aStockExchangeList.size(); i++){
            assertEquals("Stock Exchange doesn't match at " + i, entityDetailsDocument.getElementsByTagName("stockExchange").item(i).getTextContent(), aStockExchangeList.get(i).getText());
        }
    }

    public void dVerifyStockAndTickerSymbol() {
        assertEquals("Stock Symbol", getWebElementText(entity_details_stock_and_ticker_symbol_label_text_xpath));
        List<WebElement> aStockAndTickerSymbolList = getWebElements(entity_details_stock_and_ticker_symbol_list_text_xpath);
        for (int i =0; i < aStockAndTickerSymbolList.size(); i++){
            assertEquals("Stock Symbol doesn't match at " + i, entityDetailsDocument.getElementsByTagName("stockSymbol").item(i).getTextContent(), aStockAndTickerSymbolList.get(i).getText());
        }
    }

    public void dVerifyRegulatorsList(){
        assertEquals("Regulator", getWebElementText(entity_details_regulators_label_text_xpath));
        List<WebElement> aRegulatorsList = getWebElements(entity_details_regulators_list_text_xpath);
        for (int i =0; i < aRegulatorsList.size(); i++){
            assertEquals("Regulator doesn't match at " + i, entityDetailsDocument.getElementsByTagName("regulator").item(i).getTextContent(), aRegulatorsList.get(i).getText());
        }
    }

    public void sVerifyStockAndTickerSymbol(ExamplesTable stockSymbolExamTable){
        List<WebElement> aStockSymbolValues = getWebElements(entity_details_stock_and_ticker_symbol_list_text_xpath);
        for (int i = 0; i < stockSymbolExamTable.getRowCount(); i++) {
            assertEquals("Stock Symbol does not match at" + i, stockSymbolExamTable.getRow(i).get(stockSymbolExamTable.getHeaders().get(0)), aStockSymbolValues.get(i).getText());
        }
    }

    public void sVerifyStockExchangeInformation(ExamplesTable stockExchangeExamTable) {
        List<WebElement> aStockExchangeValues = getWebElements(entity_details_stock_exchange_list_text_xpath);
        for (int i = 0; i < stockExchangeExamTable.getRowCount(); i++) {
            assertEquals("Stock Exchange does not match at" + i, stockExchangeExamTable.getRow(i).get(stockExchangeExamTable.getHeaders().get(0)), aStockExchangeValues.get(i).getText());
        }
    }

    public void sVerifyRegulators(ExamplesTable regulatorsExamTable) {
        List<WebElement> aRegulatorsValues = getWebElements(entity_details_regulators_list_text_xpath);
        for (int i = 0; i < regulatorsExamTable.getRowCount(); i++) {
            assertEquals("Regulator does not match at" + i, regulatorsExamTable.getRow(i).get(regulatorsExamTable.getHeaders().get(0)), aRegulatorsValues.get(i).getText());
        }
    }

    public void eCaptureEntityDetailsPage(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/e" + nodeTitle.replace(" ","") + "EntityDetails.png");
    }

    public void aCaptureEntityDetailsPage(String nodeTitle) {
        refreshCurrentPage();
        takeSnapshot("./src/test/resources/actual/a" + nodeTitle.replace(" ","") + "EntityDetails.png");
    }

    public void compareSnapshotsForEntityDetails(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(
                        readProperties().getTestResourcePath() + "/expected/e" + nodeTitle.replace(" ","") + "EntityDetails.png",
                        readProperties().getTestResourcePath() + "/actual/a" + nodeTitle.replace(" ","") + "EntityDetails.png",
                        readProperties().getTestResourcePath() + "/difference/d" + nodeTitle.replace(" ","") + "EntityDetails.png"));
    }

    public void dVerifyWebsiteInfo() {
        assertEquals(entityDetailsDocument.getElementsByTagName("website").item(0).getTextContent(),getWebElementText(entity_details_website_text_xpath));
        assertEquals("Website" ,getWebElementText(entity_details_website_label_text_xpath));
    }

    public void sVerifyWebsiteInfo(String website) {
        assertEquals(website,getWebElementText(entity_details_website_text_xpath));
        assertEquals("Website" ,getWebElementText(entity_details_website_label_text_xpath));
    }

    public void verifyRegisteredOffice(){
        assertEquals(entityDetailsDocument.getElementsByTagName("registeredOffice").item(0).getTextContent().replace(", ",","),getWebElementText(entity_details_registered_office_xpath).replace("\n","").replace(", ",","));
        List<WebElement> trContainer = findElements(entity_details_registered_office_container_xpath);
        String registeredOfficeLabel = trContainer.get(1).findElement(By.tagName("th")).getText();
        assertEquals(registeredOfficeLabel,"Registered Office");

    }

    public void verifyRegisteredOfficeNotDisplayed(){
       if(entityDetailsDocument.getElementsByTagName("registeredOffice").item(0).getTextContent().replace(", ",",").equals("")){
        List<WebElement> container= findElements(entity_details_registered_office_container_xpath);
        assertTrue(container.size()==2);

    }
    }

}