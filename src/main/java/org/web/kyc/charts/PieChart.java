package org.web.kyc.charts;
import org.apache.commons.io.FileUtils;
import org.jbehave.core.reporters.PostStoryStatisticsCollector;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.urls.StandardPieURLGenerator;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.util.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.awt.*;
import java.io.*;
import java.math.RoundingMode;
import java.util.Scanner;

/**
 * A demo showing how to create an HTML image map for a pie chart.
 *
 */
public class PieChart {

    /**
     * Default constructor.
     */
    public PieChart() {
        super();
    }

    /**
     * The starting point for the demo.
     *
     */
    //public static void main(final String[] args) {
    public void createPieChart() {
        // create a chart

        PostStoryStatisticsCollector stat;
        String pass, total, fail, notPerformed, pending;
        Double passCount=0.0, failCount=0.0,totalCount=0.0,pendingCount=0.0;

        try {
            File dir = new File("F:/workspace/kyc-aft/build/classes/jbehave/");

            File [] files = dir.listFiles(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    return name.endsWith(".stats");

                }
            });

            for (File statsfile : files) {
                String fileNames = (statsfile.getPath());
                System.out.println(statsfile.getName());
                File text = new File(fileNames);
                //Creating Scanner instnace to read File in Java
                Scanner scnr = new Scanner(text);
                String[] result = new String[28];

                for (int i = 0; i < 27; i++) {
                    result[i] = scnr.next();
                }
                pass = result[13];
                total = result[17];
                fail = result[25];
                pending = result[22];
                // if(totalCount>0){  drawChart(failCount, pendingCount, passCount, totalCount);}
                failCount = failCount + Integer.parseInt(Character.toString(fail.charAt(fail.length() - 1)));
                passCount = passCount + Integer.parseInt(Character.toString(pass.charAt(pass.length() - 1)));
                pendingCount = pendingCount + Integer.parseInt(Character.toString(pending.charAt(pending.length() - 1)));
                totalCount = totalCount + Integer.parseInt(Character.toString(total.charAt(total.length() - 1)));

                System.out.println(passCount + "      " + totalCount + "      " + failCount + "      " + pendingCount);
                if (Integer.parseInt(Character.toString(total.charAt(total.length() - 1)))>0){

                    drawChart(Double.parseDouble
                                    (Character.toString(fail.charAt(fail.length() - 1))),
                            Double.parseDouble(Character.toString(pending.charAt(pending.length() - 1))),
                            Double.parseDouble(Character.toString(pass.charAt(pass.length() - 1))),
                            Double.parseDouble(Character.toString(total.charAt(total.length() - 1))),
                            statsfile.getName().split("stories",(statsfile.getName().length()-6))[1]);

                    drawChart(failCount, pendingCount, passCount, totalCount,"UBO Consolidated Report");
                }
            }

        } catch (FileNotFoundException e) {
        }
        updateJBehaveReports();
    }

    public static void drawChart(Double fail,Double pending, Double pass,Double total, String storyName) {

        final DefaultPieDataset data = new DefaultPieDataset();
        Double failPercent, passPercent, pendingPercent, totalPercent;
        failPercent = Double.valueOf(Math.round((fail/total)*100));
        passPercent = Double.valueOf(Math.round((pass/total)*100));
        pendingPercent = Double.valueOf(Math.round((pending/total)*100));
        data.setValue("Fail ="+failPercent +"%", fail);
        data.setValue("Pending ="+pendingPercent +"%", pending);
        data.setValue("Pass ="+passPercent +"%", pass);

        JFreeChart chart = null;
        final boolean drilldown = true;

        // create the chart...
        if (drilldown) {
            final PiePlot plot = new PiePlot(data);
            //          plot.setInsets(new Insets(0, 5, 5, 5));
            // plot.setToolTipGenerator(new StandardPieItemLabelGenerator());
            Color jbehaveGreen = new Color(76,153,0);
            Color jbehaveAmber = new Color(204,204,0);

            plot.setSectionPaint("Fail ="+failPercent +"%", Color.RED);
            plot.setSectionPaint("Pending ="+pendingPercent +"%", jbehaveAmber);
            plot.setSectionPaint("Pass ="+passPercent +"%", jbehaveGreen);
            plot.setURLGenerator(new StandardPieURLGenerator("pie_chart_detail.jsp"));
            chart = new JFreeChart(storyName, JFreeChart.DEFAULT_TITLE_FONT, plot, true);
        } else {
            chart = ChartFactory.createPieChart(
                    "UBO AFT Results",  // chart title
                    data,                // data
                    true,                // include legend
                    true,
                    true
            );

        }
        chart.setBackgroundPaint(java.awt.Color.white);


        // ****************************************************************************
        // * JFREECHART DEVELOPER GUIDE                                               *
        // * The JFreeChart Developer Guide, written by David Gilbert, is available   *
        // * to purchase from Object Refinery Limited:                                *
        // *                                                                          *
        // * http://www.object-refinery.com/jfreechart/guide.html                     *
        // *                                                                          *
        // * Sales are used to provide funding for the JFreeChart project - please    *
        // * support us so that we can continue developing free software.             *
        // ****************************************************************************

        // save it to an image

        try {
            final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
            final File file1 = new File(storyName+".png");
            ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
        /*
            // write an HTML page incorporating the image with an image map
            final File file2 = new File(storyName+".html");
            final OutputStream out = new BufferedOutputStream(new FileOutputStream(file2));
            final PrintWriter writer = new PrintWriter(out);
            writer.println("<HTML>");
            writer.println("<HEAD><TITLE>JFreeChart Image Map Demo 2</TITLE></HEAD>");
            writer.println("<BODY>");
//            ChartUtilities.writeImageMap(writer, "chart", info);
            writer.println("<IMG SRC=\"piechart100.png\" "
                    + "WIDTH=\"600\" HEIGHT=\"400\" BORDER=\"0\" USEMAP=\"#chart\">");
            writer.println("</BODY>");
            writer.println("</HTML>");
            writer.close();
        */
        } catch (IOException e) {
            System.out.println(e.toString());
        }
    }

    public static void updateJBehaveReports(){
        Document html = null;
        try {
            html = Jsoup.parse(new File("F:\\workspace\\kyc-automated-functional-test\\build\\classes\\jbehave\\view\\reports.html"), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        html.title();
        html.getElementsByClass("story");
        html.getElementsByAttributeValueContaining("href", "adoc");
        for (int i=0; i<html.getElementsByAttributeValueContaining("href", "adoc").size(); i++) {
//                html.getElementsByAttributeValue("href",
//                        html.getElementsByClass("story").get(i).text() + ".html").append("| <a href=\"file:///F:/workspace/kyc-automated-functional-test/build/classes/jbehave/stories.graphs." + html.getElementsByClass("story").get(i).text() + ".adoc\">adoc</a>");
            html.
                    getElementsByAttributeValueContaining("href", "adoc")
                    .get(i)
                    .attr("href", "file:///F:/workspace/kyc-automated-functional-test/build/classes/jbehave/"
                            + html
                            .getElementsByAttributeValueContaining("href", "adoc").get(i).attr("href").replace(".html",""));
        }
        final File f = new File("F:\\workspace\\kyc-automated-functional-test\\build\\classes\\jbehave\\view\\reports.html");
        try {
            FileUtils.writeStringToFile(f, html.outerHtml(), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}



