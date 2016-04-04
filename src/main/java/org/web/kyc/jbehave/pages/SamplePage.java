package org.web.kyc.jbehave.pages;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;
import org.w3c.dom.Document;
import java.util.ArrayList;
import java.util.List;
import static org.web.kyc.xqueries.XQueryEnum.*;
import static org.junit.Assert.assertEquals;

public class SamplePage extends PagesCommon {

    private By username_text_xpath = By.xpath("//*[@id='login-form']/div[1]/label[1]");

    public SamplePage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void open(){
        get(readProperties().getUrl());
    }

    public void verifyUsername(){
        List<NameValuePair> nvPairs = new ArrayList<>();
        nvPairs.add(new BasicNameValuePair("fid", "1038"));
        Document document = httpRequest().getResultsFormDataBase(ENTITY_DETAILS, nvPairs);
        ArrayList<String> text = httpRequest().getElementValuesByTagName(ENTITY_DETAILS, nvPairs, "swiftBic");
        assertEquals("Usernam", getText(username_text_xpath));
    }


}
