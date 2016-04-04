package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverPage;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.web.kyc.rest.HttpRequest;
import org.web.kyc.utils.ReadProperties;

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

    public String getText(By by){
        return findElement(by).getText();
    }
}
