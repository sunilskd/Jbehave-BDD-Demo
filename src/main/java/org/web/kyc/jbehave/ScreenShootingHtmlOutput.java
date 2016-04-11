package org.web.kyc.jbehave;

import org.jbehave.core.failures.UUIDExceptionWrapper;
import org.jbehave.core.reporters.StoryReporterBuilder;
import org.jbehave.web.selenium.WebDriverHtmlOutput;
import org.jbehave.web.selenium.WebDriverProvider;
import org.jbehave.web.selenium.WebDriverScreenshotOnFailure;

import java.io.PrintStream;

public class ScreenShootingHtmlOutput extends WebDriverHtmlOutput {

    private WebDriverScreenshotOnFailure screenshotMaker;

    public ScreenShootingHtmlOutput(PrintStream output,
                                    StoryReporterBuilder reporterBuilder,
                                    WebDriverProvider webDriverProvider) {
        super(output, reporterBuilder.keywords());
        screenshotMaker = new WebDriverScreenshotOnFailure(webDriverProvider);
    }

    @Override
    public void failed(String step, Throwable storyFailure) {
        super.failed(step, storyFailure);
        try {
            UUIDExceptionWrapper uuidWrappedFailure =
                    (UUIDExceptionWrapper) storyFailure;
            screenshotMaker.afterScenarioFailure(uuidWrappedFailure);
        } catch (Exception e) {
            System.out.println("Click here to view the snapshot of failed step");
        }
    }
}