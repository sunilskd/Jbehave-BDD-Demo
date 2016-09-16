package org.web.kyc.reports;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;
import org.web.kyc.utils.ReadProperties;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.Scanner;

public class BarChart extends ApplicationFrame {

    CategoryDataset categoryDataset = null;
    final DefaultCategoryDataset defaultCategoryDataset = new DefaultCategoryDataset();
    ReadProperties readProperties = new ReadProperties();

    public BarChart(String applicationTitle) {
        super(applicationTitle);
        String pass, total, fail;
        try {
            File dir = new File("./build/classes/jbehave/");

            final String features[] = readProperties.getFeatures().split(",");

            for(int i=0; i<features.length; i++) {
                final int index = i;
                Double passCount=0.0, failCount=0.0,totalCount=0.0;
                File[] statsFiles = dir.listFiles(new FilenameFilter() {
                    @Override
                    public boolean accept(File dir, String name) {
//                    return name.endsWith(".stats");
                        String pattern = "^[a-z]*\\." + features[index].replace(" ","").toLowerCase() + "\\.[a-z A-z]*\\.stats$";
                        return name.matches(pattern);
                    }
                });

                for (File statsFile : statsFiles) {
                    String statsFilePath = (statsFile.getPath());
                    File statFileNames = new File(statsFilePath);

                    //Creating Scanner instances to read File in Java
                    Scanner scnr = new Scanner(statFileNames);
                    String[] result = new String[28];

                    for (int j = 0; j < 27; j++) {
                        result[j] = scnr.next();
                    }
                    pass = result[13];
                    total = result[17];
                    fail = result[25];

                    failCount = failCount + Integer.parseInt(fail.split("=", fail.length())[1]);
                    passCount = passCount + Integer.parseInt(pass.split("=", pass.length())[1]);
                    totalCount = totalCount + Integer.parseInt(total.split("=", total.length())[1]);

                    if (Integer.parseInt(total.split("=", total.length())[1]) > 0) {
                        categoryDataset = createDataset(features[index], totalCount, passCount, failCount);
                    }
                }
            }

            BarRenderer3D renderer3D = new BarRenderer3D();
            renderer3D.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
            renderer3D.setBaseItemLabelsVisible(true);

            JFreeChart barChart = ChartFactory.createBarChart3D(
                    applicationTitle,
                    "Features",
                    "Scenarios",
                    categoryDataset,
                    PlotOrientation.VERTICAL,
                    true, true, true);

            barChart.setBackgroundPaint(java.awt.Color.white);
            barChart.getCategoryPlot().setRenderer(renderer3D);
            ChartPanel chartPanel = new ChartPanel(barChart);
            chartPanel.setPreferredSize(new java.awt.Dimension(1500, 700));
            setContentPane(chartPanel);
            File BarChart = new File("./build/classes/jbehave/view/FeatureChart.png");
            ChartUtilities.saveChartAsPNG( BarChart , barChart , 1100, 500);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private CategoryDataset createDataset(String storyName, Double storyTotal, Double storyPass, Double storyFail) {
        final String total = "Total";
        final String pass = "Pass";
        final String fail = "Fail";
        defaultCategoryDataset.addValue(storyFail, fail, storyName);
        defaultCategoryDataset.addValue(storyTotal, total, storyName);
        defaultCategoryDataset.addValue(storyPass, pass, storyName);
        return defaultCategoryDataset;
    }

    public static void createBarChart(String applicationTitle){
        BarChart barChart = new BarChart(applicationTitle);
        barChart.pack();
        RefineryUtilities.centerFrameOnScreen(barChart);
        barChart.setVisible(false);
    }
}
