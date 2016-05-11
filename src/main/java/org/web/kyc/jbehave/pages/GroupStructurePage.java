package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class GroupStructurePage extends WebDriverUtils {

    private By group_structure_tab_xpath = By.xpath("//*[@id='content-subnavigation'] //li[1]");
    private String group_structure_majority_owners_text_xpath = "//li[ul/li/div[div[contains(a[@class='ng-binding'],'";

    public GroupStructurePage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnGroupStructureTab() {
        clickOnWebElement(group_structure_tab_xpath);
    }

    public void sVerifyMajorityOwners(String institutionName, ExamplesTable majorityOwnersExamTable) {
        List<WebElement> aMajorityOwnersList = getWebElements(By.xpath(group_structure_majority_owners_text_xpath + institutionName + "')]]]/div/div/a"));
        List<WebElement> aCountryNameList = getWebElements(By.xpath(group_structure_majority_owners_text_xpath + institutionName + "')]]]/div/div[2]"));
        List<WebElement> aPercentageOwnedList = getWebElements(By.xpath(group_structure_majority_owners_text_xpath + institutionName + "')]]]/div/div[3]"));
        for(int i=0; i<majorityOwnersExamTable.getRowCount(); i++){
            assertEquals("Legal Title does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(0)), aMajorityOwnersList.get(i).getText());
            assertEquals("Country Name does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(1)), aCountryNameList.get(i).getText());
            assertEquals("Percentage Owned does not match at " + i, majorityOwnersExamTable.getRow(i).get(majorityOwnersExamTable.getHeaders().get(2)), aPercentageOwnedList.get(i).getText());
        }
    }

    public void sVerifySubsidiaries() {
        
    }
}
