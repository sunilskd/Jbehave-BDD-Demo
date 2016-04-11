package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;

public class Pages {

    private final WebDriverProvider driverProvider;
    private OwnersPage ownersPage;
    private Common common;
    private SubsidiariesPage subsidiariesPage;
    private EntityDetailsPage entityDetailsPage;

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

    public SubsidiariesPage subsidiariesPage(){
        if(subsidiariesPage == null){
            subsidiariesPage = new SubsidiariesPage(driverProvider);
        }
        return subsidiariesPage;
    }

    public EntityDetailsPage entityDetailsPage(){
        if(entityDetailsPage == null){
            entityDetailsPage = new EntityDetailsPage(driverProvider);
        }
        return entityDetailsPage;
    }

}
