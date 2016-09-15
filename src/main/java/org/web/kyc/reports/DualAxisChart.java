package org.web.kyc.reports;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.Scanner;

/**
 * Created by sahug on 9/15/2016.
 */
public class DualAxisChart extends ApplicationFrame {

    CategoryDataset categoryDataset = null;
    final DefaultCategoryDataset defaultCategoryDataset = new DefaultCategoryDataset();

    public DualAxisChart(String applicationTitle, final String chartTitle) {
        super(applicationTitle);
        String pass, total, fail;
        Double passCount=0.0, failCount=0.0,totalCount=0.0;
        try {
            File dir = new File("./build/classes/jbehave/");
            File[] statsFiles = dir.listFiles(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    //return name.endsWith(".stats");
                    String pattern = "^[a-z]*\\." + chartTitle.replace(" ","").toLowerCase() + "\\.[a-z A-z]*\\.stats$";
                    return name.matches(pattern);
                }
            });

            for (File statsFile : statsFiles) {
                String statsFilePath = (statsFile.getPath());
                File statFileNames= new File(statsFilePath);

                //Creating Scanner instances to read File in Java
                Scanner scnr = new Scanner(statFileNames);
                String[] result = new String[28];

                for (int i = 0; i < 27; i++) {
                    result[i] = scnr.next();
                }
                pass = result[13];
                total = result[17];
                fail = result[25];

                failCount = failCount + Integer.parseInt(fail.split("=", fail.length())[1]);
                passCount = passCount + Integer.parseInt(pass.split("=", pass.length())[1]);
                totalCount = totalCount + Integer.parseInt(total.split("=", total.length())[1]);

                if (Integer.parseInt(total.split("=", total.length())[1]) > 0) {
                        categoryDataset = createDataset(chartTitle, totalCount, passCount, failCount);
                    }
            }

            JFreeChart barChart = ChartFactory.createBarChart(
                    applicationTitle,
                    chartTitle,
                    "Scenario",
                    categoryDataset,
                    PlotOrientation.VERTICAL,
                    true, true, false);

            barChart.setBackgroundPaint(java.awt.Color.white);
            ChartPanel chartPanel = new ChartPanel(barChart);
            chartPanel.setPreferredSize(new java.awt.Dimension(500, 500));
            setContentPane(chartPanel);
            File BarChart = new File(chartTitle.replace(" ","") + "BarChart.png");
            ChartUtilities.saveChartAsPNG( BarChart , barChart , 500, 500);

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

    public static void createBarChart(String applicationTitle, String chartTitle){
        DualAxisChart dualAxisChart = new DualAxisChart(applicationTitle, chartTitle);
        dualAxisChart.pack();
        RefineryUtilities.centerFrameOnScreen(dualAxisChart);
        dualAxisChart.setVisible(false);
    }
}
