package org.web.kyc.jbehave;

import org.jbehave.core.Embeddable;
import org.jbehave.core.configuration.Configuration;
import org.jbehave.core.embedder.executors.SameThreadExecutors;
import org.jbehave.core.io.CodeLocations;
import org.jbehave.core.io.LoadFromClasspath;
import org.jbehave.core.io.StoryFinder;
import org.jbehave.core.junit.JUnitStories;
import org.jbehave.core.reporters.Format;
import org.jbehave.core.reporters.StoryReporterBuilder;
import org.jbehave.core.steps.InjectableStepsFactory;
import org.jbehave.core.steps.InstanceStepsFactory;
import org.jbehave.core.steps.SilentStepMonitor;
import org.jbehave.web.selenium.*;
import org.junit.After;
import org.junit.BeforeClass;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.web.kyc.browser.Browser;
import org.web.kyc.jbehave.pages.Pages;
import org.web.kyc.jbehave.steps.CommonSteps;
import org.web.kyc.jbehave.steps.OwnersSteps;
import org.web.kyc.jbehave.steps.SubsidiariesSteps;
import org.web.kyc.utils.FileUtils;
import org.web.kyc.utils.ReadProperties;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import static org.jbehave.core.io.CodeLocations.codeLocationFromClass;
import static org.jbehave.core.reporters.Format.CONSOLE;

public class StoriesRunner extends JUnitStories {

    ReadProperties readProperties = new ReadProperties();

    static Browser browser = new Browser();
    private static WebDriverProvider driverProvider;
    private SeleniumContext context = new SeleniumContext();
    private ContextView contextView = new LocalFrameContextView().sized(500, 100);
    private static WebDriverSteps lifeCycleSteps;
    private static Pages pages;

    /* Browserstack credentials */
    public static final String USERNAME = "ravisahu1";
    public static final String AUTOMATE_KEY = "usU2zSencBAxxm8Nniux";
    public static final String URL = "http://" + USERNAME + ":" + AUTOMATE_KEY + "@hub.browserstack.com/wd/hub";

    @BeforeClass
    public static void setBrowser() {
        browser.setBrowser();

        /* Setting system property REMOTE_WEBDRIVER_URL and desired capabilities */
        if (System.getProperty("browser").equals("remote")) {
            System.setProperty("REMOTE_WEBDRIVER_URL", URL);
            DesiredCapabilities desiredCapabilities = new DesiredCapabilities();
            desiredCapabilities.setCapability("browserstack.local", "true");

            driverProvider = new RemoteWebDriverProvider(desiredCapabilities);
        } else {
            driverProvider = new PropertyWebDriverProvider();
        }

        lifeCycleSteps = new PerStoriesWebDriverSteps(driverProvider);
        pages = new Pages(driverProvider);
    }

    /* Copy reports to build directory*/
    @After
    public void styleJBehaveReports(){
        try {
            File srcDir = new File("./src/main/resources/reports");
            File destDir = new File("./build/classes/jbehave/view");
            if (destDir.exists()) {
                try {
                    FileUtils.copyDirectory(srcDir, destDir);
                } catch (Exception e) {
                    System.out.println("The error message " + e.getMessage());
                }
            }
        } catch (Exception e) {
        }
    }

    public StoriesRunner() {
        if (lifeCycleSteps instanceof PerStoriesWebDriverSteps) {
            configuredEmbedder().useExecutorService(new SameThreadExecutors().create(
                                    configuredEmbedder()
                                            .embedderControls()
                                            ));
            try {
                /* Required to run stories with annotated meta filters */
                configuredEmbedder().useMetaFilters(Arrays.asList(getListOfStoriesToRun().split(",")));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /* Customized HTML format class to include screenshot in reports */
    private Format screenShootingFormat = new ScreenShootingHtmlFormat(driverProvider);

    @Override
    public Configuration configuration() {
        Class<? extends Embeddable> embeddableClass = this.getClass();
        return new SeleniumConfiguration()
                .useSeleniumContext(context)
                .useWebDriverProvider(driverProvider)
                .useStepMonitor(new SeleniumStepMonitor(contextView, context, new SilentStepMonitor()))
                .useStoryLoader(new LoadFromClasspath(embeddableClass))
                .useStoryReporterBuilder(new StoryReporterBuilder()
                        .withCodeLocation(codeLocationFromClass(embeddableClass))
                        .withDefaultFormats()
                        .withFormats(CONSOLE, screenShootingFormat));
    }

    @Override
    public InjectableStepsFactory stepsFactory() {
        Configuration configuration = configuration();
        return new InstanceStepsFactory(configuration,
                /* Add all step classes here */
                new CommonSteps(pages),
                new OwnersSteps(pages),
                new SubsidiariesSteps(pages),
                lifeCycleSteps,
                new WebDriverScreenshotOnFailure(driverProvider, configuration.storyReporterBuilder()));
    }

    /* Run stories through properties file */
    private String getListOfStoriesToRun() throws IOException {
        if (System.getProperty("story") == null) {
            return readProperties.getStories();
        } else {
            return System.getProperty("story");
        }
    }

    @Override
    protected List<String> storyPaths() {
        return new StoryFinder().findPaths(CodeLocations.codeLocationFromPath("./src/main/resources"), "**/*.story", "");
    }

}
