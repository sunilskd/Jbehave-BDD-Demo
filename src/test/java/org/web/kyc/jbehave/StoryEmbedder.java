package org.web.kyc.jbehave;
import org.jbehave.asciidoctor.reporter.AsciidoctorStoryReporter;
import org.jbehave.core.configuration.Configuration;
import org.jbehave.core.embedder.Embedder;
import org.jbehave.core.embedder.EmbedderControls;
import org.jbehave.core.embedder.executors.SameThreadExecutors;
import org.jbehave.core.io.LoadFromClasspath;
import org.jbehave.core.reporters.Format;
import org.jbehave.core.reporters.StoryReporterBuilder;
import org.jbehave.core.steps.*;
import org.jbehave.web.selenium.*;
import org.web.kyc.jbehave.steps.*;
import java.text.SimpleDateFormat;

import static org.jbehave.core.io.CodeLocations.codeLocationFromClass;

public class StoryEmbedder extends Embedder {
	
	private WebDriverProvider webDriverProvider;
	private SeleniumContext context = new SeleniumContext();
	private ContextView contextView = new LocalFrameContextView().sized(50, 50);
	private static WebDriverSteps lifeCycleSteps;
	private Format screenShootingFormat;

	public StoryEmbedder(WebDriverProvider webDriverProvider) {
		this.webDriverProvider = webDriverProvider;
		lifeCycleSteps = new PerStoriesWebDriverSteps(webDriverProvider);
		screenShootingFormat = new ScreenShootingHtmlFormat(webDriverProvider);

        if (lifeCycleSteps instanceof PerStoriesWebDriverSteps) {
            useExecutorService(new SameThreadExecutors().create(
                    embedderControls()));
        }
	}

	 @Override
	    public EmbedderControls embedderControls() {
	        return new EmbedderControls().doIgnoreFailureInStories(true).doIgnoreFailureInView(true);
	    }
	 
	    @Override
	    public Configuration configuration() {
	        Class<? extends StoryEmbedder> embedderClass = this.getClass();
			return new SeleniumConfiguration()
					.useSeleniumContext(context)
					.useWebDriverProvider(webDriverProvider)
					.useStepMonitor(new SeleniumStepMonitor(contextView, context, new SilentStepMonitor()))
					.useStoryLoader(new LoadFromClasspath(embedderClass))
					.useParameterConverters(new ParameterConverters().addConverters(new ParameterConverters.DateConverter(new SimpleDateFormat("yyyy-MM-dd"))))
					.useStoryReporterBuilder(new StoryReporterBuilder()
							.withCodeLocation(codeLocationFromClass(embedderClass))
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
				new CommonSteps(webDriverProvider),
				new OwnersSteps(webDriverProvider),
				new SubsidiariesSteps(webDriverProvider),
				new EntityDetailsSteps(webDriverProvider),
				new GroupStructureSteps(webDriverProvider),
				lifeCycleSteps,
				new AuditSteps(webDriverProvider),
				new GraphsSteps(webDriverProvider),
				new GraphControlsSteps(webDriverProvider),
				new SidePanelSteps(webDriverProvider),
				new ErrorScreenSteps(webDriverProvider),
				new BAIntegrationSteps(webDriverProvider),
				new WebDriverScreenshotOnFailure(webDriverProvider, configuration.storyReporterBuilder()));
	}

}
