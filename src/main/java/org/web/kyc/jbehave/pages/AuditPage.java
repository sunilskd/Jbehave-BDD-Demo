package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;
import static org.web.kyc.xqueries.XQueryEnum.AUDIT_INFORMATION;

public class AuditPage extends WebDriverUtils {

    private By display_audit_information_text_xpath = By.xpath("//*[@id='toggle-audit-info'] /span[1]");
    private By hide_audit_information_text_xpath = By.xpath("//*[@id='toggle-audit-info'] /span[2]");
    private By audit_action_text_xpath = By.xpath("//table[@class='audit']/tbody/tr[@class='ng-scope']/td[1]");
    private By audit_date_text_xpath = By.xpath("//table[@class='audit']/tbody/tr[@class='ng-scope']/td[2]");
    private By audit_information_header_text_xpath= By.xpath("//table[@class='audit']/caption");
    private By audit_action_header_text_xpath= By.xpath("//table[@class='audit']/thead/tr/th[1]");
    private By audit_date_header_text_xpath= By.xpath("//table[@class='audit']/thead/tr/th[2]");
    private By no_audit_information_message_text_xpath = By.xpath("//table[@class='audit']/tbody/tr/td[1]");

    public AuditPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void clickOnDisplayAuditInformationLink(){
        clickOnWebElement(display_audit_information_text_xpath);
        waitForWebElementToAppear(hide_audit_information_text_xpath);
        assertEquals("Hide Audit Information", getWebElementText(hide_audit_information_text_xpath));
    }

    public void dVerifyAuditInformation() {
        waitForInMilliSeconds(1000L);
        assertEquals("ACTION", getWebElementText(audit_action_header_text_xpath));
        assertEquals("DATE", getWebElementText(audit_date_header_text_xpath));
        Document eAuditInformation = httpRequest().getResultsFormDataBase(AUDIT_INFORMATION, nvPairs);
        List<WebElement> aAuditAction = getWebElements(audit_action_text_xpath);
        List<WebElement> aAuditDate = getWebElements(audit_date_text_xpath);
        assertEquals("Audit Title for Legal Entity mismatch", eAuditInformation.getElementsByTagName("auditInfo").item(0).getTextContent(),getWebElementText(audit_information_header_text_xpath));
        assertEquals("Audit Information mismatch", eAuditInformation.getElementsByTagName("action").getLength(), aAuditAction.size());
        for(int i=0; i<aAuditAction.size(); i++) {
            assertEquals("Audit Action does not match at" + i, eAuditInformation.getElementsByTagName("action").item(i).getTextContent(), aAuditAction.get(i).getText());
            assertEquals("Audit Date does not match at" + i, eAuditInformation.getElementsByTagName("date").item(i).getTextContent(), aAuditDate.get(i).getText());
        }
    }

    public void verifyNoAuditInformationAvailableMsg() {
        waitForWebElementToAppear(no_audit_information_message_text_xpath);
        assertEquals("No audit information available.", getWebElementText(no_audit_information_message_text_xpath));
    }

    public void clickOnHideAuditInformationLink(){
        waitForWebElementToAppear(hide_audit_information_text_xpath);
        clickOnWebElement(hide_audit_information_text_xpath);
    }

    public void dVerifyAuditSectionCollapse(){
        assertEquals("Display Audit Information", getWebElementText(display_audit_information_text_xpath));
    }
}
