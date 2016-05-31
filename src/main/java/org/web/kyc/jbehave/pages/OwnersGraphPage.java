package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class OwnersGraphPage extends WebDriverUtils {
    private String owners_graph_level_xpath = "//*[contains(@transform,',";
    private String owners_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private By owners_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private By owners_graph_Multiplenode_xpath = By.xpath(".//div[@class='graph-container']//*[contains(@class,'multiple')]");
    private By getOwners_graph_Multiplenode_title_xpath = By.xpath(".//*[local-name()='text']/*[local-name()='title']");
    private By owners_graph_Multipplenode_NonEntity_xpath = By.xpath(".//*[@class='node others']");

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
        List<WebElement> multipleNode  = findElements(owners_graph_Multiplenode_xpath);
        for(int i=0;i<multipleNode.size();i++){
            String entityTile = multipleNode.get(i).findElement(getOwners_graph_Multiplenode_title_xpath).getText();
            if(entityTile.equalsIgnoreCase(legalEntityTitle)){
                String appearsCount = multipleNode.get(i).findElements(By.tagName("text")).get(2).getText();
                assertEquals(appearsCount,countValue);
            }
        }
    }

    public void verifyIndicatorNotDisplayed(String nonEntityValue) {
    List<WebElement> nonEntityNodes = findElements(owners_graph_Multipplenode_NonEntity_xpath);
        for(int i=0;i<nonEntityNodes.size();i++){
            String entityTile = nonEntityNodes.get(i).findElement(getOwners_graph_Multiplenode_title_xpath).getText();
            if(entityTile.equalsIgnoreCase(nonEntityValue)){
                String appearsCount = nonEntityNodes.get(i).findElements(By.tagName("text")).get(2).getText();
               assertEquals (appearsCount,"");
            }
        }
    }
}
