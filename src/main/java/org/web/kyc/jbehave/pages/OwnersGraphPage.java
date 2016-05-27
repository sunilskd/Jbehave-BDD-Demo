package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class OwnersGraphPage extends WebDriverUtils {
    private String owners_graph_level_xpath = "//*[contains(@transform,',";
    private String owners_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private By owners_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");


    public OwnersGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifyOwnersGraphRootNode(String legalEntity) {
        waitForWebElementToAppear(By.xpath(owners_graph_level_xpath  + "600" + owners_graph_legal_title_xpath));
        verifyOwnersGraphHeader();
        assertEquals(legalEntity, getWebElementText(By.xpath(owners_graph_level_xpath  + "600" + owners_graph_legal_title_xpath)));
    }

    public void verifyOwnersGraphHeader() {
        waitForWebElementToAppear(owners_graph_header_text_xpath);
        assertEquals("Ownership Graph", getWebElementText(owners_graph_header_text_xpath));
    }

    public void verifyStopTravelingPath(String level) {
        try {
            Thread.sleep(2000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        /* Root node for owner is at y=840 */
        String aLevel = Integer.toString(840 - (Integer.parseInt(level) * 180));
        assertFalse(isWebElementDisplayed(By.xpath(owners_graph_level_xpath + aLevel + owners_graph_legal_title_xpath)));

    }
}
