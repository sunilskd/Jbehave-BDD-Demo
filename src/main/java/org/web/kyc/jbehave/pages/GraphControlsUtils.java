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
    private By graph_highlight_in_graph_header_text_xpath = By.xpath("//div[@kyc-country-dropdown-control='']/h2");
    private By graph_filter_direct_relationship_only_label_xpath = By.xpath("//div[@kyc-direct-toggle-control='']/div");
    private String graph_filter_direct_relationship_only_xpath = "//*[@kyc-direct-toggle-control='']//input";
    private By graph_percent_slider_bar_xpath = By.xpath("//div[@kyc-percent-text-range-control=''] //input[@type='range']");
    private By graph_percent_filter_text_box_xpath = By.xpath("//div[@kyc-percent-text-range-control=''] //input[@type='text']");
    private By graph_percent_filter_label_xpath = By.xpath("//div[@kyc-percent-text-range-control='']/h2");
    private By graph_ubo_filter_checkbox_xpath = By.xpath("//*[@kyc-ubo-toggle-control='']//input");
    private By graph_ubo_filter_label_xpath = By.xpath("//div[@kyc-ubo-toggle-control='']/div");
    private By graph_ubo_filter_checkbox_unchecked_state_xpath = By.xpath("//*[@kyc-ubo-toggle-control='']//input[@value='false']");
    private By graph_ubo_filter_checkbox_disabled_xpath = By.xpath("//*[@kyc-ubo-toggle-control='']//input[@disabled='disabled']");
    private By graph_zoom_label_xpath = By.xpath("//*[@kyc-zoom-percent-control='']/h2");
    private By graph_zoom_icon_xpath = By.xpath("//*[@kyc-zoom-percent-control=''] //span");
    private By graph_zoom_info_xpath = By.xpath("//*[@kyc-zoom-percent-control=''] //span/p");
    private By graph_zoom_minus_sign_xpath = By.xpath("//button[@name='zoom-out']");
    private By graph_zoom_plus_sign_xpath = By.xpath("//button[@name='zoom-in']");
    private By graph_zoom_reset_sign_xpath = By.xpath("//button[@name='reset-zoom']");
    private By graph_percent_filter_icon_xpath = By.xpath("//div[@kyc-percent-text-range-control=''] //span");
    private By graph_percent_filter_info_xpath = By.xpath("//div[@kyc-percent-text-range-control=''] //span/p");
    private By graph_country_highlight_icon_xpath = By.xpath("//div[@kyc-country-dropdown-control=''] //span");
    private By graph_country_highlight_info_xpath = By.xpath("//div[@kyc-country-dropdown-control=''] //span/p");

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
        assertEquals("HIGHLIGHT TILES IN GRAPH", getWebElementText(graph_highlight_in_graph_header_text_xpath));
    }

    public void selectCountryHighlightInGraphs(String country) {
        Select dropDown = new Select(getWebElement(graph_country_highlight_drop_down_xpath));
        dropDown.selectByVisibleText(country);
    }

    public void verifyingDirectRelationshipOnlyFilterIsUnchecked() {
        assertEquals("Display direct relationships only", getWebElementText(graph_filter_direct_relationship_only_label_xpath));
        assertTrue(isWebElementDisplayed(By.xpath(graph_filter_direct_relationship_only_xpath + "[@class='ng-pristine ng-valid']")));
    }

    public void clickOnDirectRelationshipCheckbox() {
        waitForInMilliSeconds(3000L);
        clickOnWebElement(By.xpath(graph_filter_direct_relationship_only_xpath));
    }

    public void verifyPercentFilterIsSetToZero() {
        waitForWebElementToAppear(graph_percent_slider_bar_xpath);
        assertEquals("DISPLAY OWNERSHIP PERCENTAGE", getWebElementText(graph_percent_filter_label_xpath));
        assertEquals("0", getWebElementsAttributeValue(graph_percent_slider_bar_xpath, "value").get(0));
        assertEquals("0", getWebElementsAttributeValue(graph_percent_filter_text_box_xpath, "value").get(0));
    }

    public void verifyPercentFilterIsSetToHundred() {
        waitForWebElementToAppear(graph_percent_slider_bar_xpath);
        assertEquals("DISPLAY OWNERSHIP PERCENTAGE", getWebElementText(graph_percent_filter_label_xpath));
        assertEquals("100", getWebElementsAttributeValue(graph_percent_slider_bar_xpath, "value").get(0));
        assertEquals("100", getWebElementsAttributeValue(graph_percent_filter_text_box_xpath, "value").get(0));
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
        assertEquals("Highlight Ultimate Beneficial Owners", getWebElementText(graph_ubo_filter_label_xpath));
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

    public void verifyZoomOption() {
        assertEquals("GRAPH ZOOM", getWebElementText(graph_zoom_label_xpath));
    }

    public void hoverCursorOverIconForZoom() {
        moveMouseTo(graph_zoom_icon_xpath);
    }

    public void hoverCursorOverIconForPercentFilter(){
        moveMouseTo(graph_percent_filter_icon_xpath);
    }

    public void verifyZoomInfo() {
        assertEquals("Use your mousewheel or zoom controls to resize the graph. Reset to fit graph within window. Click and drag graph with your cursor to move.",
                getWebElementText(graph_zoom_info_xpath));
    }

    public void clickOnMinusSign() {
        clickOnWebElement(graph_zoom_minus_sign_xpath);
    }

    public void clickOnPlusSign() {
        clickOnWebElement(graph_zoom_plus_sign_xpath);
    }

    public void clickOnResetButton() {
        clickOnWebElement(graph_zoom_reset_sign_xpath);
    }

    public void hoverCursorOverIconForCountryHighlight() {
        moveMouseTo(graph_country_highlight_icon_xpath);
    }

    public void verifyPercentFilterInfo() {
        assertEquals("Display ownership greater than or equal to the value shown. Use slider or input to change the percentage.",
                getWebElementText(graph_percent_filter_info_xpath));
    }

    public void verifyCountryHighlightInfo() {
        assertEquals("Use these tools to highlight tiles within the graph. Click directly on tiles to highlight multiple appearances, and click on entity names for additional information.",
                getWebElementText(graph_country_highlight_info_xpath));
    }
}
