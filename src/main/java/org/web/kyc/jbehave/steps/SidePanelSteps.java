package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class SidePanelSteps {

    private final PageObject pageObject;

    public SidePanelSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Then("the user should see below free text in the side panel in the graphs $freeTextExampleTable")
    public void verifyFreeTextInSidePanel(ExamplesTable freeTextExampleTable){
        pageObject.sidePanelUtils().verifyFreeTextInSidePanel(freeTextExampleTable);
    }

    @When("the user clicks on close button on the side panel in the graphs")
    public void closeSidePanel(){
        pageObject.sidePanelUtils().closeSidePanel();
    }

    @Then("the user should see the side panel closed and should be able to continue in the graphs")
    @Alias("the user should not see the side panel for the person, non-person or non-entity in the graphs")
    public void verifySidePanelIsClosed(){
        pageObject.sidePanelUtils().verifySidePanelIsClosed();
    }

    @Then("the user should see complete head office address, regulators and stock exchanges in details section of side panel for the node user clicked in the graphs")
    public void dVerifyDetailsSectionInSidePanel(){
        pageObject.sidePanelUtils().dVerifyDetailsSectionInSidePanel();
    }

    @Then("the user should see list of direct subsidiaries with entity title, country and percentage ownership in directly owns section of side panel for the node user clicked in the graphs")
    public void dVerifyDirectlyOwnsSectionInSidePanel(){
        pageObject.sidePanelUtils().dVerifyDirectlyOwnsSectionInSidePanel();
    }

    @Then("the user should see the side panel still open in the graphs")
    public void verifySidePanelIsOpen(){
        pageObject.sidePanelUtils().verifySidePanelIsOpen();
    }

    @Then("the kyc user should not see ubo list in side panel in the graphs")
    public void verifyUboListIsNotDisplayed(){
        pageObject.sidePanelUtils().verifyUboListIsNotDisplayed();
    }

    @Then("the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <nodeTitle> user clicked in the graphs $uboListExamTable")
    @Alias("the user should see list of ubos with name, entity and percentage ownership in ubo section of side panel for the node <switchNode> user clicked in the graphs $uboListExamTable")
    public void dVerifyUBOSectionInSidePanel(ExamplesTable uboListExamTable){
        pageObject.sidePanelUtils().dVerifyUBOSectionInSidePanel(uboListExamTable);
    }

    @Then("the user should see message displayed in place of list explaining there are no directly owned entities in the graphs")
    public void verifyNoKnowsEntitiesMessage(){
        pageObject.sidePanelUtils().verifyNoKnowsEntitiesMessage();
    }

    @Then("the user should see message displayed in place of list explaining there are no ultimate beneficial owners in the graphs")
    public void verifyNoKnowsEntitiesMessageUBOs(){
        pageObject.sidePanelUtils().verifyNoKnowsEntitiesMessageUBOs();
    }

    @When("the user clicks on the legal entity title <nodeTitle> on the side panel in the graphs")
    public void clickEntityTitleOnSidePanel(@Named("nodeTitle")String nodeTitle){
        pageObject.sidePanelUtils().clickEntityTitleOnSidePanel(nodeTitle);
    }

}
