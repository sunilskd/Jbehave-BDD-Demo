package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.comparator.Comparator.compareImages;
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
    private By graph_country_highlight_nodes_xpath = By.xpath("//*[local-name()='g'][contains(@class,'highlight-country')][not(contains(@class,'highlight-multiple'))]/*[local-name()='text']/*[local-name()='title']");
    private By graph_country_highlight_nodes_verify_xpath = By.xpath("//*[local-name()='rect'][contains(@class,'country-highlight')]");
    private String graph_legal_title_xpath = "/*[local-name()='text']/*[local-name()='title']";
    private String graph_subsidiaries_xpath = "//*[local-name()='g'][contains(@class,'sub')][@parent=";
    private String graph_nodes_xpath = "//*[local-name()='g'][contains(@class,'node')]";
    private String graph_multiple_node_xpath = ".//div[@class='graph-container']//*[contains(@class,'multiple')]";
    private By graph_multiple_node_title_xpath = By.xpath(".//*[local-name()='text']/*[local-name()='title']");
    private By graph_multiple_node_non_entity_xpath = By.xpath(".//*[@class='node own others']");
    private By graph_multiple_node_highlight_xpath = By.xpath("//*[contains(@class,'highlight-multiple')]");
    private By graph_non_multiple_nodes_list_xpath = By.xpath(".//*[@class='node own bank']");
    private By graph_person_nodes_list_xpath = By.xpath(".//*[@class='node own person']");
    private String graph_owners_xpath = "//*[local-name()='g'][contains(@class,'own')][@parent=";
    private By graph_highlight_ubo_xpath = By.xpath("//*[local-name()='g'][contains(@class,'highlight-ubo')][not(contains(@class,'highlight-multiple'))]/*[local-name()='text']/*[local-name()='tspan'][1]");
    private String graph_legal_title_tool_tip_xpath = "//*[@class='graph-container']//*[local-name()='title']";
    private By legal_entity_title_text_xpath = By.xpath("//*[@id='entity-details']/h1");

    public GraphsPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnGraphButton() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_button_xpath);
        if (isWebElementDisplayed(graph_draw_area_xpath)) {
            executeScript
                    ("return arguments[0].setAttribute(arguments[1],arguments[2]);",
                            getWebElement(graph_draw_area_xpath), "transform", "translate(629.735907505466,396.1689031324577) scale(0.36856730432277535)");
        }
    }

    public void verifyRootNodeInTheGraphs(String rootEntity) {
        waitForWebElementToAppear(By.xpath(graph_root_node));
        assertTrue(isWebElementDisplayed(By.xpath(graph_root_node + graph_root_node_highlight_xpath)));
        assertEquals(rootEntity, getWebElementText(By.xpath(graph_root_node + graph_legal_entity_title_xpath)));
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
        waitForInMilliSeconds(3000L);
        List<WebElement> aLegalTitle = getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_legal_entity_link_xpath));
        List<WebElement> aPercent = getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_percent_xpath));
        List<WebElement> aCountry = getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_country_xpath));
        List aNodeList = new ArrayList();

        /* Comparing the size of actual and expected list */
        assertEquals(aLegalTitle.size(), nodesExamTable.getRowCount());

        /* Creating a list of actual owners list by concatenating legal title, percent and country */
        for (int i = 0; i < getWebElements(By.xpath(graph_level_xpath + level + ")')]")).size(); i++) {
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", aLegalTitle.get(i)).toString().replace("%", "")
                            .replace("<tspan x=\"40\">", "")
                            .replace("</tspan><tspan dy=\"14\" x=\"40\">", "")
                            .replace("</tspan><tspan class=\"ellipsis\">", "")
                            .replace("</tspan>", "")
                            .replace(" ", "") +
                    executeScript("return arguments[0].innerHTML;", aPercent.get(i)).toString().replace("%", "") +
                    executeScript("return arguments[0].innerHTML;", aCountry.get(i)).toString().replace(" ", "")
            );
        }
        verifyNodes(aNodeList, nodesExamTable);
    }

    public void verifyNodes(List aNodeList, ExamplesTable nodesExamTable) {
        List eNodeList = new ArrayList();
        for (Map<String, String> row : nodesExamTable.getRows()) {
            String legalTitle = row.get("NODES").replace(" ", "");
            eNodeList.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i = 0; i < eNodeList.size(); i++) {
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

    public void verifyEntitiesAreHighlightedForSelectedCountry(ExamplesTable highlightedEntitiesExamTable) {
        List<WebElement> webElements = getWebElements(graph_country_highlight_nodes_xpath);
        List<String> webElement = getWebElementsText(graph_country_highlight_nodes_xpath);

        List aNodeList = new ArrayList();
        /* Comparing the size of actual and expected list */
        assertEquals(webElements.size(), highlightedEntitiesExamTable.getRowCount());
        for (int i = 0; i < webElement.size(); i++) {
            aNodeList.add(webElement.get(i).toString().replace(" ",""));
        }
        verifyNodes(aNodeList, highlightedEntitiesExamTable);
    }

    public void verifyNoCountryHighlightedNodes() {
        assertFalse(isWebElementDisplayed(graph_country_highlight_nodes_verify_xpath));
    }

    public void verifyStopTravelingPath(String level) {
        waitForInMilliSeconds(2000L);
        assertFalse(isWebElementDisplayed(By.xpath(graph_level_xpath + level + ")')]" + graph_legal_title_xpath)));
    }

    public void verifySubsidiariesOfAnEntity(String legalEntity, ExamplesTable subsidiariesExamTable) {
        verifyParentChildRelationship(legalEntity, subsidiariesExamTable, graph_subsidiaries_xpath);
    }

    public void verifyParentChildRelationship(String legalEntity, ExamplesTable examTable, String xpath) {
        List<WebElement> nodes = getWebElements(By.xpath(graph_nodes_xpath));
        List<String> aNodeList = new ArrayList<>();
        String id = "";

        for (int i = 0; i < nodes.size(); i++) {
            if (nodes.get(i).findElement(By.xpath(".//*[local-name()='title']")).getText().equals(legalEntity)) {
                id = nodes.get(i).getAttribute("id");
                break;
            }
        }

        List<WebElement> owners = getWebElements(By.xpath(xpath + id + "]"));
        for (int i = 0; i < owners.size(); i++) {
            aNodeList.add(
                    owners.get(i).findElement(By.xpath("." + graph_legal_entity_link_xpath)).getText().replace("%", "").replace(" ","") +
                            owners.get(i).findElement(By.xpath("." + graph_percent_xpath)).getText().replace("%", "").replace(" ","") +
                            owners.get(i).findElement(By.xpath("." + graph_country_xpath)).getText().replace(" ","")
            );
        }
        verifyNodes(aNodeList, examTable);
    }

    public void verifyingCountForMultipleDisplayedNodes(String legalEntity, String countValue) {
        List<WebElement> multipleNode  = getWebElements(By.xpath(graph_multiple_node_xpath));
        assertTrue(getWebElements(By.xpath(graph_multiple_node_xpath)).size()>0);
        for (int i = 0; i < multipleNode.size(); i++) {
                String entityTile = multipleNode.get(i).findElement(graph_multiple_node_title_xpath).getText();
                if (entityTile.equalsIgnoreCase(legalEntity)) {
                    String appearsCount = multipleNode.get(i).findElements(By.tagName("text")).get(2).getText();
                    assertEquals(appearsCount, countValue);
                }
        }
    }

    public void verifyIndicatorNotDisplayed(String entity) {
        List<WebElement> entityNodes = getWebElements(graph_multiple_node_non_entity_xpath);
        comparingAndExtractingTitle(entity, entityNodes);
    }

    private void comparingAndExtractingTitle(String entityType, List<WebElement> nodes) {
        for(WebElement node : nodes){
            if(entityType.equalsIgnoreCase(node.findElement(graph_multiple_node_title_xpath).getText())){
                String appearsCount = node.findElements(By.tagName("text")).get(2).getText();
                assertTrue(appearsCount.isEmpty());
            }
        }
    }

    public void selectingNodeToBeClicked(String legalEntity){
        try{
            Thread.sleep(3000L);
            List<WebElement> multipleNode  = getWebElements(By.xpath(graph_multiple_node_xpath));
            for(int i=1;i<=multipleNode.size();i++){
                String actualEntityTile = multipleNode.get(i).findElement(graph_multiple_node_title_xpath).getText();
                if(legalEntity.equalsIgnoreCase(actualEntityTile)){
                    getActions().click(multipleNode.get(i)).build().perform();
                    break;
                }
            }
        }catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void verifyingHighLightDisplayedForMultipleNode(String legalEntity) {
        List<WebElement> highlightNodesList = getWebElements(graph_multiple_node_highlight_xpath);
        for (int j = 0; j < highlightNodesList.size(); j++) {
            String highlightedNodesTitle = highlightNodesList.get(j).findElement(graph_multiple_node_title_xpath).getText();
            assertEquals(highlightedNodesTitle, legalEntity);
        }
    }

    public void clickOnNodeTitle(String nodeTitle) {
        nvPairs.clear();
        waitForInMilliSeconds(3000L);
        nvPairs.add(new BasicNameValuePair("name", nodeTitle));
        List<WebElement> nodes = getWebElements(By.xpath(graph_nodes_xpath));
        for(int i=0; i<nodes.size(); i++){
            if(nodes.get(i).getText().contains(nodeTitle)){
                getActions().click(findElement(By.xpath(graph_nodes_xpath + "[" + Integer.toString(i+1) + "]" + "/*[local-name()='text']/*[local-name()='a']/*[local-name()='tspan']/*[local-name()='tspan'][1]"))).perform();
            }
        }
    }

    public void clickOnNonPersonNonEntity(String nodeTitle){
        List<WebElement> nodes = getWebElements(By.xpath(graph_nodes_xpath));
        for(int i=0; i<nodes.size(); i++){
            if(nodes.get(i).getText().contains(nodeTitle)){
                assertFalse(isWebElementDisplayed((By.xpath(graph_nodes_xpath + "[" + Integer.toString(i+1) + "]" + "/*[local-name()='text']/*[local-name()='a']/*[local-name()='tspan']/*[local-name()='tspan'][1]"))));
            }
        }
    }

    public void verifyVisualIndicatorNotDisplayedForSingleLegalEntity(String legalEntity) {
        List<WebElement> nodes = getWebElements(graph_non_multiple_nodes_list_xpath);
        comparingAndExtractingTitle(legalEntity, nodes);
    }

    public void verifyVisualIndicatorNotDisplayedForEntityDiffFid(String legalEntity){
        List<WebElement> personNodes = getWebElements(graph_person_nodes_list_xpath);
        comparingAndExtractingTitle(legalEntity, personNodes);
    }

    public void verifyOwnersOfAnEntity(String legalEntity, ExamplesTable ownersExamTable){
        verifyParentChildRelationship(legalEntity, ownersExamTable, graph_owners_xpath);
    }

    public void verifyUBOsAreHighlighted(ExamplesTable ubosHighlightedExamTable) {
        List<WebElement> highlightedUbos = getWebElements(graph_highlight_ubo_xpath);
        List aNodeList = new ArrayList();
        for(int i=0; i<highlightedUbos.size(); i++){
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", highlightedUbos.get(i)).toString()
                            .replace("<tspan x=\"40\">","")
                            .replace("</tspan><tspan dy=\"14\" x=\"40\">","")
                            .replace("</tspan><tspan class=\"ellipsis\">","")
                            .replace("</tspan>",""));
        }

        List eNodeList = new ArrayList();
        for (Map<String,String> row : ubosHighlightedExamTable.getRows()) {
            String legalTitle = row.get("NODES");
            eNodeList.add(legalTitle);
        }

        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyUBOHighlightIsRemoved() {
        assertFalse(isWebElementDisplayed(graph_highlight_ubo_xpath));
    }

    public void verifyHoverOverToolTipInNodes(ExamplesTable legalTitleExamTable) {
        waitForWebElementToAppear(By.xpath(graph_legal_title_tool_tip_xpath));
        List<WebElement> aLegalTitle = getWebElements(By.xpath(graph_legal_title_tool_tip_xpath));
        List aNodeList = new ArrayList();

        /* Comparing the size of actual and expected list */
        assertEquals(aLegalTitle.size(),legalTitleExamTable.getRowCount());

        for (int i =0; i<aLegalTitle.size(); i++) {
            aNodeList.add(
                    executeScript("return arguments[0].innerHTML;", aLegalTitle.get(i)).toString().replace("%","").trim());
        }

        List eNodeList = new ArrayList();
        for (Map<String,String> row : legalTitleExamTable.getRows()) {
            String legalTitle = row.get("LEGAL TITLE");
            eNodeList.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(eNodeList);
        Collections.sort(aNodeList);

        for (int i=0; i<eNodeList.size(); i++){
            assertEquals("Node does not match at " + i, eNodeList.get(i), aNodeList.get(i));
        }
    }

    public void verifyGraphPageOfLegalEntity(String nodeTitle){
        waitForInMilliSeconds(3000L);
        assertEquals(nodeTitle,findElement(legal_entity_title_text_xpath).getText());
    }

    public void captureExpectedScreenShotForFullGraph() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/expected/eFullGraph.png");
    }

    public void captureActualScreenShotForFullGraph() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aFullGraph.png");
    }

    public void compareSnapshotsForFullGraph() {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eFullGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aFullGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dFullGraph.png"));
    }


    public void captureExpectedScreenShotForOwnersGraph() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/expected/eOwnersGraph.png");
    }

    public void captureActualScreenShotForOwnersGraph() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aOwnersGraph.png");
    }

    public void compareSnapshotsForOwnersGraph() {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eOwnersGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aOwnersGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dOwnersGraph.png"));
    }

    public void captureExpectedScreenShotForSubsGraph() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/expected/eSubsGraph.png");
    }

    public void captureActualScreenShotForSubsGraph() {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aSubsGraph.png");
    }

    public void compareSnapshotsForSubsGraph() {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eSubsGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aSubsGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dSubsGraph.png"));
    }

    public void verifyingHighlightIsNotDisplayedForMultipleNode() {
        waitForInMilliSeconds(3000L);
        assertFalse(isWebElementDisplayed(graph_multiple_node_highlight_xpath));
    }
}
