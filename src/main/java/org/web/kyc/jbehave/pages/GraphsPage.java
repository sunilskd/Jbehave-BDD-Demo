package org.web.kyc.jbehave.pages;

import org.apache.http.message.BasicNameValuePair;
import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.*;
import org.w3c.dom.Document;

import java.io.IOException;
import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.comparator.Comparator.compareImages;
import static org.web.kyc.comparator.PDFComparator.comparePDFsContent;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;
import static org.web.kyc.xqueries.XQueryEnum.DIRECT_OWNERS_LIST_GRAPH;
import static org.web.kyc.xqueries.XQueryEnum.SUBSIDIARIES_LIST_GRAPH;

public class GraphsPage extends WebDriverUtils {

    private String graph_root_node = "//*[local-name()='g'][@id=1]";
    private String graph_root_node_highlight_xpath = "[contains(@class,'highlight-focus')]";
    private String graph_legal_entity_title_xpath = "/*[local-name()='text']/*[local-name()='title']";
    private String graph_percent_xpath = "/*[local-name()='text'][1]/*[local-name()='tspan'][@class='ownership'][@x='40']";
    private By graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private By graph_button_xpath = By.xpath("//*[@id='view-options']/ul/li[2]");
    private By graph_draw_area_xpath = By.xpath("//*[local-name()='g'][@class='drawarea']");
    private String graph_level_xpath = "//*[contains(@transform,',";
    private String graph_country_xpath = "/*[local-name()='text'][2]";
    private By graph_subsidiaries_multiple_node_xpath = By.xpath("//*[local-name()='g'][contains(@class,'sub')][contains(@class,'multiple')]");
    private By graph_no_known_entities_message_text_xpath = By.xpath("//div[@class='notification']/p");
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
    //private By subs_graphs_truncated_notification_with_node_count_msg_xpath = By.xpath(".//*[@id='content-view'] //p[@class='notification attention ng-scope']");
    private By graph_in_product_msg_text_xpath = By.xpath(".//div[@kyc-ubo-subscription-message=\"\"][@style='display: block;']");
    private By graphs_truncated_notification_msg_xpath = By.xpath("//p[@class='attention ng-scope']");
    private By graphs_truncated_notification_with_node_count_msg_xpath = By.xpath("//p[contains(@ng-if,'graphSize' )]");


    public GraphsPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnGraphButton() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_button_xpath);
        if (isWebElementDisplayed(graph_draw_area_xpath)) {
            executeScript
                    ("return arguments[0].setAttribute(arguments[1],arguments[2]);",
                            getWebElement(graph_draw_area_xpath), "transform", "translate(946.5,487.5) scale(0.397)");
        }
    }

    public void resizeGraphs(String translate) {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_button_xpath);
        if (isWebElementDisplayed(graph_draw_area_xpath)) {
            executeScript
                    ("return arguments[0].setAttribute(arguments[1],arguments[2]);",
                            getWebElement(graph_draw_area_xpath), "transform", translate);
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
        assertEquals("Complete Ownership + Subsidiary Graph", getWebElementText(graph_header_text_xpath));
    }

    public void dVerifyGraphNodesAtLevels(String level, String ownersOrSubs) {
        waitForInMilliSeconds(2000L);
        String childLevel = "";
        List <String> eNodeList = new ArrayList<>();
        Document eDirectOwnersOrSubsList = null;

        /* Getting the child level. The levels are 250 apart*/
        if(ownersOrSubs.equals("owners")){
            childLevel = String.valueOf(Integer.parseInt(level) + 250);
        } else if(ownersOrSubs.equals("subsidiaries")){
            childLevel = String.valueOf(Integer.parseInt(level) - 250);
        }

        for(int i=0; i<getNodesAtLevel(childLevel).get("aLegalTitle").size(); i++) {
            nvPairs.add(new BasicNameValuePair("name", getNodesAtLevel(childLevel).get("aLegalTitle").get(i).getText()));
            httpRequest().removeNameValuePair("fid");
            if(ownersOrSubs.equals("owners")){
                eDirectOwnersOrSubsList = httpRequest().getResultsFormDataBase(DIRECT_OWNERS_LIST_GRAPH, nvPairs);
            } else if(ownersOrSubs.equals("subsidiaries")){
                eDirectOwnersOrSubsList = httpRequest().getResultsFormDataBase(SUBSIDIARIES_LIST_GRAPH, nvPairs);
            }

            for (int j = 0; j < eDirectOwnersOrSubsList.getElementsByTagName("entityName").getLength(); j++) {
                eNodeList.add(
                                eDirectOwnersOrSubsList.getElementsByTagName("entityName").item(j).getTextContent().replace("%", "").replace(" ", "") +
                                eDirectOwnersOrSubsList.getElementsByTagName("percentOwnership").item(j).getTextContent().replace("%", "").replace(" ", "") +
                                eDirectOwnersOrSubsList.getElementsByTagName("countryOfOperations").item(j).getTextContent().replace(" ", "")
                );
            }

            for (int j = 0; j < eDirectOwnersOrSubsList.getElementsByTagName("freeTextEntity").getLength(); j++) {
                eNodeList.add(eDirectOwnersOrSubsList.getElementsByTagName("freeTextEntity").item(j).getTextContent().replace("%", "").replace(" ", ""));
            }
            httpRequest().removeNameValuePair("name");
        }

        List aNodeList = new ArrayList();
        /* Creating a list of actual owners list by concatenating legal title, percent and country */
        for (int i = 0; i < getNodesAtLevel(level).get("aNodes").size(); i++) {
            aNodeList.add(
                            getNodesAtLevel(level).get("aLegalTitle").get(i).getText().replace("%", "").replace(" ", "") +
                            getNodesAtLevel(level).get("aPercent").get(i).getText().replace("%", "") +
                            getNodesAtLevel(level).get("aCountry").get(i).getText().replace(" ", "")
            );
        }

        verifyGraph(aNodeList, eNodeList);
    }

    public Map<String, List<WebElement>> getNodesAtLevel(String level){
        Map<String, List<WebElement>> graphElementMap = new HashMap<>();
        graphElementMap.put("aNodes", getWebElements(By.xpath(graph_level_xpath + level + ")')]")));
        graphElementMap.put("aLegalTitle", getWebElements(By.xpath(graph_level_xpath + level + ")')]" + "//*[local-name()='title']")));
        graphElementMap.put("aPercent", getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_percent_xpath)));
        graphElementMap.put("aCountry", getWebElements(By.xpath(graph_level_xpath + level + ")')]" + graph_country_xpath)));
        return graphElementMap;
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

    public void verifyGraph(List aNodeList, List eNodeList) {
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
        //waitForWebElementToAppear(graph_no_known_entities_message_text_xpath);
        waitForInMilliSeconds(3000L);
        assertEquals("No known entities.", getWebElementText(graph_no_known_entities_message_text_xpath));
        //assertFalse(isWebElementDisplayed(graph_in_product_msg_text_xpath));
        assertFalse(isWebElementDisplayed(By.xpath(graph_root_node)));
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

    public void verifySubsidiariesOfAnEntity(String legalEntity) {
        /*Adding nvpair name to get the data using the legal title*/
        nvPairs.add(new BasicNameValuePair("name", legalEntity));
        httpRequest().removeNameValuePair("fid");
        List <String> eNodeList = new ArrayList<>();
        Document eDirectOwnersList = httpRequest().getResultsFormDataBase(SUBSIDIARIES_LIST_GRAPH, nvPairs);
        for (int j = 0; j < eDirectOwnersList.getElementsByTagName("entityName").getLength(); j++) {
            eNodeList.add(
                            eDirectOwnersList.getElementsByTagName("entityName").item(j).getTextContent().replace("%", "").replace(" ", "") +
                            eDirectOwnersList.getElementsByTagName("percentOwnership").item(j).getTextContent().replace("%", "").replace(" ", "") +
                            eDirectOwnersList.getElementsByTagName("countryOfOperations").item(j).getTextContent().replace(" ", "")
            );
        }
        verifyParentChildRelationship(legalEntity, eNodeList, graph_subsidiaries_xpath);
        httpRequest().removeNameValuePair("name");
        httpRequest().removeNameValuePair("percentage");
    }

    public void verifyParentChildRelationship(String legalEntity, List eNodeList, String xpath) {
        List<String> aNodeList = new ArrayList<>();
        List<WebElement> nodes = getWebElements(By.xpath(graph_nodes_xpath));
        String id = "";
        for (int i = 0; i < nodes.size(); i++) {
            if (nodes.get(i).findElement(By.xpath(".//*[local-name()='title']")).getText().equals(legalEntity)) {
                id = nodes.get(i).getAttribute("id");
                break;
            }
        }

        List<WebElement> owners = getWebElements(By.xpath(xpath + id + "]"));
        List aLegalTitles = new ArrayList();
        for(int i=0; i<owners.size(); i++){
            String aLegalTitle = "";
            List<WebElement> legalTitle = owners.get(i).findElements(By.xpath(".//*[local-name()='title']"));
            for(int j=0; j<legalTitle.size(); j++){
                aLegalTitle = aLegalTitle.concat(legalTitle.get(j).getText());
            }
            aLegalTitles.add(aLegalTitle);
        }

        for (int i = 0; i < owners.size(); i++) {
            aNodeList.add(
                            aLegalTitles.get(i).toString().replace("%", "").replace(" ","") +
                            owners.get(i).findElement(By.xpath("." + graph_percent_xpath)).getText().replace("%", "").replace(" ","") +
                            owners.get(i).findElement(By.xpath("." + graph_country_xpath)).getText().replace(" ","")
            );
        }
        verifyGraph(aNodeList, eNodeList);
    }

    public void verifyingCountForMultipleDisplayedNodes(String legalEntity, String countValue) {
        List<WebElement> multipleNode  = getWebElements(By.xpath(graph_multiple_node_xpath));
        assertTrue(getWebElements(By.xpath(graph_multiple_node_xpath)).size()>0);
        for (int i = 0; i < multipleNode.size(); i++) {
                String entityTile = multipleNode.get(i).findElement(graph_multiple_node_title_xpath).getText();
                if (entityTile.equalsIgnoreCase(legalEntity)) {
                    String appearsCount = multipleNode.get(i).findElements(By.tagName("text")).get(3).getText();
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
            List<WebElement> multipleNode  = getWebElements(By.xpath(graph_multiple_node_xpath));
            for(int i=0;i<multipleNode.size();i++){
                String actualEntityTile = multipleNode.get(i).findElement(graph_multiple_node_title_xpath).getText();
                if(legalEntity.equalsIgnoreCase(actualEntityTile)){
                    Thread.sleep(5000L);
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
        nvPairs.add(new BasicNameValuePair("name", nodeTitle));
        List<WebElement> nodes = getWebElements(By.xpath(graph_nodes_xpath));
        for(int i=0; i<nodes.size(); i++){
            if(nodes.get(i).getText().contains(nodeTitle)){
                waitForInMilliSeconds(1500L);
                getActions().click(findElement(By.xpath(graph_nodes_xpath + "[" + Integer.toString(i+1) + "]" + "/*[local-name()='text']/*[local-name()='a']/*[local-name()='tspan']"))).perform();
            }
        }
        waitForInMilliSeconds(3000L);
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

    public void verifyOwnersOfAnEntity(String legalEntity){
        /*Adding nvpair name to get the data using the legal title*/
        nvPairs.add(new BasicNameValuePair("name", legalEntity));
        httpRequest().removeNameValuePair("fid");
        List <String> eNodeList = new ArrayList<>();
        Document eDirectOwnersList = httpRequest().getResultsFormDataBase(DIRECT_OWNERS_LIST_GRAPH, nvPairs);
        for (int j = 0; j < eDirectOwnersList.getElementsByTagName("entityName").getLength(); j++) {
            eNodeList.add(
                            eDirectOwnersList.getElementsByTagName("entityName").item(j).getTextContent().replace("%", "").replace(" ", "") +
                            eDirectOwnersList.getElementsByTagName("percentOwnership").item(j).getTextContent().replace("%", "").replace(" ", "") +
                            eDirectOwnersList.getElementsByTagName("countryOfOperations").item(j).getTextContent().replace(" ", "")
            );
        }

        for (int j = 0; j < eDirectOwnersList.getElementsByTagName("freeTextEntity").getLength(); j++) {
                            eNodeList.add(eDirectOwnersList.getElementsByTagName("freeTextEntity").item(j).getTextContent().replace("%", "").replace(" ", ""));
        }

        verifyParentChildRelationship(legalEntity, eNodeList, graph_owners_xpath);
        httpRequest().removeNameValuePair("name");
        httpRequest().removeNameValuePair("percentage");
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

    public void captureExpectedScreenShotForFullGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/e" + nodeTitle.replace(" ","") + "FullGraph.png");
    }

    public void captureActualScreenShotForFullGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/actual/a" + nodeTitle.replace(" ","") + "FullGraph.png");
    }

    public void compareSnapshotsForFullGraph(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/e" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/actual/a" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/difference/d" + nodeTitle.replace(" ","") + "FullGraph.png"));
    }

    public void captureExpectedScreenShotForOwnersGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/e" + nodeTitle.replace(" ","") + "OwnersGraph.png");
    }

    public void captureActualScreenShotForOwnersGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/actual/a" + nodeTitle.replace(" ","") + "OwnersGraph.png");
    }

    public void compareSnapshotsForOwnersGraph(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/e" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/actual/a" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/difference/d" + nodeTitle.replace(" ","") + "OwnersGraph.png"));
    }

    public void captureExpectedScreenShotForSubsGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/e" + nodeTitle.replace(" ","") + "SubsGraph.png");
    }

    public void captureActualScreenShotForSubsGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/actual/a" + nodeTitle.replace(" ","") + "SubsGraph.png");
    }

    public void compareSnapshotsForSubsGraph(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/e" + nodeTitle.replace(" ","") + "SubsGraph.png",
                        readProperties().getTestResourcePath() + "/actual/a" + nodeTitle.replace(" ","") + "SubsGraph.png",
                        readProperties().getTestResourcePath() + "/difference/d" + nodeTitle.replace(" ","") + "SubsGraph.png"));
    }

    public void verifyingHighlightIsNotDisplayedForMultipleNode() {
        waitForInMilliSeconds(3000L);
        assertFalse(isWebElementDisplayed(graph_multiple_node_highlight_xpath));
    }

    public void verifyInProductMessage() {
        assertEquals("There is UBO data available for this entity. You currently do not have access to this data, please subscribe.", getWebElementText(graph_in_product_msg_text_xpath));
    }

    public void verifyNoInProductMessage() {
        assertFalse(isWebElementDisplayed(graph_in_product_msg_text_xpath));
    }

    public void clickOnFreeText(String freeText) {
        waitForInMilliSeconds(3000L);
        getActions().click(getWebElement(By.xpath("//*[local-name()='tspan'][contains(text(),'" + freeText +"')]"))).perform();
    }

    public void verifyOwnersGraphIsZoomedOut(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aZoomedOut" + nodeTitle.replace(" ","") + "OwnersGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eZoomedOut" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aZoomedOut" + nodeTitle.replace(" ","")  + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dZoomedOut" + nodeTitle.replace(" ","") + "OwnersGraph.png"));
    }

    public void verifyOwnersGraphIsZoomedIn(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aZoomedIn" + nodeTitle.replace(" ","") + "OwnersGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eZoomedIn" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aZoomedIn" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dZoomedIn" + nodeTitle.replace(" ","") + "OwnersGraph.png"));
    }

    public void verifyOwnersGraphIsResetToOriginalPosition(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aReset" + nodeTitle.replace(" ","") + "OwnersGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eReset" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aReset" + nodeTitle.replace(" ","") + "OwnersGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dReset" + nodeTitle.replace(" ","") + "OwnersGraph.png"));
    }

    public void captureZoomedOutOwnersGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eZoomedOut" + nodeTitle.replace(" ","") + "OwnersGraphZoomOut.png");
    }

    public void captureZoomedInOwnersGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eZoomIn" + nodeTitle.replace(" ","") + "OwnersGraph.png");
    }

    public void captureResetOwnersGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eReset" + nodeTitle.replace(" ","") + "OwnersGraph.png");
    }

    public void verifySubsidiariesGraphIsZoomedOut(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aZoomedOut" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eZoomedOut" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aZoomedOut" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dZoomedOut" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png"));
    }

    public void verifySubsidiariesGraphIsResetToOriginalPosition(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aReset" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eReset" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aReset" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dReset" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png"));
    }

    public void verifySubsidiariesGraphIsZoomedIn(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aZoomedIn" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eZoomedIn" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aZoomedIn" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dZoomedIn" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png"));
    }

    public void verifyFullGraphIsZoomedOut(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aZoomedOut" + nodeTitle.replace(" ","") + "FullGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eZoomedOut" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aZoomedOut" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dZoomedOut" + nodeTitle.replace(" ","") + "FullGraph.png"));

    }

    public void verifyFullGraphIsResetToOriginalPosition(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aReset" + nodeTitle.replace(" ","") + "FullGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eReset" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aReset" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dReset" + nodeTitle.replace(" ","") + "FullGraph.png"));
    }

    public void verifyFullGraphIsZoomedIn(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        takeSnapshot("./src/test/resources/actual/aZoomedIn" + nodeTitle.replace(" ","") + "FullGraph.png");
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/eZoomedIn" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/actual/aZoomedIn" + nodeTitle.replace(" ","") + "FullGraph.png",
                        readProperties().getTestResourcePath() + "/difference/dZoomedIn" + nodeTitle.replace(" ","") + "FullGraph.png"));
    }

    public void captureZoomedOutSubsidiariesGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eZoomedOut" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png");
    }

    public void captureResetSubsidiariesGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eReset" +nodeTitle.replace(" ","") + "SubsidiariesGraph.png");
    }

    public void captureZoomedInSubsidiariesGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eZoomedIn" + nodeTitle.replace(" ","") + "SubsidiariesGraph.png");
    }

    public void captureZoomedOutFullGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eZoomedOut" + nodeTitle.replace(" "," ") + "FullGraph.png");
    }

    public void captureResetFullGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eReset" + nodeTitle.replace(" ","") + "FullGraph.png");
    }

    public void captureZoomedInFullGraph(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/eZoomedIn" + nodeTitle.replace(" ","") + "FullGraph.png");
    }

    public void clickOnShowMoreLink(String nodeTitle) {
        try{
        List<WebElement> nodes = getWebElements(By.xpath(graph_nodes_xpath));
        for(int i=0; i<nodes.size(); i++){
            if(nodes.get(i).getText().contains(nodeTitle)){
                waitForInMilliSeconds(3000L);
                assertEquals(findElement(By.xpath(graph_nodes_xpath + "[" + Integer.toString(i+1) + "]" + "/*[local-name()='text'][3]")).getText(),"Show More");
                getActions().click(findElement(By.xpath(graph_nodes_xpath + "[" + Integer.toString(i+1) + "]" + "/*[local-name()='text'][3]"))).perform();
                Thread.sleep(5000L);
                break;
            }
        }
    }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void eCaptureSubsidiariesPageTruncatedGraph(String nodeTitle) {
        nodeTitle = nodeTitle.replace(" ","");
        takeSnapshot("./src/test/resources/expected/eSubsidiariesPage"+nodeTitle+".png");
    }

    public void eCaptureOwnersPageTruncatedGraph(String nodeTitle)  {
        nodeTitle = nodeTitle.replace(" ","");
        takeSnapshot("./src/test/resources/expected/eOwners"+nodeTitle+".png");
    }

    public void verifyGraphsAreTruncatedBy5PerLogicMsg() {
        assertEquals("This graph is too large to display in full. To make this information viewable in your browser, we have removed relationships that appear multiple times or have less than 5% ownership. Click the \"show more\" link on tiles to view hidden segments in a new graph.",getWebElementText(graphs_truncated_notification_msg_xpath));

    }

    public void verifyGraphsAreTruncatedBy2500NodesLogicMsg(){
        assertEquals("This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the \"show more\" link on tiles to view hidden segments in a new graph.",getWebElementText(graphs_truncated_notification_with_node_count_msg_xpath));
    }

    public void verifySavedPDFGroupStructureGraphFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/groupStructure_graph");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "groupStructure_graph_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" + "groupStructure_graph_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/" + "groupStructure_graph_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifySavedPDFGroupStructureGraphAsListFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/groupStructure_graph");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "groupStructure_list_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" + "groupStructure_list_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/" + "groupStructure_list_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifySavedPDFOwnersGraphFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/owners_graph");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "owners_graph_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" + "owners_graph_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/"+ "owners_graph_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifySavedPDFOwnersGraphAsListFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/owners_graph");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "owners_list_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" + "owners_list_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/"+ "owners_list_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifySavedPDFSubsidiariesGraphFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/subsidiaries_graph");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "subsidiaries_graph_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" + "subsidiaries_graph_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/" + "subsidiaries_graph_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void verifySavedPDFSubsidiariesGraphAsListFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle,"/pdfs/actual/subsidiaries_graph");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "subsidiaries_list_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" + "subsidiaries_list_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/" + "subsidiaries_list_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifyGraphsAreTruncatedBy2500NodesLogicAndPdfAsAListMsg() {
        assertEquals("This graph is too large to display in full. We have removed some indirect owners to make this information viewable in your browser. Click the \"show more\" link on tiles to view hidden segments in a new graph. When downloading this information, it will be presented as a list due to the size of the graph.",getWebElementText(graphs_truncated_notification_with_node_count_msg_xpath));
    }

    public void verifyGraphsAreTruncatedBy5PerLogicAndPdfAsAListMsg() {
        assertEquals("This graph is too large to display in full. To make this information viewable in your browser, we have removed relationships that appear multiple times or have less than 5% ownership. Click the \"show more\" link on tiles to view hidden segments in a new graph. When downloading this information, it will be presented as a list due to the size of the graph.", getWebElementText(graphs_truncated_notification_with_node_count_msg_xpath));
    }
}
