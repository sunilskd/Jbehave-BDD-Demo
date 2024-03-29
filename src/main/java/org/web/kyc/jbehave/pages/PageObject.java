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
    private GraphsPage graphsPage;
    private GraphControlsUtils graphControlsUtils;
    private SidePanelUtils sidePanelUtils;
    private ErrorScreenPage errorScreenPage;
    private BAIntegrationPage baIntegrationPage;

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

    public GraphsPage graphsPage(){
        if(graphsPage == null){
            graphsPage = new GraphsPage(driverProvider);
        }
        return graphsPage;
    }

    public GraphControlsUtils graphControlsUtils(){
        if(graphControlsUtils == null){
            graphControlsUtils = new GraphControlsUtils(driverProvider);
        }
        return graphControlsUtils;
    }

    public SidePanelUtils sidePanelUtils(){
        if(sidePanelUtils == null){
            sidePanelUtils = new SidePanelUtils(driverProvider);
        }
        return sidePanelUtils;
    }

    public ErrorScreenPage errorScreenPage(){
        if(errorScreenPage == null){
            errorScreenPage = new ErrorScreenPage(driverProvider);
        }
        return errorScreenPage;
    }

    public BAIntegrationPage baIntegrationPage(){
        if(baIntegrationPage == null){
            baIntegrationPage = new BAIntegrationPage(driverProvider);
        }
        return baIntegrationPage;
    }

}
