package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.io.IOException;
import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.comparator.Comparator.compareImages;
import static org.web.kyc.comparator.PDFComparator.comparePDFsContent;
import static org.web.kyc.jbehave.pages.CommonUtils.selectedCountryHighlight;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class GroupStructurePage extends WebDriverUtils {

    private By group_structure_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[1]");
    private String group_structure_majority_owners_text_xpath = ".//ul[li/div/div/a='";
    private String group_structure_subsidiaries_text_xpath = ".//div[div/a='";
    private By group_structure_countries_list_text_xpath = By.xpath("//div[@class='location']");
    private By group_structure_country_highlight_list_text_xpath = By.xpath("//*[@id='content-filters'] //div[h2='Highlight']/ul/li");
    private By group_structure_entities_highlighted_xpath = By.xpath("//div[contains(@class, 'highlight')]");
    private String group_structure_row_for_country_xpath ="//div[@class='item highlight'][div[@class='location']='";
    private By group_structure_legal_entity_highlight_xpath = By.xpath("//div[contains(@class,'entity focus')]");
    private By group_structure_ultimate_owner_text_xpath = By.xpath("//*[@id='content-view']/h2");
    private String group_structure_focused_entity_subsidiaries_text_xpath = ".//div[div='";
    private String group_structure_ultimate_owner_subsidiaries_text_xpath = "//*[@id='group-structure']";
    private String group_structure_focused_entity_owners_text_xpath = ".//ul[li/div/div='";
    private By content_filter = By.xpath("//*[@id='content-filters']");
    private By group_structure_header_text_xpath = By.xpath("//*[@id='content-view'] //h1");

    public GroupStructurePage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnGroupStructureTab() {
        clickOnWebElement(group_structure_tab_xpath);
        waitForPageToLoad(15000L);
    }

    public void sVerifyMajorityOwners(String institutionName, ExamplesTable majorityOwnersExamTable) {
        List<WebElement> aMajorityOwnersList = getWebElements(By.xpath(group_structure_majority_owners_text_xpath + institutionName + "']/preceding-sibling::div/div/a"));
        List<WebElement> aCountryNameList = getWebElements(By.xpath(group_structure_majority_owners_text_xpath + institutionName + "']/preceding-sibling::div/div[@class='location']"));
        List<WebElement> aPercentageOwnedList = getWebElements(By.xpath(group_structure_majority_owners_text_xpath + institutionName + "']/preceding-sibling::div/div[@class='percentage']"));
        for(int i=0; i<majorityOwnersExamTable.getRowCount(); i++){
            assertEquals("Legal Title does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(0)), aMajorityOwnersList.get(i).getText());
            assertEquals("Country Name does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(1)), aCountryNameList.get(i).getText());
            if(!majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage Owned does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(2)) + "%", aPercentageOwnedList.get(i).getText());
            }
        }
    }

    public void sVerifySubsidiaries(String institutionName, ExamplesTable subsidiariesExamTable) {
        List<WebElement> aSubsidiariesList = getWebElements(By.xpath(group_structure_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div/a"));
        List<WebElement> aCountryNameList = new ArrayList<>();
        if(isWebElementDisplayed(By.xpath(group_structure_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div[@class='location']"))) {
            aCountryNameList = getWebElements(By.xpath(group_structure_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div[@class='location']"));
        }
        List<WebElement> aPercentageOwnedList = getWebElements(By.xpath(group_structure_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div[@class='percentage']"));
        for(int i=0; i<subsidiariesExamTable.getRowCount(); i++){
            assertEquals("Legal Title does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(0)), aSubsidiariesList.get(i).getText());
            if(!subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(1)).isEmpty()) {
                assertEquals("Country Name does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(1)), aCountryNameList.get(i).getText());
            }
            if(!subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage Owned does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(2)) + "%", aPercentageOwnedList.get(i).getText());
            }
        }
    }

    public void sVerifyMajorityOwnersForFocusedEntity(String institutionName, ExamplesTable majorityOwnersExamTable) {
        List<WebElement> aMajorityOwnersList = getWebElements(By.xpath(group_structure_focused_entity_owners_text_xpath + institutionName + "']/preceding-sibling::div/div/a"));
        List<WebElement> aCountryNameList = getWebElements(By.xpath(group_structure_focused_entity_owners_text_xpath  + institutionName + "']/preceding-sibling::div/div[@class='location']"));
        List<WebElement> aPercentageOwnedList = getWebElements(By.xpath(group_structure_focused_entity_owners_text_xpath  + institutionName + "']/preceding-sibling::div/div[@class='percentage']"));
        for(int i=0; i<majorityOwnersExamTable.getRowCount(); i++){
            assertEquals("Legal Title does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(0)), aMajorityOwnersList.get(i).getText());
            assertEquals("Country Name does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(1)), aCountryNameList.get(i).getText());
            if(!majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage Owned does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(2)) + "%", aPercentageOwnedList.get(i).getText());
            }
        }
    }

    public void sVerifySubsidiariesForFocusedEntity(String institutionName, ExamplesTable subsidiariesExamTable) {
        List<WebElement> aSubsidiariesList = getWebElements(By.xpath(group_structure_focused_entity_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div/a"));
        List<WebElement> aCountryNameList = new ArrayList<>();
        if(isWebElementDisplayed(By.xpath(group_structure_focused_entity_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div[@class='location']"))) {
            aCountryNameList = getWebElements(By.xpath(group_structure_focused_entity_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div[@class='location']"));
        }
        List<WebElement> aPercentageOwnedList = getWebElements(By.xpath(group_structure_focused_entity_subsidiaries_text_xpath + institutionName + "']/following-sibling::ul/li/div/div[@class='percentage']"));
        for(int i=0; i<subsidiariesExamTable.getRowCount(); i++){
            assertEquals("Legal Title does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(0)), aSubsidiariesList.get(i).getText());
            if(!subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(1)).isEmpty()) {
                assertEquals("Country Name does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(1)), aCountryNameList.get(i).getText());
            }
            if(!subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage Owned does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(2)) + "%", aPercentageOwnedList.get(i).getText());
            }
        }
    }

    public void sVerifySubsidiariesForUltimateOwner(ExamplesTable subsidiariesExamTable) {
        List<WebElement> aSubsidiariesList = getWebElements(By.xpath(group_structure_ultimate_owner_subsidiaries_text_xpath + "/ul/li/div/div/a"));
        List<WebElement> aCountryNameList = new ArrayList<>();
        if(isWebElementDisplayed(By.xpath(group_structure_ultimate_owner_subsidiaries_text_xpath + "/ul/li/div/div[@class='location']"))) {
            aCountryNameList = getWebElements(By.xpath(group_structure_ultimate_owner_subsidiaries_text_xpath + "/ul/li/div/div[@class='location']"));
        }
        List<WebElement> aPercentageOwnedList = getWebElements(By.xpath(group_structure_ultimate_owner_subsidiaries_text_xpath + "/ul/li/div/div[@class='percentage']"));
        for(int i=0; i<subsidiariesExamTable.getRowCount(); i++){
            assertEquals("Legal Title does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(0)), aSubsidiariesList.get(i).getText());
            if(!subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(1)).isEmpty()) {
                assertEquals("Country Name does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(1)), aCountryNameList.get(i).getText());
            }
            if(!subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(2)).isEmpty()) {
                assertEquals("Percentage Owned does not match at " + i, subsidiariesExamTable.getRow(i).get(subsidiariesExamTable.getHeaders().get(2)) + "%", aPercentageOwnedList.get(i).getText());
            }
        }
    }

    public void clickOnLegalEntityInGroupStructure(String legalEntity) {
        clickOnWebElement(By.linkText(legalEntity));
    }

    public void verifyCountryHighlightListInGroupStructure() {
        Set<String> eCountryHighlightSet = new TreeSet<>();
        List<String> eCountryHighlightList = new ArrayList<>();
        List<WebElement> eCountryHighlightElements = getWebElements(group_structure_countries_list_text_xpath);
        List<String> aCountryHighlightList = getWebElementsText(group_structure_country_highlight_list_text_xpath);

        /* Creating a set of unique countries from the countries appearing in the group structure */
        for(int i=0; i<eCountryHighlightElements.size(); i++){
            eCountryHighlightSet.add(eCountryHighlightElements.get(i).getText());
        }

        /* Sorting expected country highlight list */
        eCountryHighlightList.addAll(eCountryHighlightSet);
        Collections.sort(eCountryHighlightList, String.CASE_INSENSITIVE_ORDER);

        Iterator eIterator = eCountryHighlightList.iterator();
        Iterator aIterator = aCountryHighlightList.iterator();
        while (eIterator.hasNext()){
            assertEquals(eIterator.next(),aIterator.next());
        }
    }

    public void verifyEntitiesAreHighlighted() {
        /* Compare size of all the entities(subsidiaries+owners) highlighted for the county with all the entities that are highlighted*/

        assertEquals(
                getWebElements(group_structure_entities_highlighted_xpath).size(),
                getWebElements(By.xpath(group_structure_row_for_country_xpath + selectedCountryHighlight + "']")).size());
    }

    public void verifyEntitiesAreNotHighlighted() {
        assertFalse(isWebElementDisplayed(group_structure_entities_highlighted_xpath));
    }

    public void verifyLegalEntityIsHighlighted(String legalEntity) {
        assertEquals(legalEntity, getWebElementText(group_structure_legal_entity_highlight_xpath));
    }

    public void verifyUltimateOwner(String ultimateOwner) {
        waitForInMilliSeconds(3000L);
        assertEquals(ultimateOwner, getWebElementText(group_structure_ultimate_owner_text_xpath));
        verifyGroupStructureHeader();
    }

    public void verifyNoSubsidiariesForLegalEntity(String legalEntity) {
        assertFalse(isWebElementDisplayed(By.xpath(group_structure_subsidiaries_text_xpath + legalEntity + "']/following-sibling::div/ul/li/div/div/a")));
    }

    public void verifyNoGroupStructure() {
        assertFalse(isWebElementDisplayed(By.xpath(".//*[@id='group-structure']/ul/li")));
    }

    public void eCaptureGroupStructurePage(String nodeTitle) {
        takeSnapshot("./src/test/resources/expected/e"+ nodeTitle.replace(" ","") + "GroupStructurePage.png");
    }

    public void aCaptureGroupStructurePage(String nodeTitle) {
        takeSnapshot("./src/test/resources/actual/a" + nodeTitle.replace(" ","") + "GroupStructurePage.png");
    }

    public void compareSnapshotsForGroupStructure(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        assertTrue(
                compareImages(readProperties().getTestResourcePath() + "/expected/e" + nodeTitle.replace(" ","") + "GroupStructurePage.png",
                        readProperties().getTestResourcePath() + "/actual/a" + nodeTitle.replace(" ","") + "GroupStructurePage.png",
                        readProperties().getTestResourcePath() + "/difference/d" + nodeTitle.replace(" ","") + "GroupStructurePage.png"));
    }

    public void verifySavedPDFSubsidiariesGraphFile(String nodeTitle) {
        waitForInMilliSeconds(3000L);
        try {

            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/"+nodeTitle.replace(" ","")+"subsidiaries_graph",
                    readProperties().getTestResourcePath() + "/pdfs/actual/"+nodeTitle.replace(" ","")+"subsidiaries_graph",
                    readProperties().getTestResourcePath() + "/pdfs/difference");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifySavedPDFGroupStructureFile(String fid) {
        waitForInMilliSeconds(3000L);
        try {
            //CommonUtils.renamingDownLoadedFile(nodeTitle, "/pdfs/actual/groupStructure_summary");
            comparePDFsContent(readProperties().getTestResourcePath() + "/pdfs/expected/" + "groupStructure_summary_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/actual/" +  "groupStructure_summary_" + fid + ".pdf",
                    readProperties().getTestResourcePath() + "/pdfs/difference/" + "groupStructure_summary_" + fid + ".pdf");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void verifyNoCountryHighlights() {
        assertEquals("", getWebElementText(content_filter));

    }

    public void verifyGroupStructureHeader(){
        assertEquals("Majority Ownership Group Structure", getWebElementText(group_structure_header_text_xpath));
    }

}
