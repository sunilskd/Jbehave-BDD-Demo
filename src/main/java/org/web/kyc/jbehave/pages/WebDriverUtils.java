package org.web.kyc.jbehave.pages;

import org.apache.http.NameValuePair;
import org.jbehave.web.selenium.WebDriverPage;
import org.jbehave.web.selenium.WebDriverProvider;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.web.kyc.rest.HttpRequest;
import org.web.kyc.utils.ReadProperties;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.web.kyc.jbehave.pages.CommonUtils.waitForInMilliSeconds;

/* Contains commonUtils webdriver methods to be used in page classes */

public class WebDriverUtils extends WebDriverPage {

    public static List<NameValuePair> nvPairs = new ArrayList<>();
    private static ReadProperties readProperties;
    private static HttpRequest httpRequest;

    public WebDriverUtils(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public static ReadProperties readProperties() {
        if (readProperties == null) {
            readProperties = new ReadProperties();
        }
        return readProperties;
    }

    public static HttpRequest httpRequest() {
        if (httpRequest == null) {
            httpRequest = new HttpRequest();
        }
        return httpRequest;
    }

    public String getWebElementText(By by) {
        return findElement(by).getText();
    }

    public void clickOnWebElement(By by) {
        findElement(by).click();
    }

    public List<WebElement> getWebElements(By by) {
        return findElements(by);
    }

    public WebElement getWebElement(By by) {
        return findElement(by);
    }

    public void waitForWebElementToAppear(By by) {
        try {
            WebDriverWait wait = new WebDriverWait(getDriverProvider().get(), 20000);
            wait.until(ExpectedConditions.visibilityOfElementLocated(by));
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
    }

    public void waitForWebElementToDisappear(By by) {
        try {
            WebDriverWait wait = new WebDriverWait(getDriverProvider().get(), 20000);
            wait.until(ExpectedConditions.invisibilityOfElementLocated(by));
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
    }

    /* Returns true if element is present */
    public Boolean isWebElementDisplayed(By by) {
        manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        return findElements(by).size() != 0;
    }

    public List<String> getWebElementsAttributeValue(By by, String attribute) {
        List<WebElement> webElements = getWebElements(by);
        ArrayList attributeValue = new ArrayList<>();
        for (int i = 0; i < webElements.size(); i++) {
            attributeValue.add(webElements.get(i).getAttribute(attribute));
        }
        return attributeValue;
    }

    public String getElementIndexByValue(By by, String value) {
        String index = "";
        List<WebElement> webElementsList = findElements(by);
        for (int i = 0; i < webElementsList.size(); i++) {
            if (webElementsList.get(i).getText().equals(value)) {
                index = Integer.toString(i + 1);
            }
        }
        return index;
    }

    public void enterStringInInputBox(By by, String inputString) {
        findElement(by).clear();
        findElement(by).sendKeys(inputString);
    }

    public List<String> getWebElementsText(By by) {
        List<String> webElementsText = new ArrayList<String>();
        for (int i = 0; i < findElements(by).size(); i++) {
            webElementsText.add(findElements(by).get(i).getText());
        }
        return webElementsText;
    }

    public void waitForPageToLoad(Long seconds) {
        manage().timeouts().implicitlyWait(seconds, TimeUnit.SECONDS);
    }

    public void openLinkInNewWindow(By by) {
        Actions action = new Actions(getDriverProvider().get());
        WebElement element = findElement(by);
        action.moveToElement(element);
        // Right click and select the option ' Open in new window'
        action.contextClick(element).sendKeys(Keys.ARROW_DOWN).sendKeys(Keys.ARROW_DOWN).sendKeys(Keys.ENTER).build().perform();

        // Switch to new window
        for (String Handle : getWindowHandles()) {
            switchTo().window(Handle);
        }
        waitForPageToLoad(15000L);
    }

    public void takeSnapshot(String path){
        waitForInMilliSeconds(5000L);
        getDriverProvider().saveScreenshotTo(path);
    }

    public void moveSliderBarTo(By by, int x){
        waitForInMilliSeconds(2000L);
        /* Clicking and holding on the slider bar and move by offset*/
        moveMouseTo(by);
        getActions().clickAndHold(findElement(by)).moveByOffset(x, 0).build().perform();
        getActions().release(findElement(by)).build().perform();
        waitForInMilliSeconds(3000L);
    }

    public void moveMouseTo(By by) {
        getActions().moveToElement(findElement(by)).build().perform();
    }

    public void refreshCurrentPage(){
        navigate().refresh();
    }

    public List<String> getWebElementsTextJS(String xpath){

        String script = "function getText()" +
                "{" +
                "var iterator = window.document.evaluate(\"" + xpath + "\", document, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null);\n" +
                "var list = [];\n" +
                "try {\n" +
                "  var thisNode = iterator.iterateNext();\n" +
                "  \n" +
                "  while (thisNode) {\n" +
                "    //alert( thisNode.textContent );\n" +
                "    list.push(thisNode.textContent);\n" +
                "    thisNode = iterator.iterateNext();\n" +
                "  }            \n" +
                "}\n" +
                "catch (e) {\n" +
                "  dump( 'Error: Document tree modified during iteration ' + e );\n" +
                "}" +
                "return list" +
                "};" +
                "return getText()";

        return (List<String>) executeScript(script);

    }

    public String getWebElementTextJS(String xpath){

        String script = "function getText()" +
                "{" +
                "var iterator = window.document.evaluate(\"" + xpath + "\", document, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null);\n" +
                "var list = [];\n" +
                "try {\n" +
                "  var thisNode = iterator.iterateNext();\n" +
                "  \n" +
                "  while (thisNode) {\n" +
                "    //alert( thisNode.textContent );\n" +
                "    list.push(thisNode.textContent);\n" +
                "    thisNode = iterator.iterateNext();\n" +
                "  }            \n" +
                "}\n" +
                "catch (e) {\n" +
                "  dump( 'Error: Document tree modified during iteration ' + e );\n" +
                "}" +
                "return list[0]" +
                "};" +
                "return getText()";

        return (String) executeScript(script);

    }

}
