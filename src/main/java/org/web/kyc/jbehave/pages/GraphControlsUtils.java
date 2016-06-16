package org.web.kyc.jbehave.pages;

import org.jbehave.core.model.ExamplesTable;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

public class GraphControlsUtils extends WebDriverUtils {

    private By graph_country_highlight_drop_down_xpath = By.xpath("//select");
    private By graph_country_highlight_list_text_xpath = By.xpath("//select/option");
    private By graph_country_highlight_header_text_xpath = By.xpath("//div[@class='graph-controls']/div[3] //label");
    private By graph_highlight_in_graph_header_text_xpath = By.xpath("//div[@class='graph-controls']/div[3] //h2");
    private By graph_filter_direct_relationship_only_label_xpath = By.xpath("//div[@class='graph-controls']/div[2]/div");
    private String graph_filter_direct_relationship_only_xpath = "//*[@kyc-direct-toggle-control='']//input";
    private By graph_percent_slider_bar_xpath = By.xpath("//*[@class='graph-controls'] //input[2]");
    private By graph_percent_filter_text_box_xpath = By.xpath("//*[@class='graph-controls']/div[1]/div/input[1]");
    private By graph_percent_filter_label_xpath = By.xpath("//*[@class='graph-controls']/div[1] //label");
    private By graph_display_in_graph_label_xpath = By.xpath("//*[@class='graph-controls']/div[1] //h2");
    private By graph_ubo_filter_checkbox_xpath = By.xpath("//*[@kyc-ubo-toggle-control='']//input");
    private By graph_ubo_filter_label_xpath = By.xpath("//div[@class='graph-controls']/div[4]/div");
    private By graph_ubo_filter_checkbox_unchecked_state_xpath = By.xpath("//*[@kyc-ubo-toggle-control='']//input[@class='ng-pristine ng-valid']");
    private By graph_ubo_filter_checkbox_disabled_xpath = By.xpath("//*[@kyc-ubo-toggle-control='']//input[@disabled='disabled']");

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

    public void selectCountryHighlightInGraphs(String country) {
        Select dropDown = new Select(getWebElement(graph_country_highlight_drop_down_xpath));
        dropDown.selectByVisibleText(country);
    }

    public void verifyingDirectRelationshipOnlyFilterIsUnchecked() {
        assertEquals("Direct relationships only", getWebElementText(graph_filter_direct_relationship_only_label_xpath));
        assertTrue(isWebElementDisplayed(By.xpath(graph_filter_direct_relationship_only_xpath + "[@class='ng-pristine ng-valid']")));
    }

    public void clickOnDirectRelationshipCheckbox() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(By.xpath(graph_filter_direct_relationship_only_xpath));
    }

    public void verifyPercentFilterIsSetToZero() {
        waitForWebElementToAppear(graph_percent_slider_bar_xpath);
        assertEquals("% Ownership (Greater than or equal to value)", getWebElementText(graph_percent_filter_label_xpath));
        assertEquals("DISPLAY IN GRAPH", getWebElementText(graph_display_in_graph_label_xpath));
        assertEquals("0", getWebElementsAttributeValue(graph_percent_slider_bar_xpath, "value").get(0));
    }

    public void enterPercentFilter(String percentFilter){
        waitForWebElementToAppear(graph_percent_filter_text_box_xpath);
        enterStringInInputBox(graph_percent_filter_text_box_xpath, percentFilter);
        waitForInMilliSeconds(3000L);
    }

    public void verifyNoUBOFilters() {
        assertFalse(isWebElementDisplayed(graph_ubo_filter_checkbox_xpath));
    }

    public void verifyUBOFilterIsUncheckedByDefault() {
        waitForWebElementToAppear(graph_ubo_filter_label_xpath);
        assertEquals("Ultimate Beneficial Owner", getWebElementText(graph_ubo_filter_label_xpath));
        assertTrue(isWebElementDisplayed(graph_ubo_filter_checkbox_unchecked_state_xpath));
    }

    public void clickOnUBOFilterCheckbox() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(graph_ubo_filter_checkbox_xpath);
    }

    public void changePercentOwnershipUsingSlider(int slideTo) {
        moveSliderBarTo(graph_percent_slider_bar_xpath, slideTo);
    }

    public void verifyUBOFilterIsDisabled() {
        assertTrue(isWebElementDisplayed(graph_ubo_filter_checkbox_disabled_xpath));
    }

}
