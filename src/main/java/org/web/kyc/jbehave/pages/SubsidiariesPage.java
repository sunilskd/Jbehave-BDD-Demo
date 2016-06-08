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

import static org.junit.Assert.*;
import static org.web.kyc.comparator.Comparator.compareImages;
import static org.web.kyc.jbehave.pages.CommonUtils.selectedCountryHighlight;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;
import static org.web.kyc.xqueries.XQueryEnum.SUBSIDIARIES_LIST;

public class SubsidiariesPage extends WebDriverUtils {

    private By subsidiaries_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[3]");
    private By subsidiaries_header_text_xpath = By.xpath(".//*[@id='content-view'] /h1");
    private By subsidiaries_entity_name_header_text_xpath = By.xpath("//*[@id='subsidiaries']/thead/tr/th[1]");
    private By subsidiaries_country_header_text_xpath = By.xpath("//*[@id='subsidiaries']/thead/tr/th[2]");
    private By subsidiaries_percentage_header_text_xpath = By.xpath("//*[@id='subsidiaries']/thead/tr/th[3]");
    private By subsidiaries_date_header_text_xpath = By.xpath("//*[@id='subsidiaries']/thead/tr/th[4]");
    private By subsidiaries_entity_name_text_xpath = By.xpath("//*[@id='subsidiaries']/tbody[@class='ng-scope']/tr[1]/td[1]");
    private By subsidiaries_country_name_text_xpath = By.xpath("//*[@id='subsidiaries']/tbody[@class='ng-scope']/tr[1]/td[2]");
    private By subsidiaries_percentage_owned_text_xpath = By.xpath("//*[@id='subsidiaries']/tbody[@class='ng-scope']/tr[1]/td[3]");
    private By subsidiaries_validated_date_text_xpath = By.xpath("//*[@id='subsidiaries']/tbody[@class='ng-scope']/tr[1]/td[4]");
    private By no_subsidiaries_msg_text_xpath = By.xpath("//*[@class='notification']");
    private String subsidiaries_highlighted_xpath = "//*[@id='subsidiaries']//tr[@class='highlight']";
    private String subsidiaries_row_for_country_xpath = "//*[@id='subsidiaries']/tbody[@class='ng-scope']//*[td='";
    private By subsidiaries_country_highlight_list_text_xpath = By.xpath("//*[@id='content-filters'] //div[h2='Highlight']/ul/li");
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
        List<WebElement> aSubsidiariesValidatedDate = getWebElements(subsidiaries_validated_date_text_xpath);
        assertEquals("Subsidiaries count mismatch", eSubsidiariesList.getElementsByTagName("entityName").getLength(), aSubsidiariesEntityName.size());

        for (int i = 0; i < aSubsidiariesEntityName.size(); i++) {
            assertEquals("Legal title does not match at" + i, eSubsidiariesList.getElementsByTagName("entityName").item(i).getTextContent(), aSubsidiariesEntityName.get(i).getText());
            assertEquals("Country name does not match at" + i, eSubsidiariesList.getElementsByTagName("countryOfOperations").item(i).getTextContent(), aSubsidiariesCountryName.get(i).getText());
            eCountryHighlightList.add(eSubsidiariesList.getElementsByTagName("countryOfOperations").item(i).getTextContent());
            if (!eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent().isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, (eSubsidiariesList.getElementsByTagName("percentOwnership").item(i).getTextContent() + "%"), aSubsidiariesPercentageOwned.get(i).getText());
            }
            assertEquals("Validate Date does not match at" + i, eSubsidiariesList.getElementsByTagName("lastValidatedDate").item(i).getTextContent(),aSubsidiariesValidatedDate.get(i).getText());
        }
    }

    public void verifySubsidiariesHeaders() {
        assertEquals("Subsidiaries and Affiliated Companies", getWebElementText(subsidiaries_header_text_xpath));
        assertEquals("NAME",getWebElementText(subsidiaries_entity_name_header_text_xpath));
        assertEquals("COUNTRY",getWebElementText(subsidiaries_country_header_text_xpath));
        assertEquals("%",getWebElementText(subsidiaries_percentage_header_text_xpath));
        assertEquals("DATE",getWebElementText(subsidiaries_date_header_text_xpath));
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
        List<WebElement> aSubsidiariesValidatedDate = getWebElements(subsidiaries_validated_date_text_xpath);
        for (int i = 0; i < subsidiariesListExamTable.getRowCount(); i++) {
            assertEquals("Legal title does not match at" + i, aSubsidiariesEntityName.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(0)));
            assertEquals("Country name does not match at" + i, aSubsidiariesCountryName.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(1)));
            if (!subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage owned does not match at" + i, aSubsidiariesPercentageOwned.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(2)) + "%");
            }
            assertEquals("Validated Date does not match at" + i, aSubsidiariesValidatedDate.get(i).getText(), subsidiariesListExamTable.getRow(i).get(subsidiariesListExamTable.getHeaders().get(3)));
        }
    }

    public void dVerifySubsidiariesListForPercentFilter() {
        dVerifySubsidiariesList();
    }

    public void verifyDirectSubsidiariesAreHighlighted() {
        /* Compare size of all the subsidiaries highlighted for the county with all the subsidiaries for the country */
        assertEquals(
                getWebElements(By.xpath(subsidiaries_highlighted_xpath + "[td[@class='ng-binding']='" + selectedCountryHighlight + "']")).size(),
                getWebElements(By.xpath(subsidiaries_row_for_country_xpath + selectedCountryHighlight + "']")).size());

        /* Compare size of all the subsidiaries highlighted with all the subsidiaries for the country */
        assertEquals(
                getWebElements(By.xpath(subsidiaries_highlighted_xpath)).size(),
                getWebElements(By.xpath(subsidiaries_row_for_country_xpath + selectedCountryHighlight + "']")).size());
    }

    public void verifyDirectSubsidiariesAreNotHighlighted() {
        assertFalse(isWebElementDisplayed(By.xpath(subsidiaries_highlighted_xpath)));
    }

    public void dVerifyCountryHighlightList() {
        waitForPageToLoad(15000L);
        List<String> aCountryHighlightList = getWebElementsText(subsidiaries_country_highlight_list_text_xpath);
        Iterator eIterator = eCountryHighlightList.iterator();
        Iterator aIterator = aCountryHighlightList.iterator();
        while (eIterator.hasNext()) {
            assertEquals(eIterator.next(), aIterator.next());
        }
    }

    public void verifyCountryHighlightListNotExists() {
        waitForPageToLoad(15000L);
        assertFalse(isWebElementDisplayed(subsidiaries_country_highlight_list_text_xpath));
    }

    public void openLegalTitleInSubsidiariesListInNewWindow(String legalTitle) {
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        nvPairs.add(new BasicNameValuePair("name", legalTitle));
        for (org.apache.http.NameValuePair nameValuePair : nvPairs) {
            if ("fid".equals(nameValuePair.getName())) {
                nvPairs.remove(nameValuePair);
            }
        }
        openLinkInNewWindow(By.linkText(legalTitle));
    }

    public void clickOnLegalTitleInSubsidiariesList(String legalTitle) {
        waitForWebElementToAppear(subsidiaries_entity_name_text_xpath);
        nvPairs.add(new BasicNameValuePair("name", legalTitle));
        for (org.apache.http.NameValuePair nameValuePair : nvPairs) {
            if ("fid".equals(nameValuePair.getName())) {
                nvPairs.remove(nameValuePair);
            }
        }
        clickOnWebElement(By.linkText(legalTitle));
        waitForInMilliSeconds(3000L);
    }

    public void eCaptureSubsidiariesPage() {
        takeSnapshot("./src/test/resources/expected/eSubsidiariesPage.png");
    }

    public void aCaptureSubsidiariesPage() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aSubsidiariesPage.png");
    }

    public void compareSnapshotsForSubsidiaries() {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getSnapshotPath() + "/expected/eSubsidiariesPage.png",
                        readProperties().getSnapshotPath() + "/actual/aSubsidiariesPage.png",
                        readProperties().getSnapshotPath() + "/difference/dSubsidiariesPage.png"));
    }
}