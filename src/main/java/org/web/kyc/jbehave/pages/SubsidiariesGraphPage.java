package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class SubsidiariesGraphPage extends WebDriverUtils {

    private By subsidiaries_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private String subsidiaries_graph_level_xpath = "//*[contains(@transform,',";
    private String subsidiaries_graph_legal_title_xpath = "')]//*[local-name()='text'][1]";
    private By subsidiaries_graph_no_subs_message_text_xpath = By.xpath("//*[@id='content-view']/p");
    private By subsidiaries_graph_country_highlight_list_text_xpath =By.xpath("//select");
    private By subsidiaries_graph_country_highlight_header_text_xpath =By.xpath("//*[@id='content-view']/div[1]/div[2]/div/label");
    private By subsidiaries_graph_highlight_in_graph_header_text_xpath =By.xpath("//*[@id='content-view']/div[1]/div[2]/div/h2");

    public SubsidiariesGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifySubsidiariesGraphRootNode(String legalEntity) {
        verifySubsGraphHeader();
        waitForWebElementToAppear(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath));
        assertEquals(legalEntity, getWebElementText(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath)));
    }

    public void verifySubsidiariesNodes(String level, ExamplesTable subsidiariesExamTable) {
        String aLevel  = Integer.toString(Integer.parseInt(level)*180);
        List<String> aSubsidiariesList = getWebElementsText(By.xpath(subsidiaries_graph_level_xpath + aLevel + "')]"));

        List eSubsidiariesLegalTitle = new ArrayList();
        for (Map<String,String> row : subsidiariesExamTable.getRows()) {
            String legalTitle = row.get("SUBSIDIARIES");
            eSubsidiariesLegalTitle.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(aSubsidiariesList);
        Collections.sort(eSubsidiariesLegalTitle);

        for (int i=0; i<eSubsidiariesLegalTitle.size(); i++){
            assertEquals("Subsidiaries does not match at " + i, eSubsidiariesLegalTitle.get(i), aSubsidiariesList.get(i).replace("%",""));
        }
    }

    public void verifyNoSubsidiariesMsg() {
        verifySubsGraphHeader();
        waitForWebElementToAppear(subsidiaries_graph_no_subs_message_text_xpath);
        try {
            Thread.sleep(3000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        assertEquals("No known entities.", getWebElementText(subsidiaries_graph_no_subs_message_text_xpath));
    }
    public void verifySubsGraphHeader() {
        waitForWebElementToAppear(subsidiaries_graph_header_text_xpath);
        assertEquals("Subsidiary Graph", getWebElementText(subsidiaries_graph_header_text_xpath));
    }

    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlighListExamTable) {
        verifyCountryHighlightsHeader();
        waitForPageToLoad(15000L);
        try {
            Thread.sleep(3000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        List<String> aCountryHighlightList = getWebElementsText(subsidiaries_graph_country_highlight_list_text_xpath);
        List eCountryHighlightList = new ArrayList();
        for (Map<String, String> row : countriesHighlighListExamTable.getRows()) {
            String legalTitle = row.get("COUNTRIES");
            eCountryHighlightList.add(legalTitle);
        }

        for (int i = 0; i < countriesHighlighListExamTable.getRowCount(); i++) {
            assertEquals(" Country does not match at" + i, eCountryHighlightList.get(i), aCountryHighlightList.get(i));

        }
    }

    public void selectCountryHighlight(String country) {
        Select dropDown = new Select(getWebElement(subsidiaries_graph_country_highlight_list_text_xpath));
        dropDown.selectByVisibleText(country);
    }

    public void verifyCountryHighlightsHeader() {
        waitForWebElementToAppear(subsidiaries_graph_highlight_in_graph_header_text_xpath);
        assertEquals("Highlight in Graph", getWebElementText(subsidiaries_graph_highlight_in_graph_header_text_xpath));
        assertEquals("Country:", getWebElementText(subsidiaries_graph_country_highlight_header_text_xpath));
    }

    public void verifySubsidiariesAreHighlightedForSelectedCountry(ExamplesTable subsidiariesHighlightedExamTable) {
        List<WebElement> webElements= findElements(By.xpath("//*[local-name()='g']"));
        for (int i=1; i<webElements.size(); i++){
            for(int j=0; j<subsidiariesHighlightedExamTable.getRowCount(); j++){
                if(webElements.get(i).getText().contains(subsidiariesHighlightedExamTable.getRow(j).get(subsidiariesHighlightedExamTable.getHeaders().get(0)))){
                    assertTrue(isWebElementDisplayed(By.xpath("//*[local-name()='g'][" + i + "]/*[local-name()='rect'][contains(@class,'country-highlight')]")));
            }
        }
    }
}
}
