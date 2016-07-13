package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class EntityDetailsSteps {
    private final PageObject pageObject;

    public EntityDetailsSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the entity details tab")
    public void clickOnEntityDetailsTab(){
        pageObject.entityDetailsPage().clickOnEntityDetailsTab();
    }

    @Then("the user should see the identifiers with giin, lei, sorted alphabetically by issuer name, and fatca status for the selected institution in the entity details page")
    public void dVerifyIdentifiers(){
        pageObject.entityDetailsPage().dVerifyIdentifiers();
    }

    @Then("the user should see the headers with institution legal title and bankers almanac id in entity details page")
    public void dVerifyEntityDetailsHeader(){
        pageObject.entityDetailsPage().dVerifyEntityDetailsHeader();
    }

    @Then("the user should see the headers with institution legal title <legalTitle> and bankers almanac id <bankersAlmanacId> in entity details page")
    public void sVerifyEntityDetailsHeader(@Named("legalTitle") String legalTitle,@Named("bankersAlmanacId") String bankersAlmanacId){
        pageObject.entityDetailsPage().sVerifyEntityDetailsHeader(legalTitle,bankersAlmanacId);
    }

    @Then("the user should see the summary with head office address (address line1 line2 line3 line 4, city, area, subarea, country) respecting the useInAddress flag for the selected institution in the entity details page")
    public void dVerifyEntityDetailsSummary(){
        pageObject.entityDetailsPage().dVerifyEntityDetailsSummary();
    }

    @Then("the user should see the summary with head office address <headOfficeAddress> respecting the useInAddress flag for the selected institution in the entity details page")
    public void sVerifyHeadOfficeAddress(@Named("headOfficeAddress") String headOfficeAddress){
        pageObject.entityDetailsPage().sVerifyHeadOfficeAddress(headOfficeAddress);
    }

    @Then("the user should see the identifiers with giin <giin> and fatca status <fatcaStatus> for the selected institution in the entity details page")
    public void sVerifyGiinAndFatcaStatus(@Named("giin") String giin,@Named("fatcaStatus") String fatcaStatus) {
        pageObject.entityDetailsPage().sVerifyGiinAndFatcaStatus(giin,fatcaStatus);
    }

    @Then("the user should see the identifiers with below leis, sorted alphabetically by issuer name, in the entity details page $leisExamTable")
    public void sVerifyLeis(ExamplesTable leisExamTable){
        pageObject.entityDetailsPage().sVerifyLeis(leisExamTable);
    }

    @Then("the user should see the list of swift bics sorted first by length (short to long) then by alpha-numerically in the entity details page")
    public void dVerifySwiftBicList(){
        pageObject.entityDetailsPage().dVerifySwiftBicList();
    }

    @Then("the user should see the swift bic list sorted first by length (short to long) then by alpha-numerically in the entity details page $swiftBicExampleTable")
    public void sVerifySwiftBicList(ExamplesTable swiftBicExampleTable){
        pageObject.entityDetailsPage().sVerifySwiftBicList(swiftBicExampleTable);
    }

    @Then("the user should see the list of stock exchanges first by primary,then alphabetically by stock exchange name in the entity details page")
    public void dVerifyStockExchangeInformation(){
        pageObject.entityDetailsPage().dVerifyStockExchangeInformation();
    }

    @Then("the user should see the list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name in the entity details page")
    public void dVerifyStockAndTickerSymbol(){
        pageObject.entityDetailsPage().dVerifyStockAndTickerSymbol();
    }

    @Then("the user should see regulators information, sorted by alphabetically in the entity details page")
    public void dVerifyRegulatorsList(){
        pageObject.entityDetailsPage().dVerifyRegulatorsList();
    }

    @Then("the user should see the below list of stock symbols with ticker symbols, first by primary then alphabetically by stock exchange name in the entity details page $stockSymbolExamTable")
    public void sVerifyStockAndTickerSymbol(ExamplesTable stockSymbolExamTable){
        pageObject.entityDetailsPage().sVerifyStockAndTickerSymbol(stockSymbolExamTable);
    }

    @Then("the user should see the below list of stock exchanges first by primary,then alphabetically by stock exchange name in the entity details page $stockExchangeExamTable")
    public void sVerifyStockExchangeInformation(ExamplesTable stockExchangeExamTable){
        pageObject.entityDetailsPage().sVerifyStockExchangeInformation(stockExchangeExamTable);
    }

    @Then("the user should see regulators information, sorted alphabetically in the entity details page $regulatorsExamTable")
    public void sVerifyRegulators(ExamplesTable regulatorsExamTable){
        pageObject.entityDetailsPage().sVerifyRegulators(regulatorsExamTable);
    }

    @When("the user captures the expected snapshot for the entity details page")
    public void eCaptureEntityDetailsPage(){
        pageObject.entityDetailsPage().eCaptureEntityDetailsPage();
    }

    @When("the user captures the actual snapshot for the entity details page")
    public void aCaptureEntityDetailsPage(){
        pageObject.entityDetailsPage().aCaptureEntityDetailsPage();
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for entity details page")
    public void compareSnapshotsForEntityDetails(){
        pageObject.entityDetailsPage().compareSnapshotsForEntityDetails();
    }

    @Then("the user should see website information in the summary section of entity details page")
    public void dVerifyWebsiteInfo(){
        pageObject.entityDetailsPage().dVerifyWebsiteInfo();
    }

    @Then("the user should see website information <website> in the summary section of entity details page")
    public void sVerifyWebsiteInfo(@Named("website") String website){
        pageObject.entityDetailsPage().sVerifyWebsiteInfo(website);
    }

    @When("the user clicks on <website> link in the entity details section")
    @Alias("the user clicks on <website> link in the entity details section of side panel")
    public void clickWebsiteUrl(@Named("website") String footerLink){pageObject.commonUtils().verifyFooterLinks(footerLink);
    }
}