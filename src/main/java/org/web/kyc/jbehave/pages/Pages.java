package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;

public class Pages {

    private final WebDriverProvider driverProvider;
    private OwnersPage ownersPage;
    private Common common;

    public Pages(WebDriverProvider driverProvider) {
        this.driverProvider = driverProvider;
    }

    public OwnersPage ownersPage(){
        if(ownersPage == null){
            ownersPage = new OwnersPage(driverProvider);
        }
        return ownersPage;
    }

    public Common common(){
        if(common == null){
            common = new Common(driverProvider);
        }
        return common;
    }

}
