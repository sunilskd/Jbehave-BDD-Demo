package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class SubsidiariesGraphPage extends WebDriverUtils {

    private By subsidiaries_graph_header_text_xpath = By.xpath("//*[@id='content-view']/h1");
    private String subsidiaries_graph_level_xpath = "//*[contains(@transform,',";
    private String subsidiaries_graph_legal_title_xpath = "')]//*[local-name()='text'][1]";
    private By subsidiaries_graph_no_subs_message_text_xpath = By.xpath("//*[@id='content-view']/p");

    public SubsidiariesGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifySubsidiariesGraphRootNode(String legalEntity) {
        verifySubsGraphHeader();
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

    public void verifyNoSubsidiariesMsg() {
        verifySubsGraphHeader();
        waitForWebElementToAppear(subsidiaries_graph_no_subs_message_text_xpath);
        try {
            Thread.sleep(3000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        assertEquals("No known entities.", getWebElementText(subsidiaries_graph_no_subs_message_text_xpath));
    }
    public void verifySubsGraphHeader() {
        waitForWebElementToAppear(subsidiaries_graph_header_text_xpath);
        assertEquals("Subsidiary Graph", getWebElementText(subsidiaries_graph_header_text_xpath));
    }

    public void verifySubsidiariesAreHighlightedForSelectedCountry(ExamplesTable subsidiariesHighlightedExamTable) {
        List<WebElement> webElements= findElements(By.xpath("//*[local-name()='g']"));
        /* Looping through all the nodes*/
        for (int i=1; i<webElements.size(); i++){
            /* Looping through the expected highlight list */
            for(int j=0; j<subsidiariesHighlightedExamTable.getRowCount(); j++){
                if(webElements.get(i).getText().contains(subsidiariesHighlightedExamTable.getRow(j).get(subsidiariesHighlightedExamTable.getHeaders().get(0)))){
                    try {
                        //assertTrue(isWebElementDisplayed(By.xpath("//*[local-name()='g'][" + i + "]/*[local-name()='rect'][contains(@class,'country-highlight')]")));
                        assertEquals("true",isWebElementDisplayed(By.xpath("//*[local-name()='g'][" + i + "]/*[local-name()='rect'][contains(@class,'country-highlight')]")));
                        System.out.println(isWebElementDisplayed(By.xpath("//*[local-name()='g'][" + i + "]/*[local-name()='rect'][contains(@class,'country-highlight')]")));
                        System.out.println(getWebElementText(By.xpath("//*[local-name()='g'][" + i + "]/*[local-name()='text'][1]")));
                        System.out.println("//*[local-name()='g'][" + i + "]/*[local-name()='rect'][contains(@class,'country-highlight')]");
                        System.out.println(subsidiariesHighlightedExamTable.getRow(j).get(subsidiariesHighlightedExamTable.getHeaders().get(0)));
                    } catch (Throwable e){
                        e.printStackTrace();
                    }
            }
        }
    }
}
}
