package org.web.kyc.comparator;
import com.taguru.utility.PDFUtil;

import java.io.IOException;

public class PDFComparator {

    static PDFUtil pdfUtil = new PDFUtil();

    public static void comparePDFsContent(String expectedPDf, String actualPDF, String diffPDF) throws IOException {
        pdfUtil.highlightPdfDifference(true);
        pdfUtil.setImageDestinationPath(diffPDF);
        pdfUtil.comparePdfFilesBinaryMode(expectedPDf, actualPDF);
    }
}
