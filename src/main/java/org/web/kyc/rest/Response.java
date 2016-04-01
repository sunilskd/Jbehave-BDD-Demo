package org.web.kyc.rest;

import org.web.kyc.xml.XmlDocument;

public class Response {

    protected XmlDocument xmlDocument;
    protected int statusCode;

    public Response(XmlDocument xmlDocument, int statusCode) {
        this.xmlDocument = xmlDocument;
        this.statusCode = statusCode;
    }

    public XmlDocument getXmlDocument() {
        return xmlDocument;
    }
}