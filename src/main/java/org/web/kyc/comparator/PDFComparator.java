package org.web.kyc.comparator;
import com.taguru.utility.PDFUtil;

import java.io.IOException;

import static junit.framework.TestCase.assertTrue;

public class PDFComparator {

    static PDFUtil pdfUtil = new PDFUtil();

    public static void comparePDFsContent(String expectedPDf, String actualPDF, String diffPDF) throws IOException {
        pdfUtil.highlightPdfDifference(true);
        pdfUtil.setImageDestinationPath(diffPDF);
        assertTrue(pdfUtil.comparePdfFilesBinaryMode(expectedPDf, actualPDF));
    }
}
