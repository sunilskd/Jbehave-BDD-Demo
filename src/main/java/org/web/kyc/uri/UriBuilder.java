package org.web.kyc.uri;

import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URIBuilder;

import java.net.URISyntaxException;
import java.util.List;

public class UriBuilder {

    public String constructURLWithMultipleParameters(String scheme, String host, int port, String path, String xquery, List<NameValuePair> nvPairs) {
        URIBuilder builder = new URIBuilder();
        try {
            return builder.setScheme(scheme)
                    .setHost(host)
                    .setPort(port)
                    .setPath(path + xquery)
                    .addParameters(nvPairs).build().toString();
        }
        catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }
}
