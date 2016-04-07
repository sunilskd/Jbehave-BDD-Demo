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
import static org.web.kyc.xqueries.XQueryEnum.SUBSIDIARIES_LIST;

/**
 * Created by singirikondas on 4/7/2016.
 */
public class SubsidiariesPage extends PagesCommon {

    private By subsidiaries_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[3]");
    private By subsidiaries_header_text_xpath = By.xpath("//*[@id='content-view'] /div/h1");
    private By last_validated_subsidiaries_header_text_xpath = By.xpath("//*[@id='content-view'] /div/p");
    private By subsidiaries_entity_name_text_xpath = By.xpath("//*[@id='subsidiaries-structure'] //*[@class='entity ng-binding']");
    private By subsidiaries_country_name_text_xpath = By.xpath("//*[@id='subsidiaries-structure'] //*[@class='location ng-binding']");
    private By subsidiaries_percentage_owned_text_xpath = By.xpath("//*[@id='subsidiaries-structure'] //*[@class='percentage ng-binding']");
    private By no_subsidiaries_msg_text_xpath = By.xpath("//*[@id='content-view']/p");


    public SubsidiariesPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnSubsidiariesTab() {
        assertEquals("Subsidiaries", getWebElementText(subsidiaries_tab_xpath));
        clickOnWebElement(subsidiaries_tab_xpath);
    }

    public void dVerifySubsidiariesList(String fid) {
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("fid", fid));
        Document eSubsidiariesList = httpRequest().getResultsFormDataBase(SUBSIDIARIES_LIST, nvPairs);
        List<WebElement> aSubsidiariesEntityName = getWebElements(subsidiaries_entity_name_text_xpath);
        List<WebElement> aSubsidiariesCountryName = getWebElements(subsidiaries_country_name_text_xpath);
        List<WebElement> aSubsidiariesPercentageOwned = getWebElements(subsidiaries_percentage_owned_text_xpath);
        assertEquals("Subsidiaries count mismatch", aSubsidiariesEntityName.size(), eSubsidiariesList.getElementsByTagName("legalTitle").getLength());
        for (int i = 0; i < aSubsidiariesEntityName.size(); i++) {
            assertEquals("Legal title does not match at" + i, aSubsidiariesEntityName.get(i).getText(), eSubsidiariesList.getElementsByTagName("legalTitle").item(i).getTextContent());
            assertEquals("Country name does not match at" + i, aSubsidiariesCountryName.get(i).getText(), eSubsidiariesList.getElementsByTagName("countryOfOperations").item(i).getTextContent());
            if(!eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent().isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, aSubsidiariesPercentageOwned.get(i).getText(), eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent() + "%");
            }
        }
    }

    public void verifySubsidiariesHeaders(){
        assertEquals("Direct Owners", getWebElementText(subsidiaries_header_text_xpath));
        assertEquals("Last Validated",getWebElementText(last_validated_subsidiaries_header_text_xpath));
    }

    public void verifyNoDirectOwnersMsg() {
        assertEquals("No data found.", getWebElementText(no_subsidiaries_msg_text_xpath));
    }

    public void sVerifySubsidiariesList(ExamplesTable subsidiariesListExamTable) {
        verifySubsidiariesHeaders();
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        List<WebElement> aSubsidiariesEntityName = getWebElements(subsidiaries_entity_name_text_xpath);
        List<WebElement> aSubsidiariesCountryName = getWebElements(subsidiaries_country_name_text_xpath);
        List<WebElement> aSubsidiariesPercentageOwned = getWebElements(subsidiaries_percentage_owned_text_xpath);
        for(int i=0; i<subsidiariesListExamTable.getRowCount(); i++){
            assertEquals("Legal title does not match at" + i, aSubsidiariesEntityName.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(0)));
            assertEquals("Country name does not match at" + i, aSubsidiariesCountryName.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(1)));
            if(!subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, aSubsidiariesPercentageOwned.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(2)) + "%");
            }
        }
    }




}