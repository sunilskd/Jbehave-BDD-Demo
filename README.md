# KYC UBO Automated Functional Test
Release UBO (In-Progress)

## System Requirement
- JDK 1.7 or less
- Gradle latest version (recommended)
- selenium-server-standalone-2.52.0.jar

## Browser Requirement
- Internet Explorer - IE8 or above
- Chrome - Latest version available
- Firefox - Latest version available

## Firefox profiling and setup
- ### Creating firefox profile manually
- Close all running instances of firefox
- Go to **Start > Run > type firefox.exe -p > Create Profile > Enter new profile name as "KYC-UBO-Automation" > Finish**
- Select **"KYC-UBO-Automation"** from list and Start Firefox
- Go to web app and save the SSL certification

- ### Creating firefox profile using CMD
- > cd C:\Program Files (x86)\Mozilla Firefox
- > firefox -CreateProfile SW_Automation
- Go to web app and save the SSL certification

## Building Automated Functional Test
- Open the file **build.gradle** from IDE
- Let the gradle compile all dependencies and tasks

## Running Automated Functional Test from IDE
- Once gradle has compiled dependencies run **src/test/java/org/web/kyc/jbehave/StoriesRunner.java** as *Junit test*
- By default the test will run on the browser mentioned in **src/main/resources/testRunner.properties** under property *kyc.web.browser*
- The property **kyc.web.browser** can be updated to run the tests on the desired browsers. The valid values are mentioned below -

| Browser | web.aft.webDriver | Note |
| ------- | ----------------- | ---- |
| Firefox | firefox |  |
| Chrome  | chrome |  |
| IE      | ie |  |
| Remote  | remote | Used to run the tests remotely. Please have a look at the instructions mentioned under **Running Automated Functional Test Remotely** |

- By default the story mentioned in **src/main/resources/testRunner.properties** under property *kyc.web.story* will run. Update *kyc.web.story* to run the specific story/ies. **The story name should be preceded by +**
- Multiple stories can be run in a single run by updating the *kyc.web.story* to something like *+Story1,+Story2*.

## Running Automated Functional Test from CMD
- Open CMD and CD to the directory **kyc-ubo-automated-functional-test**
- Run the below command
> gradle clean build runTaggedTestsOnGivenBrowser -PtaggedStory=+StoriesToRun -Pbrowser=BrowserToBeRunOn -x test
- Multiple stories can be run in a single run by updating the *PtaggedStory* to something like *+Story1,+Story2*.
- Select the value for **Pbrowser** from above table

## Running Automated Functional Test Remotely
- Make sure below drivers are present in your local machine and the remote machine you want to run the tests
 1. selenium-server-standalone-2.52.0.jar
 2. InternetExplorerDriver.exe (Used for running the tests in IE)
 3. ChromeDriver.exe (Used for running the tests in Chrome)

- Start the hub in your local machine. To do so run the below command under the directory where the driver is kept -
> java -jar selenium-server-standalone-2.52.0.jar -role hub

- Start the node in your remote machine. To do so run the below command under the directory where the drivers are kept
1. Run tests on Firefox
> java -jar selenium-server-standalone-2.52.0.jar -role webdriver -hub **ip-address-of-hub-machine**:4444/grid/register -remoteHost **ip-address-of-node-machine**:5555 -browser browserName=firefox

2. Run tests on IE
> java -Dwebdriver.ie.driver=**path-to-chrome-driver** -jar selenium-server-standalone-2.52.0.jar -role webdriver -hub **ip-address-of-hub-machine**:4444/grid/register -remoteHost **ip-address-of-node-machine**:5555 -browser browserName=internetExplorer

3. Run tests on Chrome
> java -Dwebdriver.chrome.driver=**path-to-chrome-driver** -jar selenium-server-standalone-2.52.0.jar -role webdriver -hub **ip-address-of-hub-machine**:4444/grid/register -remoteHost **ip-address-of-node-machine**:5555 -browser browserName=chrome