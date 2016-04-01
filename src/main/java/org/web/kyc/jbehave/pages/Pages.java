package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;

public class Pages {

    private final WebDriverProvider driverProvider;
    private SamplePage samplePage;

    public Pages(WebDriverProvider driverProvider) {
        this.driverProvider = driverProvider;
    }

    public SamplePage samplePage(){
        if(samplePage == null){
            samplePage = new SamplePage(driverProvider);
        }
        return samplePage;
    }

}
