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
    private String subsidiaries_graph_legal_title_xpath = "')]/*[local-name()='text']/*[local-name()='title']";
    private By subsidiaries_graph_no_subs_message_text_xpath = By.xpath("//*[@id='content-view']/p");
    private String nodes_xpath = "//*[local-name()='g']";
    private String node_highlight_xpath = "/*[local-name()='rect'][contains(@class,'country-highlight')]";
    private String subsidiaries_graph_percentage_value_text_xpath ="//*[local-name()='g'][@transform != 'translate(0,0)']/*[local-name()='text'][1]/*[local-name()='tspan']";
    private String graph_percent_filter_text_box_xpath = "//*[@id='content-view']/div[1]/div[1]/div/input[1]";

    public SubsidiariesGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifySubsidiariesGraphRootNode(String legalEntity) {
        verifySubsGraphHeader();
        waitForWebElementToAppear(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath));
        assertEquals(legalEntity, getWebElementText(By.xpath(subsidiaries_graph_level_xpath + "0" + subsidiaries_graph_legal_title_xpath)));
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

    public void verifySubsidiariesGraphPercentage() {
       //String percentageSetto = getWebElementText(By.xpath(graph_percent_filter_text_box_xpath));
        int percentageSetto =50;
        List<String> aSubsidiariesPercentageList = getWebElementsText(By.xpath(subsidiaries_graph_percentage_value_text_xpath));
        for (int i=1;i<getWebElementsText(By.xpath(subsidiaries_graph_percentage_value_text_xpath)).size();i++){
            assertTrue(percentageSetto >= Integer.parseInt(getWebElementsText(By.xpath(subsidiaries_graph_percentage_value_text_xpath)).get(i)));
        }
    }
}