package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class SubsidiariesGraphPage extends WebDriverUtils {

    private String subsidiaries_graph_level_xpath = "//*[contains(@transform,',";
    private String subsidiaries_graph_legal_title_xpath = "')]//*[local-name()='text'][1]";

    public SubsidiariesGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifySubsidiariesGraphRootNode(String legalEntity) {
        waitForWebElementToAppear(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath));
        assertEquals(legalEntity, getWebElementText(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath)));
    }

    public void verifySubsidiariesNodes(String level, ExamplesTable subsidiariesExamTable) {
        String aLevel  = Integer.toString(Integer.parseInt(level)*180);
        List<String> aSubsidiariesList = getWebElementsText(By.xpath(subsidiaries_graph_level_xpath + aLevel + "')]"));

        List eSubsidiariesLegalTitle = new ArrayList();
        for (Map<String,String> row : subsidiariesExamTable.getRows()) {
            String legalTitle = row.get("SUBSIDIARIES");
            eSubsidiariesLegalTitle.add(legalTitle);
        }

        /* Ordering both actual and expected list as the node position changes every time a page loads */
        Collections.sort(aSubsidiariesList);
        Collections.sort(eSubsidiariesLegalTitle);

        for (int i=0; i<eSubsidiariesLegalTitle.size(); i++){
            assertEquals("Subsidiaries does not match at " + i, eSubsidiariesLegalTitle.get(i), aSubsidiariesList.get(i).replace("%",""));
        }
    }
}
