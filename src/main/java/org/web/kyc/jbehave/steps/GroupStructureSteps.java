package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

/**
 * Created by sahug on 5/11/2016.
 */
public class GroupStructureSteps {

    private final PageObject pageObject;

    public GroupStructureSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the group structure tab")
    public void clickOnGroupStructureTab() {
        pageObject.groupStructurePage().clickOnGroupStructureTab();
    }

    @Then("the user should see the majority owners for the institution $institutionName in the group structure page $majorityOwnersExamTable")
    public void sVerifyMajorityOwners(String institutionName, ExamplesTable majorityOwnersExamTable) {
        pageObject.groupStructurePage().sVerifyMajorityOwners(institutionName, majorityOwnersExamTable);
    }

    @Then("the user should see the majority owners for the focused institution $institutionName in the group structure page $majorityOwnersExamTable")
    public void sVerifyMajorityOwnersForFocusedEntity(String institutionName, ExamplesTable majorityOwnersExamTable) {
        pageObject.groupStructurePage().sVerifyMajorityOwnersForFocusedEntity(institutionName, majorityOwnersExamTable);
    }

    @Then("the user should see the indented list of subsidiaries for the institution $institutionName that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page $subsidiariesExamTable")
    public void sVerifySubsidiaries(String institutionName, ExamplesTable subsidiariesExamTable){
        pageObject.groupStructurePage().sVerifySubsidiaries(institutionName, subsidiariesExamTable);
    }

    @Then("the user should see the indented list of subsidiaries for the focused institution $institutionName that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page $subsidiariesExamTable")
    public void sVerifySubsidiariesForFocusedEntity(String institutionName, ExamplesTable subsidiariesExamTable){
        pageObject.groupStructurePage().sVerifySubsidiariesForFocusedEntity(institutionName, subsidiariesExamTable);
    }
    @When("the user clicks on the legal entity $legalEntity in group structure page")
    public void clickOnLegalEntityInGroupStructure(@Named("legalEntity") String legalEntity){
        pageObject.groupStructurePage().clickOnLegalEntityInGroupStructure(legalEntity);
    }

    @Then("the user should see the country highlight options based on the country of operations for legal entities that appear in the list, each unique country should appear only once in the option list")
    public void verifyCountryHighlightListInGroupStructure(){
        pageObject.groupStructurePage().verifyCountryHighlightListInGroupStructure();
    }

    @When("the user selects a country <country> from the country highlight list in the group structure page")
    @Alias("the user de-select previously selected country <country> by clicking on it a second time from the country highlight in the group structure page")
    public void selectCountryHighlight(@Named("country") String country){
        pageObject.commonUtils().selectCountryHighlight(country);
    }

    @When("the user selects another country <changeCountry> from the country highlight list in the group structure page")
    public void changeCountryHighlight(@Named("changeCountry") String changeCountry){
        pageObject.commonUtils().selectCountryHighlight(changeCountry);
    }

    @Then("the user should see the entities in the group structure that have the selected country of operations highlighted in the group structure page")
    public void verifyEntitiesAreHighlighted(){
        pageObject.groupStructurePage().verifyEntitiesAreHighlighted();
    }

    @Then("the user should not see the entities in the group structure that have the selected country of operations highlighted in the group structure page")
    public void verifyEntitiesAreNotHighlighted(){
        pageObject.groupStructurePage().verifyEntitiesAreNotHighlighted();
    }

    @Then("the previously selected country <country> should be de-selected in the group structure page")
    public void verifyCountryHighlightIsDeSelected(@Named("country") String deselectCountry){
        pageObject.commonUtils().verifyCountryHighlightIsDeSelected(deselectCountry);
    }

    @Then("the user should see the legal entity $legalEntity, user is currently viewing, highlighted in the group structure page")
    public void verifyLegalEntityIsHighlighted(@Named("legalEntity") String legalEntity){
        pageObject.groupStructurePage().verifyLegalEntityIsHighlighted(legalEntity);
    }

    @Then("the user should see the ultimate owner as $ultimateOwner for the entity user is viewing in the group structure page")
    public void verifyUltimateOwner(@Named("ultimateOwner") String ultimateOwner){
        pageObject.groupStructurePage().verifyUltimateOwner(ultimateOwner);
    }

    @Then("the user should not see any subsidiaries for the legal entity $legalEntity in the group structure page")
    public void verifyNoSubsidiariesForLegalEntity(@Named("legalEntity") String legalEntity){
        pageObject.groupStructurePage().verifyNoSubsidiariesForLegalEntity(legalEntity);
    }

    @Then("the user should not see any majority owners for the legal entity $legalEntity in the group structure page")
    public void verifyNoMajorityOwnersForLegalEntity(@Named("legalEntity") String legalEntity){
        pageObject.groupStructurePage().verifyNoMajorityOwnersForLegalEntity(legalEntity);
    }

    @When("the user captures the expected snapshot for the <nodeTitle> group structure page")
    public void eCaptureGroupStructurePage(@Named("nodeTitle") String nodeTitle){
        pageObject.groupStructurePage().eCaptureGroupStructurePage(nodeTitle);
    }

    @When("the user captures the actual snapshot for the <nodeTitle> group structure page")
    public void aCaptureGroupStructurePage(@Named("nodeTitle") String nodeTitle){
        pageObject.groupStructurePage().aCaptureGroupStructurePage(nodeTitle);
    }

    @Then("the user should see the actual snapshot matching the expected snapshot for <nodeTitle> group structure page")
    public void compareSnapshotsForGroupStructure(@Named("nodeTitle") String nodeTitle){
        pageObject.groupStructurePage().compareSnapshotsForGroupStructure(nodeTitle);
    }

    @Then("the user should see the indented list of subsidiaries for the ultimate owner that are owned through majority ownership path or null percent, ordered by percent ownership, then alphabetically by legal title in group structure page $subsidiariesExamTable")
    public void sVerifySubsidiariesForUltimateOwner(ExamplesTable subsidiariesExamTable){
        pageObject.groupStructurePage().sVerifySubsidiariesForUltimateOwner(subsidiariesExamTable);
    }

    @Then("the user should be able to save the file including all content of current page regardless of screen resolution or browser viewport (Applied filters and highlights will be shown on saved file) in the group structure page <nodeTitle>")
    public void verifySavedPDFGroupStructureFile(@Named("nodeTitle") String nodeTitle){
        pageObject.groupStructurePage().verifySavedPDFGroupStructureFile(nodeTitle);
    }
}
