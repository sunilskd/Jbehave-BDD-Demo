package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class GraphsSteps {

    private final PageObject pageObject;

    public GraphsSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @When("the user clicks on the graph button")
    public void clickOnGraphButton(){
        pageObject.graphsPage().clickOnGraphButton();
    }

    @Then("the user should see the legal entity $legalEntity, user is currently viewing, as the root and highlighted in the graphs")
    public void verifyRootNodeInTheGraphs(@Named("legalEntity") String legalEntity){
        pageObject.graphsPage().verifyRootNodeInTheGraphs(legalEntity);
    }

    @Then("the user should see the list of below subsidiaries in level $level, below the root entity, in the graphs $subsidiariesExamTable")
    public void verifySubsInTheGraphs(String level, ExamplesTable subsidiariesExamTable){
        pageObject.graphsPage().verifyGraphNodes(Integer.toString(Integer.parseInt(level)*180), subsidiariesExamTable);
    }

    @Then("the user should see the list of below owners in level $level, above the root entity, in the graphs $ownersExamTable")
    public void verifyOwnersInTheGraphs(String level, ExamplesTable ownersExamTable){
        pageObject.graphsPage().verifyGraphNodes(Integer.toString(0 - (Integer.parseInt(level)*180)), ownersExamTable);
    }

    @Then("the user should see the list of below owners in level $level, above the root entity, in the owners graphs $ownersExamTable")
    public void verifyGraphNodes(String level, ExamplesTable ownersExamTable){
        pageObject.graphsPage().verifyGraphNodes(Integer.toString(500 - (Integer.parseInt(level)*180)), ownersExamTable);
    }

    @Then("the user should not see the multiple appearance bar for subsidiaries indicating the number of times it appears in the graphs")
    public void verifyVisualIndicatorNotDisplayedForSubsidiaries(){
        pageObject.graphsPage().verifyVisualIndicatorNotDisplayedForSubsidiaries();
    }

    @Then("the user should see message displayed in place of graph explaining there are no entities in the graphs")
    public void verifyNoEntitiesMsg() {
        pageObject.graphsPage().verifyNoEntitiesMsg();
    }
}
