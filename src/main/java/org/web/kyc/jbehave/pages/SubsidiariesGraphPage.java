package org.web.kyc.jbehave.pages;

import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.By;

public class SubsidiariesGraphPage extends WebDriverUtils {

    private By subs_graph_xpath = By.xpath("//*[local-name()='g'][16] //*[local-name()='text'][1]");

    public SubsidiariesGraphPage(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public void verifySubsGraph() {
        System.out.print(getWebElementText(subs_graph_xpath));
    }
}
