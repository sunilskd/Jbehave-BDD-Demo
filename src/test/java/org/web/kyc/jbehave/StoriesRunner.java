package org.web.kyc.jbehave;

import org.jbehave.asciidoctor.reporter.AsciidoctorStoryReporter;
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
import org.junit.Before;
import org.junit.BeforeClass;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.web.kyc.browser.Browser;
import org.web.kyc.jbehave.pages.PageObject;
import org.web.kyc.jbehave.steps.*;
import org.web.kyc.utils.ReadProperties;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import static org.jbehave.core.io.CodeLocations.codeLocationFromClass;
import static org.jbehave.core.reporters.Format.CONSOLE;
import static org.web.kyc.utils.FilesUtils.*;

public class StoriesRunner extends JUnitStories {

    /* Browserstack credentials */
    public static final String USERNAME = "ravisahu1";
    public static final String AUTOMATE_KEY = "usU2zSencBAxxm8Nniux";
    public static final String URL = "http://" + USERNAME + ":" + AUTOMATE_KEY + "@hub.browserstack.com/wd/hub";
    static Browser browser = new Browser();
    private static WebDriverProvider driverProvider;
    private static WebDriverSteps lifeCycleSteps;
    private static PageObject pageObject;
    ReadProperties readProperties = new ReadProperties();
    private SeleniumContext context = new SeleniumContext();
    private ContextView contextView = new LocalFrameContextView().sized(500, 100);

    /* Customized HTML format class to include screenshot in reports */
    private Format screenShootingFormat = new ScreenShootingHtmlFormat(driverProvider);

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

    @Before
    public void cleanUp() {
        directoryCleanUp(new File("./src/test/resources/pdfs/actual"));
        directoryCleanUp(new File("./src/test/resources/pdfs/difference"));
    }

    @BeforeClass
    public static void setBrowser() {
        browser.setBrowser();
        DesiredCapabilities desiredCapabilities = new DesiredCapabilities();
        /* Setting system property REMOTE_WEBDRIVER_URL and desired capabilities */
        if (System.getProperty("browser").equals("remote")) {
            System.setProperty("REMOTE_WEBDRIVER_URL", URL);
            desiredCapabilities.setCapability("browserstack.local", "true");
            driverProvider = new RemoteWebDriverProvider(desiredCapabilities);

        } else if (System.getProperty("browser").equals("firefox")){
                    System.setProperty("JBEHAVE_WEBDRIVER_FIREFOX_PROFILE","KYC-AFT");
                    driverProvider = new FirefoxWebDriverProvider();
        }  else {
                    driverProvider = new PropertyWebDriverProvider();
        }

        lifeCycleSteps = new PerStoriesWebDriverSteps(driverProvider);
        pageObject = new PageObject(driverProvider);
    }

    /* Copy reports to build directory*/
    @After
    public void styleJBehaveReports() {
        try {
            File srcReportsDir = new File("./src/main/resources/reports");
            File destReportsDir = new File("./build/classes/jbehave/view");
            File srcGraphsDir = new File("./src/test/resources/graphs");
            File destGraphsDir = new File("./build/classes/jbehave");
            if (destReportsDir.exists()) {
                try {
                    copyDirectory(srcGraphsDir, destGraphsDir);
                    copyDirectory(srcReportsDir, destReportsDir);
                } catch (Exception e) {
                    System.out.println("The error message " + e.getMessage());
                }
            }
        } catch (Exception e) {
        }
    }

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
                        .withFormats(CONSOLE, screenShootingFormat, AsciidoctorStoryReporter.ASCIIDOC));
    }

    @Override
    public InjectableStepsFactory stepsFactory() {
        Configuration configuration = configuration();
        return new InstanceStepsFactory(configuration,
                /* Add all step classes here */
                new CommonSteps(pageObject),
                new OwnersSteps(pageObject),
                new SubsidiariesSteps(pageObject),
                new EntityDetailsSteps(pageObject),
                new GroupStructureSteps(pageObject),
                lifeCycleSteps,
                new AuditSteps(pageObject),
                new GraphsSteps(pageObject),
                new GraphControlsSteps(pageObject),
                new SidePanelSteps(pageObject),
                new ErrorScreenSteps(pageObject),
                new BAIntegrationSteps(pageObject),
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
