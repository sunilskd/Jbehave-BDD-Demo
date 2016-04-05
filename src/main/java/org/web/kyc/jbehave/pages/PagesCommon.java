package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverPage;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.web.kyc.rest.HttpRequest;
import org.web.kyc.utils.ReadProperties;

import java.util.List;

/* Contains common webdriver methods to be used in page classes */

public class PagesCommon extends WebDriverPage {
    private static ReadProperties readProperties;
    private static HttpRequest httpRequest;

    public PagesCommon(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public static ReadProperties readProperties(){
        if(readProperties == null){
            readProperties = new ReadProperties();
        }
        return readProperties;
    }

    public static HttpRequest httpRequest(){
        if(httpRequest == null){
            httpRequest = new HttpRequest();
        }
        return httpRequest;
    }

    public String getWebElementText(By by){
        return findElement(by).getText();
    }

    public void clickOnWebElement(By by){
        findElement(by).click();
    }

    public List<WebElement> getWebElements(By by){
        return findElements(by);
    }

    public void waitForElementToAppear(By by) {
        try {
            WebDriverWait wait = new WebDriverWait(getDriverProvider().get(), 15);
            wait.until(ExpectedConditions.visibilityOfElementLocated(by));
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
    }
}
