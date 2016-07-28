package org.web.kyc.comparator;
import org.im4java.core.CompareCmd;
import org.im4java.core.ConvertCmd;
import org.im4java.core.IM4JavaException;
import org.im4java.process.StandardStream;
import org.im4java.core.IMOperation;

import java.io.IOException;

import static org.web.kyc.jbehave.pages.WebDriverUtils.readProperties;

/** Compare Images **/

public class Comparator {

    public static boolean compareImages(String exp, String act, String diff){

        convertImage(exp);
        convertImage(act);

        // This instance wraps the compare command
        CompareCmd compare = new CompareCmd();

        // For metric-output
        compare.setErrorConsumer(StandardStream.STDERR);
        IMOperation compareOp = new IMOperation();

        // Set the compare metric
        compareOp.metric("mae");

        // Add the expected image
        compareOp.addImage(exp);

        // Add the current image
        compareOp.addImage(act);

        // This stores the difference
        compareOp.addImage(diff);

        try {
            // Do the compare
            compare.setSearchPath(readProperties().getImageMagicPath());
            compare.run(compareOp);
            return true;
        }
        catch (Exception ex) {
            return false;
        }
    }

    public static void convertImage(String exp){
        ConvertCmd convert = new ConvertCmd();
        convert.setSearchPath(readProperties().getImageMagicPath());
        IMOperation convertOp = new IMOperation();
        convertOp.addImage(exp);
        convertOp.resize(1900, 1900);
        convertOp.addImage(exp);
        try {
            convert.run(convertOp);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (IM4JavaException e) {
            e.printStackTrace();
        }
    }

}
