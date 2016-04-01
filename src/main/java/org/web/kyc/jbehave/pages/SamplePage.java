package org.web.kyc.jbehave.pages;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.jbehave.web.selenium.WebDriverPage;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.w3c.dom.Document;
import org.web.kyc.rest.HttpRequest;
import org.web.kyc.utils.ReadProperties;
import java.util.ArrayList;
import java.util.List;
import static org.web.kyc.xqueries.XQueryEnum.*;

import static org.junit.Assert.assertEquals;

public class SamplePage extends WebDriverPage {

    private ReadProperties readProperties = new ReadProperties();
    private HttpRequest httpRequest = new HttpRequest();
    private By username_text_xpath = By.xpath("//*[@id='login-form']/div[1]/label[1]");

    public SamplePage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open(){
        get(readProperties.getUrl());
    }

    public void verifyUsername(){
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("name", "Banco do Brasil SA"));
        //Document document = httpRequest.getResultsFormDataBase("qa-kyc-ubo-getEntityDetails.xqy",nvPairs);
        Document document = httpRequest.getResultsFormDataBase(ENTITY_DETAILS.getXQueryName(),nvPairs);
        assertEquals("Usernam", findElement(username_text_xpath).getText());
    }


}
