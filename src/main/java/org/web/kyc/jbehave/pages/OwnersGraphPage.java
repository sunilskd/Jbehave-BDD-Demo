package org.web.kyc.jbehave.pages;

import org.apache.http.NameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.w3c.dom.Document;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.xqueries.XQueryEnum.DIRECT_OWNERS_LIST;

public class OwnersGraphPage extends WebDriverUtils {
    private String owners_graph_level_xpath = "//*[contains(@transform,',";
    private String owners_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private By owners_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private By owners_graph_side_panel_free_text_xpath = By.xpath("//div[3]/div/p");
    private By owners_graph_side_panel_close_button_xpath = By.xpath("//div[3]/button");
    private By owners_graph_side_panel_closed_xpath = By.xpath("//h3[@class='ng-hide']");

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

    public void verifyFreeTextInSidePanel(ExamplesTable freeTextExampletable){

        String aDirectOwnerFreeText = getWebElementText(owners_graph_side_panel_free_text_xpath);
        assertEquals(freeTextExampletable.getRow(0).get(freeTextExampletable.getHeaders().get(0)), aDirectOwnerFreeText);
    }

    public void closeSidePanel(){
        findElement(owners_graph_side_panel_close_button_xpath).click();
    }

    public void verifySidePanelIsClosed(){
        assertTrue(isWebElementDisplayed(owners_graph_side_panel_closed_xpath));
        assertTrue(isWebElementDisplayed(owners_graph_header_text_xpath));
    }

}
