package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class GraphControlsUtils extends WebDriverUtils {

    private By graph_country_highlight_drop_down_xpath = By.xpath("//select");
    private By graph_country_highlight_list_text_xpath = By.xpath("//select/option");
    private By graph_country_highlight_header_text_xpath = By.xpath("//div[@class='graph-controls']/div[3] //label");
    private By graph_highlight_in_graph_header_text_xpath = By.xpath("//div[@class='graph-controls']/div[3] //h2");

    public GraphControlsUtils(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifyNoCountryHighlightSelection(){
        waitForWebElementToAppear(graph_country_highlight_drop_down_xpath);
        Select dropDown = new Select(getWebElement(graph_country_highlight_drop_down_xpath));
        assertEquals("No country highlight", dropDown.getFirstSelectedOption().getText());
    }

    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlightListExamTable) {
        waitForInMilliSeconds(3000L);
        verifyCountryHighlightsHeader();
        List<String> aCountryHighlightList = getWebElementsText(graph_country_highlight_list_text_xpath);
        for(int i =0; i<countriesHighlightListExamTable.getRowCount(); i++){
            assertEquals("Country list does not match at " + i, countriesHighlightListExamTable.getRow(i).get(countriesHighlightListExamTable.getHeaders().get(0)), aCountryHighlightList.get(i));
        }
    }

    public void verifyCountryHighlightsHeader() {
        assertEquals("HIGHLIGHT IN GRAPH", getWebElementText(graph_highlight_in_graph_header_text_xpath));
        assertEquals("Country", getWebElementText(graph_country_highlight_header_text_xpath));
    }

}
