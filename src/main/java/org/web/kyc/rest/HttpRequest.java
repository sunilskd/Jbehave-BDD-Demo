package org.web.kyc.rest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthPolicy;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.web.kyc.uri.UriBuilder;
import org.web.kyc.utils.ReadProperties;
import org.web.kyc.xml.XmlDocument;
import org.web.kyc.xqueries.XQueryEnum;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class HttpRequest {

    HttpClient httpClient = new HttpClient();
    ReadProperties readProperties = new ReadProperties();
    UriBuilder uriBuilder = new UriBuilder();
    private Document results;

    public Response executeDatabaseQuery(String xquery, List<NameValuePair> nvPairs) {
        httpClient.getState().setCredentials(
                new AuthScope(readProperties.getMlHost(), readProperties.getMlPort(), "public"),
                new UsernamePasswordCredentials(readProperties.getMlUsername(), readProperties.getMlPassword()));

        List<String> authPrefs = new ArrayList<>();
        authPrefs.add(AuthPolicy.DIGEST);
        httpClient.getParams().setParameter(AuthPolicy.AUTH_SCHEME_PRIORITY, authPrefs);

        GetMethod httpGet = new GetMethod(uriBuilder.constructURLWithMultipleParameters(readProperties.getMlScheme(),
                readProperties.getMlHost(),
                readProperties.getMlPort(),
                readProperties.getMlPath(), xquery, nvPairs));
        int status = 0;
        Response response = null;

        try {
            status = httpClient.executeMethod(httpGet);
            response = new Response(new XmlDocument(httpGet.getResponseBodyAsString()), httpGet.getStatusCode());
        } catch (Exception ignored) {

        } finally {
            httpGet.releaseConnection();
        }

        if (status != HttpStatus.SC_OK) {
            throw new RuntimeException("Admin query returned with error code: " + status);
        }

        return response;
    }

    public Document getResultsFormDataBase(XQueryEnum xqueryEnum, List<NameValuePair> nvPairs) {
        try {
            results = (executeDatabaseQuery(xqueryEnum.getXQueryName(), nvPairs)).getXmlDocument().toDomRepresentation().getDocument();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return results;
    }

    public ArrayList getElementValuesByTagName(XQueryEnum xqueryEnum, List<NameValuePair> nvPairs, String tagName) {
        ArrayList values = new ArrayList();
        NodeList nodes = getResultsFormDataBase(xqueryEnum, nvPairs).getElementsByTagName(tagName);
        for (int i = 0; i < nodes.getLength(); i++) {
            values.add(i, nodes.item(i).getTextContent());
        }
        return values;
    }

}