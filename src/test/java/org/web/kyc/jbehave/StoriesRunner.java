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
import org.jbehave.core.steps.ParameterConverters;
import org.jbehave.core.steps.SilentStepMonitor;
import org.jbehave.web.selenium.*;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.web.kyc.browser.Browser;
import org.web.kyc.reports.BarChart;
import org.web.kyc.reports.JBehaveReport;
import org.web.kyc.reports.PerFeaturePieChart;
import org.web.kyc.reports.PieChart;
import org.web.kyc.jbehave.pages.PageObject;
import org.web.kyc.jbehave.steps.*;
import org.web.kyc.utils.ReadProperties;
import org.web.kyc.utils.TestRecorder;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import static org.jbehave.core.io.CodeLocations.codeLocationFromClass;
import static org.web.kyc.utils.FilesUtils.copyDirectory;
import static org.web.kyc.utils.FilesUtils.directoryCleanUp;
import static org.web.kyc.reports.BarChart.createBarChart;

public class StoriesRunner extends JUnitStories {

    /* Selenium HUB URL*/
    public static final String URL = "http://localhost:4444/wd/hub";

    static Browser browser = new Browser();
    private static WebDriverProvider driverProvider;
    private static WebDriverSteps lifeCycleSteps;
    private static PageObject pageObject;
    static ReadProperties readProperties = new ReadProperties();
    private SeleniumContext context = new SeleniumContext();
    private ContextView contextView = new LocalFrameContextView().sized(50, 50);
    private TestRecorder testRecorder = new TestRecorder();
    private PieChart pieChart = new PieChart();
    private PerFeaturePieChart perFeaturePieChart = new PerFeaturePieChart();
    private JBehaveReport jbehaveReport = new JBehaveReport();
    private BarChart barChart;

    /* /* Browserstack credentials */
//    public static final String USERNAME = "ravisahu1";
//    public static final String AUTOMATE_KEY = "usU2zSencBAxxm8Nniux";
//    public static final String URL = "https://" + USERNAME + ":" + AUTOMATE_KEY + "@hub-cloud.browserstack.com/wd/hub";

    /* Customized HTML format class to include screenshot in reports */
    private Format screenShootingFormat = new ScreenShootingHtmlFormat(driverProvider);

    public StoriesRunner() {
        if (lifeCycleSteps instanceof PerStoriesWebDriverSteps) {
                    configuredEmbedder().useExecutorService(new SameThreadExecutors().create(
                    configuredEmbedder()
                            .embedderControls()
                            .useStoryTimeouts("1000")
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
        try {
            if(readProperties.getRecordAFT().equals("true")) {
                testRecorder.startRecording();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @BeforeClass
    public static void setBrowser() {
        browser.setBrowser();
        DesiredCapabilities desiredCapabilities = new DesiredCapabilities();

        /* Browser stack capabilities */
//        desiredCapabilities.setCapability("browser", "IE");
//        desiredCapabilities.setCapability("browser_version", "9.0");
//        desiredCapabilities.setCapability("os", "Windows");
//        desiredCapabilities.setCapability("os_version", "XP");
//        desiredCapabilities.setCapability("browserstack.debug", "true");

        /* Setting browser resolution */
        //desiredCapabilities.setCapability("screenResolution", "1920x1080");

        /* Setting system property REMOTE_WEBDRIVER_URL and desired capabilities */
        if (System.getProperty("browser").equals("remote")) {

            System.setProperty("REMOTE_WEBDRIVER_URL", URL);

            /* FIREFOX - firefox; IE- internet explorer; CHROME - chrome*/
            desiredCapabilities.setBrowserName(readProperties.getRemoteBrowser());
            //desiredCapabilities.setCapability("browserstack.local", "true");
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

        try {
            if(readProperties.getRecordAFT().equals("true")) {
                testRecorder.stopRecording();
                /* Rename file as per the stories */
                testRecorder.renameFile(getListOfStoriesToRun());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        /* Creating pie chart for each story and the consolidated results */
        pieChart.createPieChart();

        /* Creating feature bar chart*/
        barChart.createBarChart("UBO Features Chart");

        /* Creating feature pie chart*/
        //perFeaturePieChart.createPieChart("KYC Features Bar Chart");

        /*Updating the adoc href to point to correct adoc files*/
        jbehaveReport.updateJBehaveReports();
    }

    @Override
    public Configuration configuration() {
        Class<? extends Embeddable> embeddableClass = this.getClass();
        return new SeleniumConfiguration()
                .useSeleniumContext(context)
                .useWebDriverProvider(driverProvider)
                .useStepMonitor(new SeleniumStepMonitor(contextView, context, new SilentStepMonitor()))
                .useStoryLoader(new LoadFromClasspath(embeddableClass))
                .useParameterConverters(new ParameterConverters().addConverters(new ParameterConverters.DateConverter(new SimpleDateFormat("yyyy-MM-dd"))))
                .useStoryReporterBuilder(new StoryReporterBuilder()
                        .withCodeLocation(codeLocationFromClass(embeddableClass))
                        .withFormats(org.jbehave.core.reporters.Format.STATS,
                                        org.jbehave.core.reporters.Format.CONSOLE,
                                        screenShootingFormat,
                                        AsciidoctorStoryReporter.ASCIIDOC)
                        .withDefaultFormats()
                        .withFailureTrace(true));
    }

    @Override
    public InjectableStepsFactory stepsFactory() {
        Configuration configuration = configuration();
        return new InstanceStepsFactory(configuration,
                /* Add all step classes here */
                new CommonSteps(driverProvider),
                new OwnersSteps(driverProvider),
                new SubsidiariesSteps(driverProvider),
                new EntityDetailsSteps(driverProvider),
                new GroupStructureSteps(driverProvider),
                lifeCycleSteps,
                new AuditSteps(driverProvider),
                new GraphsSteps(driverProvider),
                new GraphControlsSteps(driverProvider),
                new SidePanelSteps(driverProvider),
                new ErrorScreenSteps(driverProvider),
                new BAIntegrationSteps(driverProvider),
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
