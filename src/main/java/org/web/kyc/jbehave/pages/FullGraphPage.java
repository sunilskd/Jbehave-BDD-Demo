package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

import static org.junit.Assert.assertEquals;

public class FullGraphPage extends WebDriverUtils {

    private By full_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private String full_graph_level_xpath = "//*[contains(@transform,',";
    private String full_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";

    public FullGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifyFullGraphRootNode(String legalEntity) {
            waitForWebElementToAppear(By.xpath(full_graph_level_xpath + "0" + full_graph_legal_title_xpath));
            verifyFullGraphHeader();
            assertEquals(legalEntity, getWebElementText(By.xpath(full_graph_level_xpath + "0" + full_graph_legal_title_xpath)));
    }

    public void verifyFullGraphHeader() {
        waitForWebElementToAppear(full_graph_header_text_xpath);
        assertEquals("Ownership + Subsidiary Graph", getWebElementText(full_graph_header_text_xpath));
    }
}
