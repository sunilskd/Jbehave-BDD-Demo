package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

/**
 * Created by sahug on 5/24/2016.
 */
public class OwnersGraphPage extends WebDriverUtils {
    private String owners_graph_level_xpath = "//*[contains(@transform,',";
    private String owners_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private String owners_graph_percent_xpath = "')]/*[local-name()='text']/*[local-name()='tspan']";
    private String owners_graph_country_xpath = "')]/*[local-name()='text'][2]";
    private By owners_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");

    public OwnersGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifyOwnersGraphRootNode(String legalEntity) {
        waitForWebElementToAppear(By.xpath(owners_graph_level_xpath  + "840" + owners_graph_legal_title_xpath));
        verifyOwnersGraphHeader();
        assertEquals(legalEntity, getWebElementText(By.xpath(owners_graph_level_xpath  + "840" + owners_graph_legal_title_xpath)));
    }

    public void verifyOwnersGraphHeader() {
        waitForWebElementToAppear(owners_graph_header_text_xpath);
        assertEquals("Ownership Graph", getWebElementText(owners_graph_header_text_xpath));
    }

    public void verifyOwnersNodes(String level, ExamplesTable ownersExamTable) {
        try {
            Thread.sleep(2000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        /* Root node for owner is at y=840 */
        String aLevel  = Integer.toString(840 - (Integer.parseInt(level)*180));

        List<String> aOwnersLegalTitle = getWebElementsText(By.xpath(owners_graph_level_xpath + aLevel + owners_graph_legal_title_xpath));
        List<String> aOwnersPercent = getWebElementsText(By.xpath(owners_graph_level_xpath + aLevel + owners_graph_percent_xpath));
        List<String> aOwnersCountry = getWebElementsText(By.xpath(owners_graph_level_xpath + aLevel + owners_graph_country_xpath));
        List aOwnersList = new ArrayList();

        /* Creating a list of actual owners list by concatenating legal title, percent and country */
        for (int i =0; i<getWebElements(By.xpath(owners_graph_level_xpath + aLevel + "')]")).size(); i++) {
            aOwnersList.add(aOwnersLegalTitle.get(i) + aOwnersPercent.get(i).replace("%","") + aOwnersCountry.get(i));
        }

        List eOwnersLegalTitle = new ArrayList();
        for (Map<String,String> row : ownersExamTable.getRows()) {
            String legalTitle = row.get("OWNERS");
            eOwnersLegalTitle.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eOwnersLegalTitle);
        Collections.sort(aOwnersList);

        for (int i=0; i<eOwnersLegalTitle.size(); i++){
            assertEquals("Owners does not match at " + i, eOwnersLegalTitle.get(i), aOwnersList.get(i));
        }

    }
}
