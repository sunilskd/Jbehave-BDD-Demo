package org.web.kyc.jbehave;

import org.jbehave.core.embedder.Embedder;
import org.jbehave.core.io.CodeLocations;
import org.jbehave.core.io.StoryFinder;
import org.jbehave.web.selenium.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.junit.runners.Parameterized.Parameters;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

@RunWith(Parallelized.class)
public class RunTestsInParallel {

    public static WebDriverProvider webDriverProvider;
    public static String browser;
    public String storyName;

    public RunTestsInParallel(String browser, String storyName) {
        this.browser = browser;
        this.storyName = storyName;
    }

        @Before
        public void setUp () {
            String URL = "http://localhost:4444/wd/hub";
            DesiredCapabilities desiredCapabilities = new DesiredCapabilities();
            desiredCapabilities.setCapability("browserName", browser);
            System.setProperty("REMOTE_WEBDRIVER_URL", URL);
            webDriverProvider = new RemoteWebDriverProvider(desiredCapabilities);
        }

        @After
        public void tearDown () {
            webDriverProvider.get().quit();
        }

        @Parameters
        public static Collection<Object[]> data () {
            Object[][] data = new Object[][]{
                      {"chrome", "+audit"}};
            return Arrays.asList(data);
        }

        @Test
        public void runStories() {
            Embedder storyEmbedder = new StoryEmbedder(webDriverProvider);
            List<String> metaFiltersList = newArrayList(storyName.split(","));
            List<String> storyPaths = new StoryFinder().findPaths(CodeLocations.codeLocationFromPath("./src/main/resources"), "**/*.story", "");
            storyEmbedder.useMetaFilters(metaFiltersList);
            storyEmbedder.runStoriesAsPaths(storyPaths);
        }

}
