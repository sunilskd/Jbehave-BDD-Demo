package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class GraphsPage extends WebDriverUtils {

    private String graph_root_node = "//*[local-name()='g'][@id=0]";
    private String graph_root_node_highlight_xpath = "[contains(@class,'highlight-focus')]";
    private String graph_legal_entity_title_xpath = "/*[local-name()='text']/*[local-name()='title']";
    private String graph_percent_xpath = "/*[local-name()='text'][1]/*[local-name()='tspan'][@x='40']";
    private By graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private By graph_button_xpath = By.xpath("//*[@id='view-options']/ul/li[2]");
    private By graph_draw_area_xpath = By.xpath("//*[local-name()='g'][@class='drawarea']");
    private String graph_level_xpath = "//*[contains(@transform,',";
    private String graph_legal_entity_link_xpath = "/*[local-name()='text']//*[local-name()='tspan'][@class='name']";
    private String graph_country_xpath = "/*[local-name()='text'][2]";
    private By graph_subsidiaries_multiple_node_xpath = By.xpath("//*[local-name()='g'][contains(@class,'sub')][contains(@class,'multiple')]");
    private By graph_no_known_entities_message_text_xpath = By.xpath("//*[@id='content-view']/p");

    public GraphsPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnGraphButton() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_button_xpath);
        if(isWebElementDisplayed(graph_draw_area_xpath)) {
            executeScript
                    ("return arguments[0].setAttribute(arguments[1],arguments[2]);",
                            getWebElement(graph_draw_area_xpath), "transform", "translate(629.735907505466,396.1689031324577) scale(0.36856730432277535)");
        }
    }

    public void verifyRootNodeInTheGraphs(String legalEntity) {
        waitForWebElementToAppear(By.xpath(graph_root_node));
        assertTrue(isWebElementDisplayed(By.xpath(graph_root_node  + graph_root_node_highlight_xpath)));
        assertEquals(legalEntity, getWebElementText(By.xpath(graph_root_node + graph_legal_entity_title_xpath)));
        assertEquals("", getWebElementText(By.xpath(graph_root_node + graph_percent_xpath)));
    }

    public void verifySubsGraphHeader() {
        waitForWebElementToAppear(graph_header_text_xpath);
        assertEquals("Subsidiary Graph", getWebElementText(graph_header_text_xpath));
    }

    public void verifyOwnersGraphHeader() {
        waitForWebElementToAppear(graph_header_text_xpath);
        assertEquals("Ownership Graph", getWebElementText(graph_header_text_xpath));
    }

    public void verifyFullGraphHeader() {
        waitForWebElementToAppear(graph_header_text_xpath);
        assertEquals("Ownership + Subsidiary Graph", getWebElementText(graph_header_text_xpath));
    }

    public void verifyGraphNodes(String level, ExamplesTable nodesExamTable) {
        List<WebElement> aLegalTitle = getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_legal_entity_link_xpath));
        List<WebElement> aPercent = getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_percent_xpath ));
        List<WebElement> aCountry = getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_country_xpath));
        List aNodeList = new ArrayList();

        /* Comparing the size of actual and expected list */
        assertEquals(aLegalTitle.size(),nodesExamTable.getRowCount());

        /* Creating a list of actual owners list by concatenating legal title, percent and country */
        for (int i =0; i<getWebElements(By.xpath(graph_level_xpath + level + ")')]")).size(); i++) {
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", aLegalTitle.get(i)).toString().replace("%","")
                            .replace("<tspan x=\"40\">","")
                            .replace("</tspan><tspan dy=\"14\" x=\"40\">","")
                            .replace("</tspan><tspan class=\"ellipsis\">","")
                            .replace("</tspan>","")
                            .replace(" ","") +
                            executeScript("return arguments[0].innerHTML;", aPercent.get(i)).toString().replace("%","") +
                            executeScript("return arguments[0].innerHTML;", aCountry.get(i)).toString().replace(" ","")
            );
        }
        verifyNodes(aNodeList, nodesExamTable);
    }

    public void verifyNodes(List aNodeList, ExamplesTable nodesExamTable){
        List eNodeList = new ArrayList();
        for (Map<String,String> row : nodesExamTable.getRows()) {
            String legalTitle = row.get("NODES").replace(" ","");
            eNodeList.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyVisualIndicatorNotDisplayedForSubsidiaries() {
        assertFalse(isWebElementDisplayed(graph_subsidiaries_multiple_node_xpath));
    }

    public void verifyNoEntitiesMsg() {
        waitForWebElementToAppear(graph_no_known_entities_message_text_xpath);
        waitForInMilliSeconds(3000L);
        assertEquals("No known entities.", getWebElementText(graph_no_known_entities_message_text_xpath));
    }

}
