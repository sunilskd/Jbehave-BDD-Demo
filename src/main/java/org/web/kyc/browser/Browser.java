package org.web.kyc.browser;
import org.web.kyc.utils.ReadProperties;

public class Browser {
    ReadProperties readProperties = new ReadProperties();

    public void setBrowser() {
        if (System.getProperty("browser") == null) {
            if (readProperties.getBrowser().equals("")) {
                /* Setting default browser to FIREFOX */
                System.setProperty("browser", "FIREFOX");
            } else {
                System.setProperty("browser", readProperties.getBrowser());
            }
        }
        getWebDriver(System.getProperty("browser"));
    }

    public void getWebDriver(String browser) {
        switch (browser.toUpperCase()) {
            case "CHROME":
                System.setProperty("webdriver.chrome.driver", getClass().getResource("/ChromeDriver.exe").getPath());
                break;

            case "IE":
                System.setProperty("webdriver.ie.driver", getClass().getResource("/InternetExplorerDriver.exe").getPath());
                break;
        }
    }
}

