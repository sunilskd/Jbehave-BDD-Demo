package org.web.kyc.reports;
import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.web.kyc.utils.FilesUtils;
import java.io.File;
import java.io.IOException;

public class JBehaveReport {

    File currentDirFile = new File("");
    String projectDir = currentDirFile.getAbsolutePath();

    public void updateJBehaveReports(){
        moveAdocFiles();
        deleteAdocHtmlFiles();
        updateAdocHref();
        addConsolidatedPieChart();
    }

    public void updateAdocHref(){
        Document html = null;
        try {
            html = Jsoup.parse(new File("./build/classes/jbehave/view/reports.html"), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        for (int i=0; i<html.getElementsByAttributeValueContaining("href", "adoc").size(); i++) {
            html.
                    getElementsByAttributeValueContaining("href", "adoc")
                    .get(i)
                    .attr("href", html
                                    .getElementsByAttributeValueContaining("href", "adoc").get(i).attr("href").replace(".html",""));
        }
        final File f = new File("./build/classes/jbehave/view/reports.html");
        try {
            FileUtils.writeStringToFile(f, html.outerHtml(), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addConsolidatedPieChart(){
        Document html = null;
        try {
            html = Jsoup.parse(new File("./build/classes/jbehave/view/reports.html"), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        html.getElementById("mainTable").append("" +
                "<h2>UBO Aggregate Chart</h2>" +
                "<IMG SRC=\".png\" WIDTH=\"600\" HEIGHT=\"400\" BORDER=\"0\" USEMAP=\"#barchart\">" +
                "<br>" +
                "<br>" +
                "<h2>UBO Aggregate Report</h2> "
        );
        final File f = new File("./build/classes/jbehave/view/reports.html");
        try {
            FileUtils.writeStringToFile(f, html.outerHtml(), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void moveAdocFiles() {
        File dir = new File("./build/classes/jbehave/");
        String destPath = "./build/classes/jbehave/view/";
        FilesUtils.copyFiles(dir, destPath, ".adoc");
    }
    private void deleteAdocHtmlFiles() {
        File dir = new File("./build/classes/jbehave/view/");
        FilesUtils.deleteFiles(dir, ".adoc.html");
    }
}
