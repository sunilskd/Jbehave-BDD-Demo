package org.web.kyc.jbehave.steps;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.web.kyc.jbehave.pages.PageObject;

public class SubsidiariesGraphSteps {

    private final PageObject pageObject;

    public SubsidiariesGraphSteps(PageObject pageObject) {
        this.pageObject = pageObject;
    }

    @Then("the user should see the legal entity $legalEntity, user is currently viewing, as the root in the subsidiaries graph")
    public void verifySubsidiariesGraphRootNode(@Named("legalEntity") String legalEntity){
        pageObject.subsidiariesGraphPage().verifySubsidiariesGraphRootNode(legalEntity);
    }

    @Then("the user should see the list of below subsidiaries in level $level, below the root entity, in the subsidiaries graph $subsidiariesExamTable")
    public void verifySubsidiariesNodes(String level, ExamplesTable subsidiariesExamTable){
        pageObject.subsidiariesGraphPage().verifySubsidiariesNodes(level, subsidiariesExamTable);
    }

    @Then("the user should see message displayed in place of graph explaining there are no subsidiaries")
    public void verifyNoSubsidiariesMsg() {
        pageObject.subsidiariesGraphPage().verifyNoSubsidiariesMsg();
    }

    @Then("the user should see the list of below unique country of operations for each subsidiaries to highlight, sorted alphabetically, in the subsidiaries graphs page $countriesHighlighListExamTable")
    public void sVerifyCountryHighlightList(ExamplesTable countriesHighlighListExamTable) {
        pageObject.subsidiariesGraphPage().sVerifyCountryHighlightList(countriesHighlighListExamTable);
    }

    @When("the user selects a country <country> from the country highlight list in the subsidiaries graph page")
    public void selectCountryHighlight(@Named("country") String country){
        pageObject.subsidiariesGraphPage().selectCountryHighlight(country);
    }

    @When("the user selects another country <changecountry> from the country highlight list in the subsidiaries graph page")
    public void changeCountryHighlight(@Named("changecountry") String changecountry){
        pageObject.subsidiariesGraphPage().selectCountryHighlight(changecountry);
    }


    @When("the user de-selects the selected country by selecting $nocountryhighlights from the country highlight list in the subsidiaries graph page")
    public void selectNoCountryHighlight(@Named("nocountryhighlights") String nocountryhighlights){
        pageObject.subsidiariesGraphPage().selectNoCountryHighlight(nocountryhighlights);
    }
}
