package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;
import static org.web.kyc.xqueries.XQueryEnum.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class OwnersPage extends PagesCommon {

    private By owners_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[2]");
    private By direct_owners_header_text_xpath = By.xpath("//*[@class='heading-bar'][1]/h1");
    private By last_validated_header_text_xpath = By.xpath("//*[@class='heading-bar'][1]/p");
    private By direct_owners_entity_name_text_xpath = By.xpath("//*[@id='direct-owners-list'] //*[@class='entity']");
    private By direct_owners_country_name_text_xpath = By.xpath("//*[@id='direct-owners-list'] //*[@class='location ng-binding']");
    private By direct_owners_percentage_owned_text_xpath = By.xpath("//*[@id='direct-owners-list'] //*[@class='ownership ng-binding']");
    private By direct_owners_last_validated_date_text_xpath = By.xpath("//*[@id='direct-owners-list'] //*[@class='validation ng-binding']");
    private By no_direct_owners_msg_text_xpath = By.xpath("//*[@id='direct-owners-list']/li");

    public OwnersPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnOwnersTab(){
        assertEquals("Owners", getWebElementText(owners_tab_xpath));
        clickOnWebElement(owners_tab_xpath);
    }

    public void dVerifyDirectOwnersList(String fid) {
        verifyDirectOwnersHeaders();
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("fid", fid));
        nvPairs.add(new BasicNameValuePair("listType", "direct owners"));
        Document eDirectOwnersList = httpRequest().getResultsFormDataBase(DIRECT_OWNERS_LIST, nvPairs);
        List<WebElement> aDirectOwnerEntityName = getWebElements(direct_owners_entity_name_text_xpath);
        List<WebElement> aDirectOwnersCountryName = getWebElements(direct_owners_country_name_text_xpath);
        List<WebElement> aDirectOwnersPercentageOwned = getWebElements(direct_owners_percentage_owned_text_xpath);
        List<WebElement> aDirectOwnersLastValidatedDate = getWebElements(direct_owners_last_validated_date_text_xpath);
        assertEquals("Direct owners count mismatch", aDirectOwnerEntityName.size(), eDirectOwnersList.getElementsByTagName("legalTitle").getLength());
        for(int i=0; i<aDirectOwnerEntityName.size(); i++){
            assertEquals("Legal title does not match at" + i, aDirectOwnerEntityName.get(i).getText(), eDirectOwnersList.getElementsByTagName("legalTitle").item(i).getTextContent());
            assertEquals("Country name does not match at" + i, aDirectOwnersCountryName.get(i).getText(), eDirectOwnersList.getElementsByTagName("countryOfOperations").item(i).getTextContent());
            assertEquals("Percentage owned does not match at" + i, aDirectOwnersPercentageOwned.get(i).getText(), eDirectOwnersList.getElementsByTagName("percentOwnership").item(i).getTextContent());
            assertEquals("Validated date does not match at" + i, aDirectOwnersLastValidatedDate.get(i).getText(), eDirectOwnersList.getElementsByTagName("lastValidatedDate").item(i).getTextContent());
        }
    }

    public void verifyDirectOwnersHeaders(){
        assertEquals("Direct Owners", getWebElementText(direct_owners_header_text_xpath));
        assertEquals("Last Validated",getWebElementText(last_validated_header_text_xpath));
    }

    public void verifyNoDirectOwnersMsg() {
        assertEquals("No data found.", getWebElementText(no_direct_owners_msg_text_xpath));
    }

    public void sVerifyDirectOwnersList(ExamplesTable directOwnersListExamTable) {
        verifyDirectOwnersHeaders();
        waitForElementToAppear(direct_owners_entity_name_text_xpath);
        List<WebElement> aDirectOwnerEntityName = getWebElements(direct_owners_entity_name_text_xpath);
        List<WebElement> aDirectOwnersCountryName = getWebElements(direct_owners_country_name_text_xpath);
        List<WebElement> aDirectOwnersPercentageOwned = getWebElements(direct_owners_percentage_owned_text_xpath);
        List<WebElement> aDirectOwnersLastValidatedDate = getWebElements(direct_owners_last_validated_date_text_xpath);
        for(int i=0; i<directOwnersListExamTable.getRowCount(); i++){
            assertEquals("Legal title does not match at" + i, aDirectOwnerEntityName.get(i).getText(), directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(0)));
            assertEquals("Country name does not match at" + i, aDirectOwnersCountryName.get(i).getText(), directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(1)));
            assertEquals("Percentage owned does not match at" + i, aDirectOwnersPercentageOwned.get(i).getText(), directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(2)));
            assertEquals("Validated date does not match at" + i, aDirectOwnersLastValidatedDate.get(i).getText(), directOwnersListExamTable.getRow(i).get(directOwnersListExamTable.getHeaders().get(3)));
        }
    }

}
