package org.web.kyc.comparator;
import org.im4java.core.CompareCmd;
import org.im4java.process.StandardStream;
import org.im4java.core.IMOperation;
import org.jbehave.web.selenium.WebDriverPage;
import org.jbehave.web.selenium.WebDriverProvider;
import org.web.kyc.utils.ReadProperties;

import static org.web.kyc.jbehave.pages.WebDriverUtils.readProperties;

/** Compare Images **/

public class Comparator extends WebDriverPage {

    public Comparator(WebDriverProvider driverProvider) {
        super(driverProvider);
    }

    public static boolean compareImages(String exp, String act, String diff){

        // This instance wraps the compare command
        CompareCmd compare = new CompareCmd();

        // For metric-output
        compare.setErrorConsumer(StandardStream.STDERR);
        IMOperation cmpOp = new IMOperation();

        // Set the compare metric
        cmpOp.metric("mae");

        // Add the expected image
        cmpOp.addImage(exp);

        // Add the current image
        cmpOp.addImage(act);

        // This stores the difference
        cmpOp.addImage(diff);

        try {
            // Do the compare
            compare.setSearchPath(readProperties().getImageMagicPath());
            compare.run(cmpOp);
            return true;
        }
        catch (Exception ex) {
            return false;
        }
    }
}
