package org.web.kyc.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ReadProperties {

    private String url;
    private String browser;
    private String stories;
    private String kycUser;
    private String uboUser;
    private String mlHost;
    private String mlPort;
    private String mlUsername;
    private String mlPassword;
    private String mlScheme;
    private String mlPath;
    private String snapshotPath;
    private String imageMagicPath;
    private String downloadPath;

    public ReadProperties() {
        setUrl(getProjectProperties("testRunner.properties", "kyc.web.url"));
        setBrowser(getProjectProperties("testRunner.properties", "kyc.web.browser"));
        setStories(getProjectProperties("testRunner.properties", "kyc.web.story"));
        setKycUser(getProjectProperties("testRunner.properties", "kyc.kyc.user.login.id"));
        setUboUser(getProjectProperties("testRunner.properties", "kyc.ubo.user.login.id"));
        setMlHost(getProjectProperties("testRunner.properties", "ml.admin.host"));
        setMlPort(getProjectProperties("testRunner.properties", "ml.admin.port"));
        setMlUsername(getProjectProperties("testRunner.properties", "ml.admin.username"));
        setMlPassword(getProjectProperties("testRunner.properties", "ml.admin.password"));
        setMlScheme(getProjectProperties("testRunner.properties", "ml.admin.scheme"));
        setMlPath(getProjectProperties("testRunner.properties", "ml.admin.path"));
        setSnapshotPath(getProjectProperties("testRunner.properties", "kyc.snapshot.path"));
        setImageMagicPath(getProjectProperties("testRunner.properties", "image.magic.path"));
        setImageMagicPath(getProjectProperties("testRunner.properties", "downloadPath"));
    }

    public String getMlPath() {
        return mlPath;
    }

    public void setMlPath(String mlPath) {
        this.mlPath = mlPath;
    }

    public String getMlScheme() {
        return mlScheme;
    }

    public void setMlScheme(String mlScheme) {
        this.mlScheme = mlScheme;
    }

    public String getMlHost() {
        return mlHost;
    }

    public void setMlHost(String mlHost) {
        this.mlHost = mlHost;
    }

    public int getMlPort() {
        return Integer.parseInt(mlPort);
    }

    public void setMlPort(String mlPort) {
        this.mlPort = mlPort;
    }

    public String getMlUsername() {
        return mlUsername;
    }

    public void setMlUsername(String mlUsername) {
        this.mlUsername = mlUsername;
    }

    public String getMlPassword() {
        return mlPassword;
    }

    public void setMlPassword(String mlPassword) {
        this.mlPassword = mlPassword;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser;
    }

    public String getStories() {
        return stories;
    }

    public void setStories(String stories) {
        this.stories = stories;
    }

    public String getUboUser() {
        return uboUser;
    }

    public void setUboUser(String uboUser) {
        this.uboUser = uboUser;
    }

    public String getKycUser() {
        return kycUser;
    }

    public void setKycUser(String kycUser) {
        this.kycUser = kycUser;
    }

    public String getSnapshotPath() {
        return snapshotPath;
    }

    public void setSnapshotPath(String snapshotPath) {
        this.snapshotPath = snapshotPath;
    }

    public String getImageMagicPath() {
        return imageMagicPath;
    }

    public void setImageMagicPath(String imageMagicPath) {
        this.imageMagicPath = imageMagicPath;
    }

    public String getDownloadPath() {
        return downloadPath;
    }

    public void setDownloadPath(String downloadPath) {
        this.downloadPath = downloadPath;
    }

    public String getProjectProperties(String propertyFile, String property) {
        Properties properties = new Properties();
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propertyFile);
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties.getProperty(property);
    }
}
