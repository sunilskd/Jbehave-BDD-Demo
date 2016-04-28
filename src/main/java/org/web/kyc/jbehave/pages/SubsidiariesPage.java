package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.jbehave.pages.CommonUtils.selectedCountryHighlight;
import static org.web.kyc.xqueries.XQueryEnum.SUBSIDIARIES_LIST;

public class SubsidiariesPage extends WebDriverUtils {

    private By subsidiaries_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[3]");
    private By subsidiaries_header_text_xpath = By.xpath("//*[@id='content-view'] /div/h1");
    private By subsidiaries_entity_name_text_xpath = By.xpath("//*[@id='subsidiaries-structure'] //*[@class='entity']");
    private By subsidiaries_country_name_text_xpath = By.xpath("//*[@id='subsidiaries-structure'] //*[@class='location ng-binding']");
    private By subsidiaries_percentage_owned_text_xpath = By.xpath("//*[@id='subsidiaries-structure'] //*[@class='percentage ng-binding']");
    private By no_subsidiaries_msg_text_xpath = By.xpath("//*[@class='notification']");
    private By subsidiaries_institution_legal_title_text_xpath = By.xpath("//*[@id='content-view']/h2");
    private By subsidiaries_institution_legal_title_hidden_text_xpath = By.xpath("//*[@id='content-view']/h2[@class='ng-binding ng-hide']");
    private String subsidiaries_highlighted_xpath = "//*[@id='subsidiaries-structure']/li/div[@class='item highlight']";
    private By subsidiaries_not_highlighted_xpath = By.xpath("//*[@id='subsidiaries-structure']/li/div[@class='item']");
    private By subsidiaries_row_xpath = By.xpath("//*[@id='subsidiaries-structure']/li");
    private String subsidiaries_row_for_country_xpath = "//li/div[div[@class='location ng-binding']='";
    private By country_highlight_list_text_xpath = By.xpath("//*[@id='content-filters']/ul[2]/li");
    private By country_highlight_list_not_displayed_text_xpath = By.xpath("//*[@id='content-filters'] /h2[@class='ng-hide']");
    Set<String> eCountryHighlightList = new TreeSet<>();



    public SubsidiariesPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnSubsidiariesTab() {
        assertEquals("Subsidiaries", getWebElementText(subsidiaries_tab_xpath));
        clickOnWebElement(subsidiaries_tab_xpath);
    }

    public void dVerifySubsidiariesList() {
        eCountryHighlightList.clear();
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        Document eSubsidiariesList = httpRequest().getResultsFormDataBase(SUBSIDIARIES_LIST, nvPairs);
        List<WebElement> aSubsidiariesEntityName = getWebElements(subsidiaries_entity_name_text_xpath);
        List<WebElement> aSubsidiariesCountryName = getWebElements(subsidiaries_country_name_text_xpath);
        List<WebElement> aSubsidiariesPercentageOwned = getWebElements(subsidiaries_percentage_owned_text_xpath);
        assertEquals("Subsidiaries count mismatch", eSubsidiariesList.getElementsByTagName("entityName").getLength(),aSubsidiariesEntityName.size());
        for (int i = 0; i < aSubsidiariesEntityName.size(); i++) {
            assertEquals("Legal title does not match at" + i, eSubsidiariesList.getElementsByTagName("entityName").item(i).getTextContent(),aSubsidiariesEntityName.get(i).getText());
            assertEquals("Country name does not match at" + i, eSubsidiariesList.getElementsByTagName("countryOfOperations").item(i).getTextContent(),aSubsidiariesCountryName.get(i).getText());
            eCountryHighlightList.add(eSubsidiariesList.getElementsByTagName("countryOfOperations").item(i).getTextContent());
            if (!eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent().isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, (eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent() + "%"),aSubsidiariesPercentageOwned.get(i).getText());
            }
        }
    }

    public void verifySubsidiariesHeaders() {
        assertEquals("Subsidiaries", getWebElementText(subsidiaries_header_text_xpath));
    }

    public void verifyInstitutionLegalTitle(String institutionLegalTitle) {
        waitForWebElementToAppear(subsidiaries_institution_legal_title_text_xpath);
        assertEquals("Institution name does not match at", getWebElementText(subsidiaries_institution_legal_title_text_xpath), institutionLegalTitle);
    }

    public void verifyNoSubsidiariesMsg() {
        waitForWebElementToAppear(no_subsidiaries_msg_text_xpath);
        assertEquals("No known entities.", getWebElementText(no_subsidiaries_msg_text_xpath));
    }

    public void sVerifySubsidiariesList(ExamplesTable subsidiariesListExamTable) {
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        verifySubsidiariesHeaders();
        List<WebElement> aSubsidiariesEntityName = getWebElements(subsidiaries_entity_name_text_xpath);
        List<WebElement> aSubsidiariesCountryName = getWebElements(subsidiaries_country_name_text_xpath);
        List<WebElement> aSubsidiariesPercentageOwned = getWebElements(subsidiaries_percentage_owned_text_xpath);
        for (int i = 0; i < subsidiariesListExamTable.getRowCount(); i++) {
            assertEquals("Legal title does not match at" + i, aSubsidiariesEntityName.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(0)));
            assertEquals("Country name does not match at" + i, aSubsidiariesCountryName.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(1)));
            if (!subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, aSubsidiariesPercentageOwned.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(2)) + "%");
            }
        }
    }

    public void dVerifySubsidiariesListForPercentFilter() {
        dVerifySubsidiariesList();
    }

    public void verifyLegalTitleIsNotDisplayed() {
        assertTrue(isWebElementDisplayed(subsidiaries_institution_legal_title_hidden_text_xpath));
    }


    public void verifyDirectSubsidiariesAreHighlighted() {
        assertEquals(
                getWebElements(By.xpath(subsidiaries_highlighted_xpath + "[div[@class='location ng-binding']='" + selectedCountryHighlight + "']")).size(),
                getWebElements(By.xpath(subsidiaries_row_for_country_xpath + selectedCountryHighlight + "']")).size());
        assertEquals(
                getWebElements(By.xpath(subsidiaries_highlighted_xpath)).size(),
                getWebElements(By.xpath(subsidiaries_row_for_country_xpath + selectedCountryHighlight + "']")).size());
    }

    public void verifyDirectSubsidiariesAreNotHighlighted() {
        //assertTrue(getWebElements(By.xpath(subsidiaries_highlighted_xpath + "[div[@class='location ng-binding']='" + selectedCountryHighlight + "']")).size() == 0);
        //assertTrue(getWebElements(By.xpath(subsidiaries_highlighted_xpath)).size() == 0);

        assertEquals(getWebElements(subsidiaries_not_highlighted_xpath).size(), getWebElements(subsidiaries_row_xpath).size());
    }

    public void dVerifyCountryHighlightList() {
        waitForPageToLoad(15000L);
        List<String> aCountryHighlightList = getWebElementsText(country_highlight_list_text_xpath);
        Iterator eIterator = eCountryHighlightList.iterator();
        Iterator aIterator = aCountryHighlightList.iterator();
        while (eIterator.hasNext()){
            assertEquals(eIterator.next(),aIterator.next());
        }
    }

    public void verifyCounryListNotExists() {

        waitForPageToLoad(15000L);
        assertTrue(isWebElementDisplayed(country_highlight_list_not_displayed_text_xpath));

    }


    public void openLegalTitleInSubsidiariesListInNewWindow(String legalTitle) {
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        nvPairs.add(new BasicNameValuePair("name", legalTitle));
        for(org.apache.http.NameValuePair nameValuePair : nvPairs) {
            if("fid".equals(nameValuePair.getName())) {
                nvPairs.remove(nameValuePair);
            }
        }
        openLinkInNewWindow(By.linkText(legalTitle));
    }

    public void clickOnLegalTitleInSubsidiariesList(String legalTitle) {
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        nvPairs.add(new BasicNameValuePair("name", legalTitle));
        for(org.apache.http.NameValuePair nameValuePair : nvPairs) {
            if("fid".equals(nameValuePair.getName())) {
                nvPairs.remove(nameValuePair);
            }
        }
        clickOnWebElement(By.linkText(legalTitle));
        waitForPageToLoad(15000L);
    }

}