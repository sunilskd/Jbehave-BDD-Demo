package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;

public class PageObject {

    private final WebDriverProvider driverProvider;
    private OwnersPage ownersPage;
    private CommonUtils commonUtils;
    private SubsidiariesPage subsidiariesPage;
    private EntityDetailsPage entityDetailsPage;
    private AuditPage auditPage;
    private GroupStructurePage groupStructurePage;
    private SubsidiariesGraphPage subsidiariesGraphPage;
    private OwnersGraphPage ownersGraphPage;
    private FullGraphPage fullGraphPage;

    public PageObject(WebDriverProvider driverProvider) {
        this.driverProvider = driverProvider;
    }

    public OwnersPage ownersPage() {
        if (ownersPage == null) {
            ownersPage = new OwnersPage(driverProvider);
        }
        return ownersPage;
    }

    public CommonUtils commonUtils() {
        if (commonUtils == null) {
            commonUtils = new CommonUtils(driverProvider);
        }
        return commonUtils;
    }

    public SubsidiariesPage subsidiariesPage() {
        if (subsidiariesPage == null) {
            subsidiariesPage = new SubsidiariesPage(driverProvider);
        }
        return subsidiariesPage;
    }

    public EntityDetailsPage entityDetailsPage() {
        if (entityDetailsPage == null) {
            entityDetailsPage = new EntityDetailsPage(driverProvider);
        }
        return entityDetailsPage;
    }

    public AuditPage auditPage() {
        if (auditPage == null) {
            auditPage = new AuditPage(driverProvider);
        }
        return auditPage;
    }

    public GroupStructurePage groupStructurePage(){
        if(groupStructurePage == null){
            groupStructurePage = new GroupStructurePage(driverProvider);
        }
        return groupStructurePage;
    }

    public SubsidiariesGraphPage subsidiariesGraphPage(){
        if(subsidiariesGraphPage == null){
            subsidiariesGraphPage = new SubsidiariesGraphPage(driverProvider);
        }
        return subsidiariesGraphPage;
    }

    public OwnersGraphPage ownersGraphPage(){
        if(ownersGraphPage == null){
            ownersGraphPage = new OwnersGraphPage(driverProvider);
        }
        return ownersGraphPage;
    }

    public FullGraphPage fullGraphPage(){
        if(fullGraphPage == null){
            fullGraphPage = new FullGraphPage(driverProvider);
        }
        return fullGraphPage;
    }

}
