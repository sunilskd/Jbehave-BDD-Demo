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
    private String subsidiaries_graph_legal_title_xpath = "')]//*[local-name()='text'][1]/*[local-name()='title']";
    private By subsidiaries_graph_no_subs_message_text_xpath = By.xpath("//*[@id='content-view']/p");
    private String nodes_xpath = "//*[local-name()='g']";
    private String node_highlight_xpath = "/*[local-name()='rect'][contains(@class,'country-highlight')]";
    private String owners_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private String owners_graph_percent_xpath = "')]/*[local-name()='text'][1]/*[local-name()='tspan']";
    private String owners_graph_country_xpath = "')]/*[local-name()='text'][2]";

    public SubsidiariesGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifySubsidiariesGraphRootNode(String legalEntity) {
        waitForWebElementToAppear(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath));
        verifySubsGraphHeader();
        waitForWebElementToAppear(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath));
        assertEquals(legalEntity, getWebElementText(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath)));
    }

    public void verifySubsidiariesNodes(String level, ExamplesTable subsidiariesExamTable) {
        String aLevel  = Integer.toString(Integer.parseInt(level)*180);

        List<String> aOwnersLegalTitle = getWebElementsText(By.xpath(subsidiaries_graph_level_xpath + aLevel + owners_graph_legal_title_xpath));
        List<String> aOwnersPercent = getWebElementsText(By.xpath(subsidiaries_graph_level_xpath + aLevel + owners_graph_percent_xpath));
        List<String> aOwnersCountry = getWebElementsText(By.xpath(subsidiaries_graph_level_xpath + aLevel + owners_graph_country_xpath));
        List aOwnersList = new ArrayList();

        /* Creating a list of actual owners list by concatenating legal title, percent and country */
        for (int i =0; i<getWebElements(By.xpath(subsidiaries_graph_level_xpath + aLevel + "')]")).size(); i++) {
            aOwnersList.add(aOwnersLegalTitle.get(i) + aOwnersPercent.get(i).replace("%","") + aOwnersCountry.get(i));
        }

        List eOwnersLegalTitle = new ArrayList();
        for (Map<String,String> row : subsidiariesExamTable.getRows()) {
            String legalTitle = row.get("SUBSIDIARIES");
            eOwnersLegalTitle.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eOwnersLegalTitle);
        Collections.sort(aOwnersList);

        for (int i=0; i<eOwnersLegalTitle.size(); i++){

            assertEquals("Owners does not match at " + i, eOwnersLegalTitle.get(i), aOwnersList.get(i));
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

    public void verifySubsidiariesAreHighlightedForSelectedCountry(ExamplesTable subsidiariesHighlightedExamTable) {
        List<WebElement> webElements= getWebElements(By.xpath(nodes_xpath));
        /* Looping through all the nodes*/
        for(int j=0; j<subsidiariesHighlightedExamTable.getRowCount(); j++){
            /* Looping through the expected highlight list */
            for (int i=1; i<webElements.size(); i++){
                if(webElements.get(i).getText().contains(subsidiariesHighlightedExamTable.getRow(j).get(subsidiariesHighlightedExamTable.getHeaders().get(0)))){
                        assertTrue(isWebElementDisplayed(By.xpath(nodes_xpath + "[" + i + "]" + node_highlight_xpath)));
            }
        }
    }
}
}
