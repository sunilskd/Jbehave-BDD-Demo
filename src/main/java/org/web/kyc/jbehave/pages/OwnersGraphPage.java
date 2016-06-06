package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class OwnersGraphPage extends WebDriverUtils {
    private String owners_graph_level_xpath = "//*[contains(@transform,',";
    private String owners_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private By owners_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private String owners_graph_multiple_node_xpath = ".//div[@class='graph-container']//*[contains(@class,'multiple')]";
    private By owners_graph_multiple_node_title_xpath = By.xpath(".//*[local-name()='text']/*[local-name()='title']");
    private By owners_graph_multiple_node_non_entity_xpath = By.xpath(".//*[@class='node own others']");
    private By owners_graph_multiple_node_highlight_xpath = By.xpath("//*[contains(@class,'highlight-multiple')]");
    private By owners_graph_side_panel_free_text_xpath = By.xpath("//div[3]/div/p");
    private By owners_graph_non_multiple_nodes_list_xpath = By.xpath(".//*[@class='node own bank']");
    private By owners_graph_person_nodes_list_xpath = By.xpath(".//*[@class='node own person']");

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

    public void verifyingCountForMultipleDiplayedNodes(String legalEntityTitle, String countValue) {
        List<WebElement> multipleNode  = getWebElements(By.xpath(owners_graph_multiple_node_xpath));
        for(int i=0;i<multipleNode.size();i++){
          String entityTile = multipleNode.get(i).findElement(owners_graph_multiple_node_title_xpath).getText();
            if(entityTile.equalsIgnoreCase(legalEntityTitle)){
                String appearsCount = multipleNode.get(i).findElements(By.tagName("text")).get(2).getText();
                assertEquals(appearsCount,countValue);
            }
        }
    }

    public void selectingNodeToBeClicked(String expectedEntityTile){
        List<WebElement> multipleNode  = getWebElements(By.xpath(owners_graph_multiple_node_xpath));
        for(int i=1;i<=multipleNode.size();i++){
            String actualEntityTile = multipleNode.get(i).findElement(owners_graph_multiple_node_title_xpath).getText();
            if(expectedEntityTile.equalsIgnoreCase(actualEntityTile)){
                getActions().click(multipleNode.get(i)).build().perform();
                break;
            }
        }
    }

    public void verifyingHighLightDisplayedForMultipleNode(String expectedEntityTitle) {
        List<WebElement> highlightNodesList = getWebElements(owners_graph_multiple_node_highlight_xpath);
        for (int j = 0; j < highlightNodesList.size(); j++) {
            String highlightedNodesTitle = highlightNodesList.get(j).findElement(owners_graph_multiple_node_title_xpath).getText();
            assertEquals(highlightedNodesTitle, expectedEntityTitle);
        }
    }

    public void verifyFreeTextInSidePanel(ExamplesTable freeTextExampleTable){
        String aDirectOwnerFreeText = getWebElementText(owners_graph_side_panel_free_text_xpath);
        assertEquals(freeTextExampleTable.getRow(0).get(freeTextExampleTable.getHeaders().get(0)), aDirectOwnerFreeText.replace("%",""));
    }

    public void verifyingVisualIndicatorNotDisplayedForSingleLegalEntity(String entityType) {
        List<WebElement> nodes = getWebElements(owners_graph_non_multiple_nodes_list_xpath);
        comparingAndExtractingTitle(entityType, nodes);
    }

    public void verifyingVisualIndicatorNotDisplayedForEntityDiffFid(String entityType){
        List<WebElement> personNodes = getWebElements(owners_graph_person_nodes_list_xpath);
        comparingAndExtractingTitle(entityType, personNodes);
    }

    public void verifyIndicatorNotDisplayed(String entity) {
        List<WebElement> entityNodes = getWebElements(owners_graph_multiple_node_non_entity_xpath);
        comparingAndExtractingTitle(entity, entityNodes);
    }

    private void comparingAndExtractingTitle(String entityType, List<WebElement> nodes) {
        for(WebElement node : nodes){
            if(entityType.equalsIgnoreCase(node.findElement(owners_graph_multiple_node_title_xpath).getText())){
                String appearsCount = node.findElements(By.tagName("text")).get(2).getText();
                assertTrue(appearsCount.isEmpty());
                break;
            }
        }
    }

}
